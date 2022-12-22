package com.smtw.country.controller;

import java.io.File;
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
 * Servlet implementation class updateFirstCountryServlet
 */
@WebServlet("/country/updateFirstCountry.do")
public class updateFirstCountryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateFirstCountryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletContext().getRealPath("/upload/country/");
		
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());//파일 객체생성
		
		Enumeration e=mr.getFileNames();
		String pic="";
		if(e.hasMoreElements()) {
			String filename=(String)e.nextElement();
			pic = mr.getFilesystemName(filename);
		}
		
		String ori=mr.getParameter("orifilename");
				
		String name=mr.getParameter("nName");
		String lang=mr.getParameter("langEn");
		String tend=mr.getParameter("tend2");
		String land=mr.getParameter("land");
		String wea=mr.getParameter("weather");
		String text=mr.getParameter("ontext");
		String er=mr.getParameter("er");
		
		Country c=Country.builder()
				.nName(name)
				.nLanguage(lang)
				.nTend(tend)
				.nPlace(land)
				.nSeason(wea)
				.nImg(pic)
				.npharse(text)
				.emergency(er)
				.build();
//		System.out.println(c);
		String id=request.getParameter("id");
		
		int result=new CountryService().updateCountry(c);
		String msg="",loc="";
		if(result>0) {
			msg="국가 정보 수정이 완료되었습니다.";
			loc="/country/countryMain.do?id="+id;
			
			String deletepath=getServletContext().getRealPath("/upload/country/");
			File delFile=new File(deletepath+ori);
			if(delFile.exists()) delFile.delete();
			
			request.getSession().setAttribute("country", c);
			request.setAttribute("id", id);
		}else {
			msg="국가정보 수정을 실패하였습니다.";
			loc="/country/updateCountry.do?nName="+c.getNName();
			
		}
	
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
