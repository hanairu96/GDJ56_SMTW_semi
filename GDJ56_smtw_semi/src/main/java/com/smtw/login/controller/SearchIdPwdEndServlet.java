package com.smtw.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.member.model.service.MemberService;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class SearchIdPwdEndServlet
 */
@WebServlet("/logIn/searchIdPwdEnd.do")
public class SearchIdPwdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIdPwdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchName=request.getParameter("searchName");
		String searchEmail=request.getParameter("searchEmail");
		String searchId=request.getParameter("searchId");
		
		Member m=new MemberService().searchId(searchName,searchEmail);//아이디 찾기 값
		//Member m2=new MemberService().searchIdPwd(searchName, searchEmail,searchId);//비밀번호 찾기 값
		
		String msg="",loc="";
		request.setAttribute("members", m);
		//아이디찾기
		if(m!=null) {
			request.getRequestDispatcher("/views/logIn/searchIdEnd.jsp").forward(request, response);
		}
		else {
			msg="일치하는 아이디가 없습니다.";
			loc="/logIn/searchIdPwd.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
