package com.smtw.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypagePasswordUpdateEndServlet
 */
@WebServlet("/mypage/mypagePasswordUpdateEnd.do")
public class mypagePasswordUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagePasswordUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 3개 값 받아오기 : 아이디, 이전pw, 바꿀pw
		String userId=request.getParameter("id");
		String newPass=request.getParameter("password_new");
		String msg = "", loc="";
		
			// 비밀번호 변경 로직진행
			int result=new MypageService().updatePassword(userId,newPass);
			
			if(result>0) {
				msg="비밀번호 변경 완료! 새로 변경된 비밀번호로 다시 로그인 해주세요"; 
				loc="/logIn/logOut.do";
				String script="opener.location.replace('"+request.getContextPath()+"/logIn/logOut.do');close();";
				//openr =  부모페이지(지금 이 페이지는 새창에 뜨기 때문)
				// 전달되면 opner.location.replace~~("/logout");close();
				request.setAttribute("script",script);
			}else {
				msg="비밀번호 변경 실패";
				loc="<%=request.getContextPath()%>/mypage/mypagePwdCk3.do?id="+userId;
			};
			
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
