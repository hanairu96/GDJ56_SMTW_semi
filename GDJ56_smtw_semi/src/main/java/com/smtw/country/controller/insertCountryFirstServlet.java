package com.smtw.country.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smtw.country.model.service.CountryService;
import com.smtw.country.model.vo.Country;

/**
 * Servlet implementation class insertCountryFirstServlet
 */
@WebServlet("/country/insertCountryFirst.do")
public class insertCountryFirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCountryFirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 업로드 하기
		String path=request.getServletContext().getRealPath("/upload/country/");
		
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
		
		Enumeration e=mr.getFileNames();//파일 이름을 순서화 시켜서 저장
		String pic="";
		if(e.hasMoreElements()) {
			String filename=(String)e.nextElement();//파일을 반환
			pic = mr.getFilesystemName(filename);
		}
		//multipart/form-data형식으로 전송 되었기 때문에 request.getParameter가 불가능하고 
		//MultipartRequest 객체의 getParamter 메소드를 사용해야 한다.
		String name=null;
		name=mr.getParameter("selectco");
		if(mr.getParameter("selectco").equals("self")) {
			name=mr.getParameter("selfname");
		}else {
			name=mr.getParameter("selectco");
		}
		String lang=mr.getParameter("langEn");
		String tend=mr.getParameter("tend2");
		String place=mr.getParameter("land");
		String wea=mr.getParameter("weather");
		String ontext=mr.getParameter("ontext");
		
		Country c=Country.builder()
				.nName(name)
				.nLanguage(lang)
				.nTend(tend)
				.nPlace(place)
				.nSeason(wea)
				.nImg(pic)
				.npharse(ontext)
				.build();
		
		int result=new CountryService().insertCountry(c);
//		System.out.println(result);
		
		String id=request.getParameter("id");
		
		String msg="",loc="";
		if(result>0) {
			msg="국가정보가 정상적으로 등록되었습니다.";
			loc="/country/countryMain.do?id="+id;
			request.setAttribute("id", id);
		}else {
			msg="등록을 실패하였습니다. 다시 시도해주세요.";
			loc="/country/insertgo.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
