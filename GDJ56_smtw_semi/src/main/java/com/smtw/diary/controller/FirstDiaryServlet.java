package com.smtw.diary.controller;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smtw.diary.model.service.DiaryService;
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
		
		//로그인 한 멤버의 Diary테이블 정보를 가져와서 화면으로 보내야함
		Diary diary=new DiaryService().searchDiary(memberId);
		
		if(diary.getMemberId()!=null) {
			//1) 나의출국일지 DB가 있는 회원이라면 MyDiary.jsp
			
	        LocalDate today = LocalDate.now(); // 현재 날짜 구하기
	        int year = today.getYear();
	        String month = today.getMonth().toString();
	        int monthValue = today.getMonthValue();
	        int dayOfMonth = today.getDayOfMonth();
	        int dayOfYear = today.getDayOfYear();
	        String dayOfWeek = today.getDayOfWeek().toString();
	        int dayOfWeekValue = today.getDayOfWeek().getValue();
	       
	        System.out.println("오늘 : "+ today);  // 결과 출력 YYYY-MM-DD형식
	        
	        LocalDate diaryDate = LocalDate.parse(diary.getDDay()); // 문자열 -> LocalDate 타입변환
	        
	        System.out.println(memberId+"의 출국일 : "+diaryDate); 
	        
	        Period dday=today.until(diaryDate); //출국일-오늘 DDAY계산
	        System.out.println(dday.getDays()); //D-일수 출력
	       
	        int ddayResult=dday.getDays();
	        
	        request.setAttribute("ddayResult", ddayResult);
			request.setAttribute("diary", diary);
			
			
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
