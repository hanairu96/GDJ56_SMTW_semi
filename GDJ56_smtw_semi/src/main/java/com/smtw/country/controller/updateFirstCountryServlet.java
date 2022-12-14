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
		
		
		String name=request.getParameter("nName");
		String lang=request.getParameter("langEn");
		String tend=request.getParameter("tend2");
		String land=request.getParameter("land");
		String wea=request.getParameter("weather");
		String pic=request.getParameter("picpic");
		String text=request.getParameter("ontext");
		
		Country c=Country.builder()
				.nName(name)
				.nLanguage(lang)
				.nTend(tend)
				.nPlace(land)
				.nSeason(wea)
				.nImg(pic)
				.npharse(text)
				.build();
		System.out.println(c);
		
		int result=new CountryService().updateCountry(c);
		String msg="",loc="";
		if(result>0) {
			msg="국가 정보 수정이 완료되었습니다.";
			loc="/country/countryMain.do";
			request.getSession().setAttribute("country", c);
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
