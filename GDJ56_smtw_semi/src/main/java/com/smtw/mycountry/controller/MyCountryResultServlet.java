package com.smtw.mycountry.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mycountry.model.service.MyCountryService;
import com.smtw.mycountry.model.vo.MyCountry;

/**
 * Servlet implementation class MyCountryResultServlet
 */
@WebServlet(name="MyCountryResultServlet", urlPatterns="/mycountry/myCountryResult.do")
public class MyCountryResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCountryResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myCountryResult=request.getParameter("result");
		String[] countryResult=myCountryResult.split(",");
		System.out.println(Arrays.toString(countryResult));
		
		String nLanguage=countryResult[0];
		String nPlace=countryResult[1];
		String nSeason=countryResult[2];
		String nTend=countryResult[3];
		
		List<MyCountry> mycountry=new MyCountryService().searchMyCountry(nLanguage,nPlace,nSeason,nTend);
		
		request.setAttribute("countryResult", countryResult);
		request.setAttribute("mycountry", mycountry);
		request.getRequestDispatcher("/views/mycountry/myCountryResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
