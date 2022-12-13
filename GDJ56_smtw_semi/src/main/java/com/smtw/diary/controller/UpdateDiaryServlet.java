package com.smtw.diary.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.diary.model.service.DiaryService;
import com.smtw.diary.model.vo.Diary;

/**
 * Servlet implementation class UpdateDiaryServlet
 */
@WebServlet("/diary/updateDiary.do")
public class UpdateDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		Diary diary=new DiaryService().searchDiary(memberId);
		
		request.setAttribute("diary", diary);
		request.getRequestDispatcher("/views/diary/updateDiary.jsp").forward(request, response);
		
//		int result=new DiaryService().updateDiary(memberId);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
