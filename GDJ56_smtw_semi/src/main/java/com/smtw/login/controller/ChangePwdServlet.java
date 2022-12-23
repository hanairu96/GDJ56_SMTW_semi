package com.smtw.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.member.model.service.MemberService;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet(name="changePwd",urlPatterns = "/logIn/changePwd.do")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String inputPwd=request.getParameter("inputPwd");
		
		int result=new MemberService().changePwd(memberId,inputPwd);
		
		String msg="",loc="";
		
		if(result>0) {
			msg="비밀번호 재설정 완료"; 
			loc="/logIn/logIn.do";
			
		}else {
			msg="비밀번호 변경 실패";
			loc="/logIn/logIn.do";
		}
		
	
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
