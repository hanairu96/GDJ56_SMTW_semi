package com.smtw.diary.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.diary.model.service.DiaryService;

/**
 * Servlet implementation class DeleteDiaryServlet
 */
@WebServlet("/diary/deleteDiary.do")
public class DeleteDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		
		int result=new DiaryService().deleteDiary(memberId);
		response.setContentType("text/html;charset=utf-8");
		
		if(result>0) {
			//msg="출국 일지 삭제!";
			response.getWriter().append("삭제완료!");
		}else {
			//msg="삭제 실패, 다시 시도하세요!";
			response.getWriter().append("삭제 실패, 다시 시도하세요!");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
