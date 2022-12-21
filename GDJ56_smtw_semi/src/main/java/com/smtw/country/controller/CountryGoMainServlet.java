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
import com.smtw.country.model.vo.Likenation;

/**
 * Servlet implementation class CountryWriteServlet
 */
@WebServlet("/country/countryMain.do")
public class CountryGoMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountryGoMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int cPage;
		int numPerpage=6;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		List<Country> country=new CountryService().searchCountry(cPage, numPerpage);
		
//		System.out.println(country);
		int totalData=new CountryService().searchCountryCount();
		String pageBar="";
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;		
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled' style='color:rgba(221, 160, 221, 0.508) !important;'>"+
			"<a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>[이전]</a></li>";
		}else {
			pageBar+="<li><a class='page-link' href='"+request.getContextPath()+"/country/countryMain.do?cPage="+(pageNo-1)
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"
						+request.getContextPath()+"/country/countryMain.do?cPage="+pageNo
						+"' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"
					+request.getContextPath()+"/country/countryMain.do?cPage="+pageNo
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}
		request.setAttribute("pageBar", pageBar);
		
		
		request.setAttribute("country", country);
		
		
		//나라 좋아요 한 아이디값으로 값을 받아오는 구문
		String id=request.getParameter("id");
		System.out.println(id);
		if(id!=null) {
			List<Likenation> n=new CountryService().selectLike(id);
			System.out.println(n);
			request.setAttribute("nation", n);
		}
		
		List<Country> list=new CountryService().searchList();
		request.setAttribute("list",list);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/views/country/countrymainview.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
