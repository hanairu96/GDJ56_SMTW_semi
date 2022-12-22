package com.smtw.country.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.country.model.service.CountryService;
import com.smtw.country.model.vo.Likenation;

/**
 * Servlet implementation class LikeCountryServlet
 */
@WebServlet("/likecountry.do")
public class LikeCountryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeCountryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String country=request.getParameter("name");
		String ck=request.getParameter("ckLike");
		Likenation ln=Likenation.builder()
				.memId(id)
				.nName(country)
				.ckLike(ck)
				.build();
		System.out.println(ln);
		int like=new CountryService().insertlike(id,country);
		
		//request.getRequestDispatcher("/country/countryMain.do").forward(request, response);
		//바로 countrymain.jsp로 가면 데이터 값이 같이 오지 않기 때문에 데이터 값이 있는 서블릿으로 가서 데이터 전송을 해준다
		response.sendRedirect(request.getContextPath()+"/country/countryMain.do?id="+id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
