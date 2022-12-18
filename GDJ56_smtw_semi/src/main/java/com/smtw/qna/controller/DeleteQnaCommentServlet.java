package com.smtw.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.QnaCommentsService;

/**
 * Servlet implementation class DeleteQnaCommentServlet
 */
@WebServlet("/qna/DeleteQnaComment.do")
public class DeleteQnaCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQnaCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
		int qcNo=Integer.parseInt(request.getParameter("qcNo"));
		
		int result=new QnaCommentsService().deleteQnaComment(qnaNo,qcNo);
		
		String msg="",loc="";
		if(result>0) {
			msg="댓글 삭제 완료!";
			loc="/qna/qnaView.do?qnaNo="+qnaNo;
		}else {
			msg="댓글 삭제 실패..";
			loc="/qna/qnaView.do?qnaNo="+qnaNo;
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
