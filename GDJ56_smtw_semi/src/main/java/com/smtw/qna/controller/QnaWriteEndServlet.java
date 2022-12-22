package com.smtw.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.QnaService;

/**
 * Servlet implementation class QnaWriteEndServlet
 */
@WebServlet("/qna/qnaWriteEnd.do")
public class QnaWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaWriter=request.getParameter("qnaWriter");
		String qnaTitle=request.getParameter("qnaTitle");
//		String qnaEmail_1=request.getParameter("qnaEmail_1");//이메일 @앞 부분
//		String qnaEmail_2=request.getParameter("qnaEmail_2");//이메일 @뒷 부분
//		String selboxDirect=request.getParameter("selboxDirect");//직접 입력한 부분
//		if(qnaEmail_2.equals("direct")) qnaEmail_2=selboxDirect;//직접 입력하면 이메일 @뒷부분 바꿔주기
//		String qnaEmail=qnaEmail_1+"@"+qnaEmail_2;
		String summernote=request.getParameter("summernote");
		
		int result=new QnaService().insertQna(qnaWriter,qnaTitle,summernote);
		
		String msg="",loc="";
		if(result>0) {
			msg="질문 등록 완료!";
			loc="/qna/qnaList.do";
		}else {
			msg="질문 등록 실패..";
			loc="/qna/qnaWrite.do";
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
