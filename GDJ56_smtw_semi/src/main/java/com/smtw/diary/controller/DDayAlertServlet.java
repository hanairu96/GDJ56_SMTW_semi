package com.smtw.diary.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.diary.model.service.DiaryService;
import com.smtw.diary.model.vo.Diary;

/**
 * Servlet implementation class DDayAlertServlet
 */
@WebServlet("/diary/DdayAlert.do")
public class DDayAlertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DDayAlertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		
		Diary diary=new DiaryService().searchDiary(memberId);
		response.setContentType("text/html;charset=utf-8");
		
		if(diary.getMemberId()!=null) {
			//1) 나의출국일지 DB가 있는 회원이라면 MyDiary.jsp
			if(diary.getAlarm().equals("Y")) {
				//D-DAY구하기
		        LocalDate today = LocalDate.now(); // 오늘 날짜 구하기 (YYYY-MM-DD)
		        
		        LocalDate diaryDate = LocalDate.parse(diary.getDDay()); // 출국일 : 문자열 -> LocalDate 타입변환
		        
				//날짜 사이의 간격을 계산해주는 메소드
				int diaryDday=(int) ChronoUnit.DAYS.between(today, diaryDate);  //출국일-오늘 DDAY계산
				
				response.getWriter().append(String.valueOf(diaryDday));
				
				}else {
					response.getWriter().append("없음");
				}
		}else {
			//2) 나의 출국일지 DB가 없는 회원이라면 firstDiary.jsp
			response.getWriter().append("없음");
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
