package com.smtw.country.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		
		String name=request.getParameter("selectco");
		String lang=request.getParameter("langEn");
		String tend=request.getParameter("tend2");
		String place=request.getParameter("land");
		String wea=request.getParameter("weather");
		String pic=request.getParameter("piccountry");
		String ontext=request.getParameter("ontext");
		
		Country c=Country.builder()
				.nName(name)
				.nLanguage(lang)
				.nTend(tend)
				.nPlace(place)
				.nSeason(wea)
				.nImg(pic)
				.npharse(ontext)
				.build();
		
		System.out.println(c);
		int result=new CountryService().insertCountry(c);
		System.out.println(result);
		
		String msg="",loc="";
		if(result>0) {
			msg="국가정보가 정상적으로 등록되었습니다.";
			loc="/country/countryMain.do";
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
