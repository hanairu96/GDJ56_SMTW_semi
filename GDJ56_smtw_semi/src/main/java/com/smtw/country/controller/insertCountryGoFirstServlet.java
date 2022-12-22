package com.smtw.country.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.country.model.service.CountryService;
import com.smtw.country.model.vo.Country;

/**
 * Servlet implementation class insertCountryGoFirstServlet
 */
@WebServlet("/country/insertgo.do")
public class insertCountryGoFirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCountryGoFirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String name=request.getParameter("nName");
//		System.out.println(id);
		
		List<Country> co=new CountryService().selectAllcountry();
		
		request.setAttribute("allcountry", co);
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.getRequestDispatcher("/views/country/countryInfoinsert.jsp").forward(request, response);
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
