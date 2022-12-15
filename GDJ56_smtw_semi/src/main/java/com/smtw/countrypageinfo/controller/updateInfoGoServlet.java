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
 * Servlet implementation class updateInfoGoServlet
 */
@WebServlet("/countryinfo/updatego.do")
public class updateInfoGoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateInfoGoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("nName");
		CountryPageInfo cp=new CountryPageInfoService().searchName(name);
		
		request.setAttribute("coinfo", cp);
		request.getRequestDispatcher("/views/countryInfo/updateInfo.jsp").forward(request, response);
		
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
