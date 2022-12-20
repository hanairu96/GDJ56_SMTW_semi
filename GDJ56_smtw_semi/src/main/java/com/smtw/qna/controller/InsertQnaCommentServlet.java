package com.smtw.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smtw.qna.model.service.QnaCommentsService;

/**
 * Servlet implementation class InsertQnaCommentServlet
 */
@WebServlet("/qna/insertQC.do")
public class InsertQnaCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQnaCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment=request.getParameter("comment_1");
		int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
		String writer=request.getParameter("commentWriter");
		int qcLevel=Integer.parseInt(request.getParameter("qcLevel"));//댓글레벨
		String qnaQcRef=request.getParameter("qnaQcRef");//특정댓글에 대한 답글인 경우 그 댓글 번호/그냥 댓글이면 0 
		System.out.println(qcLevel);
		System.out.println(qnaQcRef);
		int result=new QnaCommentsService().insertQnaComments(qcLevel,qnaQcRef,comment,qnaNo,writer);
		
		String msg="",loc="";
		if(result>0) {
			msg="댓글 등록 완료!";
			loc="/qna/qnaView.do?qnaNo="+qnaNo;
		}else {
			msg="댓글 등록 실패..";
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
