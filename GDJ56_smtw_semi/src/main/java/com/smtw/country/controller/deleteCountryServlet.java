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
 * Servlet implementation class deleteCountryServlet
 */
@WebServlet("/country/deleteCountry.do")
public class deleteCountryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCountryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Country c=Country.builder().nName(request.getParameter("nName")).build();
		int result=new CountryService().deleteCountry(c);
		request.setAttribute("msg",result>0?"삭제가 완료되었습니다.":"삭제되지 않았습니다. 다시시도해주세요");
		request.setAttribute("loc","/country/countryMain.do");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
