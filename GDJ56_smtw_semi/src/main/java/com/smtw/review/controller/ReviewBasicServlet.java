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
     // System.out.println();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//페이징 바처리하기11
		
		int cPage;
		int numPerpage=8;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			//null 을 파싱할수 없으니
			cPage=1;
			
			
		}
		
		List<Review> list=new ReviewService().searchReviewAll(cPage,numPerpage);
		
		
		
		int totalData=new ReviewService().selectReviewCount();
		
		
		// 코드를 생성할수 있는 변숫 선언
		String pageBar="";
		int pageBarSize=4;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		
		
		
		
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
