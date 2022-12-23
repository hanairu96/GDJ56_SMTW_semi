package com.smtw.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.review.model.service.ReviewService;
import com.smtw.review.model.vo.Review;

/**
 * Servlet implementation class ReviewBasicServlet
 */
@WebServlet("/community/reviewBasic.do")
public class ReviewBasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewBasicServlet() {
        super();
        // TODO Auto-generated constructor stub
     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		

		String stateSort = request.getParameter("stateSort");
		if(stateSort==null) {
			stateSort="ORDER BY enroll_date DESC";
		}
		
		
		
		
		int cPage;
		int numPerpage=8;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
			cPage=1;
			
			
		}
		
		List<Review> list=new ReviewService().searchReviewAll(cPage,numPerpage,stateSort);
		
		
		
		int totalData=new ReviewService().selectReviewCount();
		
		//2 단계
		//pageBar html 코드를 저장할 수 있는 변수 선언
		String pageBar="";
		int pageBarSize=4;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		
		
		
		
		

		
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled' style='color:rgba(221, 160, 221, 0.508) !important;'>"
					+"<a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}else {
			pageBar+="<li><a class='page-link' href='"+request.getContextPath()+"/community/reviewBasic.do?cPage="+(pageNo-1)
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}
				
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"
						+request.getContextPath()+"/community/reviewBasic.do?cPage="+pageNo+"&stateSort="+stateSort
						+"' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}
			
			pageNo++;
		}
				
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"
					+request.getContextPath()+"/community/reviewBasic.do?cPage="+pageNo+"&stateSort="+stateSort
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}
		
		
		
		request.setAttribute("pageBar", pageBar);
		
		
	
		request.setAttribute("review", list); 
		
		request.setAttribute("state", "basic");
		
		
		request.getRequestDispatcher("/views/community/reviewBasic.jsp").forward(request, response);
		
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
