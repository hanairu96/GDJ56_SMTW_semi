package com.smtw.diary.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.diary.model.service.DiaryService;

/**
 * Servlet implementation class UpdateDiaryEndServlet
 */
@WebServlet("/diary/updateDiaryEnd.do")
public class UpdateDiaryEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDiaryEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String leavingdate=request.getParameter("leavingdate");
		String alarmYN=request.getParameter("alarmcheck");
		
		int result=new DiaryService().updateDiary(memberId,leavingdate,alarmYN);
		
		String msg="", loc="";
		
		if(result>0) {
			msg="수정 성공";
		}else {
			msg="수정 실패";
		}
		
		loc="/diary/firstDiary.do";
		
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
