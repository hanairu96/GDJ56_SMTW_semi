package com.smtw.countrypageinfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.country.model.vo.CountryPage;
import com.smtw.countrypageinfo.model.service.CountryPageInfoService;

/**
 * Servlet implementation class selectContryServlet
 */
@WebServlet("/countryInfo/selectcountry.do")
public class selectContryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectContryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<CountryPage> all=new CountryPageInfoService().selectCoAll();
		System.out.println(all);
		request.setAttribute("allinfo", all);

		String name=request.getParameter("nName");
		
		System.out.println(name);
	
		//CountryPage의 내용을 출력해주는 구문
		String info=request.getParameter("info");
		String page="";
		if(info.contains("국가/지역소개")) {
			request.setAttribute("data", new CountryPageInfoService().coArea(name));
			page="coarea.jsp";
		}else if(info.contains("워홀비자")) {
			request.setAttribute("data", new CountryPageInfoService().whVisa(name));
			page="whvisa.jsp";
		}else if(info.contains("안전정보")) {
			request.setAttribute("data", new CountryPageInfoService().safe(name));
			page="safe.jsp";
		}else if(info.contains("초기정착")) {
			request.setAttribute("data", new CountryPageInfoService().stay(name));
			page="stay.jsp";
		}else if(info.contains("취업정보")){
			request.setAttribute("data", new CountryPageInfoService().job(name));
			page="job.jsp";
		}
		
		request.getRequestDispatcher("/views/countryInfo/"+page).forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
