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
 * Servlet implementation class mypagePasswordUpdateServlet
 */
@WebServlet("/mypage/mypagePasswordUpdate.do")
public class mypagePasswordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagePasswordUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("id");
		String pwd=request.getParameter("password");
		
		System.out.println(userId+" : "+pwd);
		Member m = new MypageService().pwdCk(userId,pwd);
		
		
		String msg="",loc="";
		if(m==null) {
			msg="비밀번호를 잘못입력하셨습니다. 다시입력해주세요";
			loc="/mypage/mypagePwdCk3.do?id="+userId;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("/views/mypage/mypageUpdatePassword.jsp").forward(request, response);
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
