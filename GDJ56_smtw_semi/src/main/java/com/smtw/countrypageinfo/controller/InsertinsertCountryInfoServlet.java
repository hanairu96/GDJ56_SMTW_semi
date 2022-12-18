package com.smtw.countrypageinfo.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smtw.country.model.vo.CountryPageInfo;
import com.smtw.countrypageinfo.model.service.CountryPageInfoService;

/**
 * Servlet implementation class InsertCountryInfoServlet
 */
@WebServlet("/countryinfo/insertinfo.do")
public class InsertinsertCountryInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertinsertCountryInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletContext().getRealPath("/upload/");
		
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
		
		Enumeration e=mr.getFileNames();
		String img="";
		if(e.hasMoreElements()) {
			String filename=(String)e.nextElement();
			img = mr.getFilesystemName(filename);
		}
		
		String name=mr.getParameter("nName");
		String lan=mr.getParameter("langagecountry");
		String urban=mr.getParameter("urban");
		String money=mr.getParameter("moneycountry");
		String elect=mr.getParameter("elect");
		String map=mr.getParameter("contryaddress");
		String engcity=mr.getParameter("engcity");
		String clock=mr.getParameter("clockchange");
		
		CountryPageInfo cp=CountryPageInfo.builder()
				.nName(name)
				.cPic(img)
				.cLanguage(lan)
				.urban(urban)
				.money(money)
				.elect(elect)
				.mapAddress(map)
				.englishName(engcity)
				.clock(clock)
				.build();
//		System.out.println(cp);
		
		int result=new CountryPageInfoService().insertInfo(cp);
	
		String msg="",loc="";
		if(result>0) {
			msg="국가정보가 정상적으로 등록되었습니다.";
			loc="/countryinfo/searchAll.do?nName="+name;
		}else {
			msg="등록을 실패하였습니다. 다시 시도해주세요.";
			loc="/countryInfo/insergo.do";
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
