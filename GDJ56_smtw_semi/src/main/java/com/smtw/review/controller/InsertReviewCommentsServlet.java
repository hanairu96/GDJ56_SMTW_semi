package com.smtw.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.QnaCommentsService;
import com.smtw.review.model.service.ReviewCommentsService;

/**
 * Servlet implementation class InsertReviewCommentsServlet
 */
@WebServlet("/community/insertRC.do")
public class InsertReviewCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewCommentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comment=request.getParameter("comment_1");
		int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
		String writer=request.getParameter("commentWriter");
		int qcLevel=Integer.parseInt(request.getParameter("qcLevel"));//댓글레벨
		String qnaQcRef=(request.getParameter("qnaQcRef"));//특정댓글에 대한 답글인 경우 그 댓글 번호/그냥 댓글이면 0 
		
		int result=new ReviewCommentsService().insertReviewComments(qcLevel,qnaQcRef,comment,qnaNo,writer);
		
		
		String msg="",loc="";
		if(result>0) {
			msg="댓글 등록 완료!";
			loc="/community/readReview.do?ReviewNo="+qnaNo;  // 에러 발생 가능  키값을 변경해야할수도
		}else {
			msg="댓글 등록 실패..";
			loc="/community/readReview.do?ReviewNo="+qnaNo;      // 에러 발생 가능
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
