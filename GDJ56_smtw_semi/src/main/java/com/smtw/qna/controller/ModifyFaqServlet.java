package com.smtw.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.FaqService;

/**
 * Servlet implementation class ModifyFaqServlet
 */
@WebServlet("/qna/modifyFaq.do")
public class ModifyFaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyFaqServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] faqQue=request.getParameterValues("faqQue_1_");
		String[] faqAns=request.getParameterValues("faqAns_1_");
		String[] faqNo=request.getParameterValues("faqNo_");
		
		int result=0;
		for(int i=0;i<faqQue.length;i++) {
			result=new FaqService().updateFaq(faqQue[i],faqAns[i],faqNo[i]);
		}
		String msg="",loc="";
		if(result>0) {
			msg="글 수정 완료!";
			loc="/qna/qnaList.do";
		}else {
			msg="글 수정 실패..";
			loc="/qna/qnaList.do";
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
