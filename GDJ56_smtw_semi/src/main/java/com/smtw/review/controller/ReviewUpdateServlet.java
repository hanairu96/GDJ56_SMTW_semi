package com.smtw.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.review.model.service.ReviewService;
import com.smtw.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/community/reviewUpdate.do")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

//		reviewNo
//		fileName
	
		String fileName=request.getParameter("fileName");// 기존파일 삭제를 위한
		
		int reviewNo=Integer.parseInt(request.getParameter("reviewNo"));
		
		Review oriReview=new ReviewService().readReview(reviewNo);
		request.setAttribute("oriReview", oriReview);
		
		
		request.setAttribute("fileName",fileName);  // 기존파일 삭제를 위한
		
		
		request.getRequestDispatcher("/views/community/updateReview.jsp").forward(
		request, response);
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
