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
 * Servlet implementation class SearchReviewServlet
 */
@WebServlet("/community/searchReview.do")
public class SearchReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String type=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
	
		
		String stateSort = request.getParameter("stateSort");
		if(stateSort==null) {
			stateSort="ORDER BY enroll_date DESC";
		}
		
		
		
		
		int cPage;
		// 페이지당 출력 갯수
			int numPerpage=4;
				
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
			
		}
	//
	List<Review> list=new ReviewService().searchReviewList(type,keyword,cPage,numPerpage,stateSort);
		
		
	
	
	
	int totalData=new ReviewService().selectReviewCount(type,keyword);
	
	int totalPage=(int)Math.ceil((double)totalData/numPerpage); 
	
	String pageBar="";	
	int pageBarSize=4;
	int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	int pageEnd=pageNo+pageBarSize-1;
	
	
	if(pageNo==1) {  
		pageBar+="<span>[이전]</span>";
		
	}else {   
		pageBar+="<a href='"+request.getContextPath()
		+"/community/searchReview.do?cPage="+(pageNo-1)+"&searchType="+type+"&searchKeyword="+keyword+"&stateSort="+stateSort+"'>"+pageNo+"</a>";
		
	}
	
	while(!(pageNo>pageEnd||pageNo>totalPage)) {
		if(cPage==pageNo) {
			//보고있는 페이지
			pageBar+="<span>"+pageNo+"</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/community/searchReview.do?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&stateSort="+stateSort+"'>"+pageNo+"</a>";
		}
		
		pageNo++;
	}
	
	if(pageNo>totalPage) {
		pageBar+="<span>[다음]</span>";
	}else {
		pageBar+="<a href='"+request.getContextPath()
		+"/community/searchReview.do?cPage="+pageNo+"&searchType="+type+"&searchKeyword="+keyword+"&stateSort="+stateSort+"'>"+pageNo+"</a>";
	}
	
	
	
	
	request.setAttribute("pageBar", pageBar);
	
	request.setAttribute("review", list); 
	
	request.setAttribute("state", "search");
	

	
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
