package com.smtw.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.QnaService;

/**
 * Servlet implementation class ModifyQnaEndServlet
 */
@WebServlet("/qna/modifyQnaEnd.do")
public class ModifyQnaEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyQnaEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaTitle=request.getParameter("qnaTitle");
		String summernote=request.getParameter("summernote");
		int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
		
		int result=new QnaService().updateQna(qnaTitle,summernote,qnaNo);
		
		String msg="",loc="";
		if(result>0) {
			msg="글 수정 완료!";
			loc="/qna/qnaView.do?qnaNo="+qnaNo;
		}else {
			msg="글 수정 실패..";
			loc="/qna/modifyQna.do?qnaNo="+qnaNo;
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
