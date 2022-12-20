package com.smtw.review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/community/reviewDelete.do")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//키값  파일과  리뷰no
//		reviewNo
//		fileName
		String fileName=request.getParameter("fileName");
		int no=Integer.parseInt(request.getParameter("reviewNo"));
		
		
		//db에 있는 데이터 삭제
		int result=new ReviewService().deleteReview(no);
		
		//upload 폴더에 데이터 삭제 및  경로
		String msg="" ,loc="";
		
		
		if(result>0) {
			msg="후기가 삭제되었습니다.";
			
			loc="/community/reviewBasic.do";
			
			
			
			String path=getServletContext().getRealPath("/upload/review/");
			
			
			File delFile=new File(path+fileName);
			if(delFile.exists()) delFile.delete();
			
		}else {
			msg=" 후기 삭제 실패 다시시도해주세요";
			loc="/community/reviewDelete.do?reviewNo="+no;
			// 내가  삭제하려고하는ㄴ 리뷰로 넘어감 
		}
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
