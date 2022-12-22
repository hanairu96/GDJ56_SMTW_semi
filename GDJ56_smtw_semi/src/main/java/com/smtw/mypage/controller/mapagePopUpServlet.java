package com.smtw.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class mapagePopUpServlet
 */
@WebServlet("/mypage/mypagePopUp.do")
public class mapagePopUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mapagePopUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String friendName = request.getParameter("friendName");
		String friendAge = request.getParameter("friendAge");
		String friendGender = request.getParameter("friendGender");
		String friendId = request.getParameter("friendId");
		
		
		
		request.setAttribute(friendName, "friendId");
		request.setAttribute(friendName, "friendName");
		request.setAttribute(friendAge, "friendAge");
		request.setAttribute(friendGender, "friendGender");
		
		request.getRequestDispatcher("/views/mypage/mypage-pop_friendclick.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
