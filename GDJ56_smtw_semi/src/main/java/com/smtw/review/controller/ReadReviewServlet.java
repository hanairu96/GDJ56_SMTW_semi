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
 * Servlet implementation class ReadReviewServlet
 */
@WebServlet("/community/readReview.do")
public class ReadReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// jsp에서  쿼리스트링 방식으로 보냈다면  키 값을 보냈다면 
		//ReviewNo을  getParameter 메소드를 이용해  가져온다.
		
		
	int ReviewNo=Integer.parseInt(request.getParameter("ReviewNo"));
	
	//ReviewNo  을  매개변수로 보낸다.
	//db를 통해서 데이터가 특정 데이터가 readReview에 담긴다.
	Review readReview=new ReviewService().readReview(ReviewNo);
	

	
	//request   readReview 키값으로 데이터 저장
	request.setAttribute("readReview", readReview);
	
	//jsp에 넘겨준다.
	request.getRequestDispatcher("/views/community/readReview.jsp").forward(request, response);
	

	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
