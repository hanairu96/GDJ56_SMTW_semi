package com.smtw.diary.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smtw.diary.model.service.DiaryService;
import com.smtw.diary.model.vo.CheckList;
import com.smtw.diary.model.vo.Diary;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class FirstDiaryServlet
 */
@WebServlet(name="firstDiary", urlPatterns="/diary/firstDiary.do")
public class FirstDiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstDiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로그인 세션이 없으면 -> 해당 페이지 권한X -> 필터에서 설정해줘야함
		
		//로그인 세션이 있으면 
		HttpSession session=request.getSession();
		Member m=(Member) session.getAttribute("logInMember");
		System.out.println(m.getMemberId());
		
		String memberId=m.getMemberId(); //로그인 된 멤버아이디
		
		//로그인 한 멤버의 Diary테이블 정보를 가져옴
		Diary diary=new DiaryService().searchDiary(memberId);
		
		//로그인 한 멤버의 CHECKLIST테이블 정보를 가져옴
		CheckList checklist=new DiaryService().searchCheckList(memberId);
		
		if(diary.getMemberId()!=null) {
			//1) 나의출국일지 DB가 있는 회원이라면 MyDiary.jsp
			
			//D-DAY구하기
	        LocalDate today = LocalDate.now(); // 오늘 날짜 구하기 (YYYY-MM-DD)
	        
	        LocalDate diaryDate = LocalDate.parse(diary.getDDay()); // 출국일 : 문자열 -> LocalDate 타입변환
	        
			//날짜 사이의 간격을 계산해주는 메소드
			int diaryDday=(int) ChronoUnit.DAYS.between(today, diaryDate);  //출국일-오늘 DDAY계산
			//Math.abs(diaryDday);
			
			request.setAttribute("diaryDday", diaryDday);
			request.setAttribute("diary", diary);
			request.setAttribute("checklist", checklist);
			
			request.getRequestDispatcher("/views/diary/myDiary.jsp").forward(request, response);
			
		}else {
			//2) 나의 출국일지 DB가 없는 회원이라면 firstDiary.jsp
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("/views/diary/firstDiary.jsp").forward(request, response);
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
