package com.smtw.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mypageNoteReply
 */
@WebServlet("/mypage/mypageNoteReply.do")
public class mypageNoteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageNoteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쪽지 받는 사람아이디
		String receiver = request.getParameter("sender");
		String receiverName = request.getParameter("friendName");
		
		String memberId = request.getParameter("userId");
		
		
		System.out.println("쪽지 보낼 아이디:"+receiver);
		System.out.println("현재 로그인한 아이디"+memberId);
		
		// receibver, memberId 보내기
		request.setAttribute("receiver", receiver);
		request.setAttribute("receiverName", receiverName);
		request.setAttribute("memberId", memberId);
		
		//쪽지 보내기 화면전환
		request.getRequestDispatcher("/views/mypage/mypageNoteEnroll.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
