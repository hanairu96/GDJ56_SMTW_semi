package com.smtw.countrypageinfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.country.model.vo.CountryPageInfo;
import com.smtw.countrypageinfo.model.service.CountryPageInfoService;

/**
 * Servlet implementation class InsertCountryInfoServlet
 */
@WebServlet("/countryinfo/insertinfo.do")
public class InsertCountryInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCountryInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("nName");
		String img=request.getParameter("cimage");
		String lan=request.getParameter("langagecountry");
		String urban=request.getParameter("urban");
		String money=request.getParameter("moneycountry");
		String elect=request.getParameter("elect");
		String map=request.getParameter("contryaddress");
		String engcity=request.getParameter("engcity");
		String clock=request.getParameter("clockchange");
		
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
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
