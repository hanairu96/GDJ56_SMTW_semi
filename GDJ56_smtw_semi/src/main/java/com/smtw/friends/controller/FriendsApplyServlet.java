package com.smtw.friends.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FriendsApplyServlet
 */
@WebServlet("/friends/friendsApply.do")
public class FriendsApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendsApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberFrom=request.getParameter("memberFrom");
		int friendsNo=Integer.parseInt(request.getParameter("friendsNo"));
		String nName=request.getParameter("nName");
		System.out.println(memberFrom);
		System.out.println(friendsNo);
		System.out.println(nName);
		
		request.setAttribute("memberFrom", memberFrom);
		request.setAttribute("friendsNo", friendsNo);
		request.setAttribute("nName", nName);
		
		request.getRequestDispatcher("/views/friends/friendsApply.jsp")
		.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
