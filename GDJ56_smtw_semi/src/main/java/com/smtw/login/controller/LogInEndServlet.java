package com.smtw.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smtw.member.model.service.MemberService;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class LogInEndServlet
 */
@WebServlet(name="logInEnd",urlPatterns = "/logIn/logInEnd.do")
public class LogInEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String logInId=request.getParameter("logInId");
		String logInPwd=request.getParameter("logInPwd");
		
		//아이디와 패스워드로 로그인하여 정보 가져오기
		Member m=new MemberService().searchIdPwd(logInId,logInPwd);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(m, response.getWriter());
		
		if(m!=null) {
			HttpSession session=request.getSession();//세션생성
			session.setAttribute("logInMember", m); //logInMember 세션에 아이디,비번 저장
			response.sendRedirect(request.getContextPath());//저장한 세션값 전송
			
			System.out.println("로그인 성공");
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
