package com.smtw.admin.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.admin.model.service.MemberService;
import com.smtw.diary.model.service.DiaryService;
import com.smtw.diary.model.vo.Diary;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/memberList.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage=10;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		List<Member> list=new MemberService().selectMemberList(cPage, numPerpage);
		
		int totalData=new MemberService().selectMemberCount();
		
		String pageBar="";
		int pageBarSize=5;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled' style='color:rgba(221, 160, 221, 0.508) !important;'>"
					+"<a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}else {
			pageBar+="<li><a class='page-link' href='"+request.getContextPath()+"/admin/memberList.do?cPage="+(pageNo-1)
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"
						+request.getContextPath()+"/admin/memberList.do?cPage="+pageNo
						+"' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"
					+request.getContextPath()+"/admin/memberList.do?cPage="+pageNo
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}
		
		List<Member> listAll=new MemberService().selectMemberListAll(); //페이징 처리 되지 않은 회원 전체 리스트
		List<Diary> diaryAll=new DiaryService().searchDiaryAll(); //전체 회원의 출국일지 리스트
		
		List<String> memberEmailAgree=new ArrayList();
		List<String> memberIdDiary=new ArrayList();
		
   		 if(!listAll.isEmpty()) { /* 회원리스트가 있다면 */
	   		for(Member m : listAll) { /* 회원리스트에서 반복 */
	   			 if(m.getEmailAgree()=='Y'){ /* 회원 중 이메일 수신동의 여부 Y인 사람의 경우 */
	   				for(Diary d : diaryAll){ /* 출국일지 테이블에서 반복 */
	   					if(d.getMemberId().equals(m.getMemberId())){ /* 이메일 수신동의 여부 Y인 회원이 출국일지를 가진 경우*/
	   						//D-DAY구하기
		   			        LocalDate today = LocalDate.now(); // 오늘 날짜 구하기 (YYYY-MM-DD)
		   			        LocalDate diaryDate = LocalDate.parse(d.getDDay()); // 출국일 : 문자열 -> LocalDate 타입변환
		   					//날짜 사이의 간격을 계산해주는 메소드
		   					int diaryDday=(int) ChronoUnit.DAYS.between(today, diaryDate);  //출국일-오늘 DDAY계산	
	   						
		   					if(diaryDday==10){ //디데이 10인 경우
		   						memberIdDiary.add(m.getMemberId()); //회원의 아이디를 memberIdDiary에 추가
		   						memberEmailAgree.add(m.getEmail()); //회원의 이메일을 memberEmailAgree에 추가
	   						}
	   					}
	   				}
	   			}
	   		 }
	   	}
   		 // List를 배열로 변환
         int arrListSize = memberEmailAgree.size();
         String arrmemberEmail[] = memberEmailAgree.toArray(new String[arrListSize]);
   		 
   		System.out.println("D-10인 회원ID:"+memberIdDiary);
		System.out.println("D-10인 회원Email:"+Arrays.toString(arrmemberEmail));
		
		
		 request.setAttribute("arrmemberEmail", arrmemberEmail);
		 request.setAttribute("pageBar", pageBar); request.setAttribute("list", list);
		 
		 request.getRequestDispatcher("/views/admin/memberList.jsp") .forward(request,
		 response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
