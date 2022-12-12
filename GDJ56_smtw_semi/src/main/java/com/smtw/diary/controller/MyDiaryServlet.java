package com.smtw.diary.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.diary.model.service.DiaryService;

/**
 * Servlet implementation class MyDiaryServlet
 */
@WebServlet("/diary/myDiary.do")
public class MyDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String leavingdate=request.getParameter("leavingdate");
		String alarmcheck=request.getParameter("alarmcheck");
		
		System.out.println(alarmcheck);

		int result=new DiaryService().insertDiary(memberId,leavingdate,alarmcheck);
		System.out.println(result);
		
		String msg="", loc="";
		
		if(result>0) {
			msg="나의 출국일지 저장 성공";
			loc="/diary/firstDiary.do";
		}else {
			msg="나의 출국일지 저장 실패";
			loc="/diary/firstDiary.do";
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
