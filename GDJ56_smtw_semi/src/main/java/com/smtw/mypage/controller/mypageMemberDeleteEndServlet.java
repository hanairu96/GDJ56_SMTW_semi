package com.smtw.mypage.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypageMemberDeleteEndServlet
 */
@WebServlet("/mypage/mypageMemberDeleteEnd.do")
public class mypageMemberDeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageMemberDeleteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= request.getParameter("id");
		/* String img= request.getParameter("img"); */
		
		int delete = new MypageService().deleteMember(userId);
		String msg="",loc="";
		
		if(delete>0) {
			HttpSession session = request.getSession(false);
			if(session!=null) {
				request.getRequestDispatcher("/views/mypage/mypagedeleteMemberEnd.jsp").forward(request, response);
				//session.invalidate();
		}else {
			msg="회원탈퇴를 실패했습니다. 다시 시도해주세요";
			loc="/mypage/mypagedeleteMember.do?id="+userId;
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
