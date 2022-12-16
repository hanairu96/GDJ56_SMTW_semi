package com.smtw.friends.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.friends.model.service.FriendsService;
import com.smtw.friends.model.vo.Friends;

/**
 * Servlet implementation class FriendsEnrollEndServlet
 */
@WebServlet("/friends/friendsEnrollEnd.do")
public class FriendsEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendsEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String nName=request.getParameter("nation");
		String friendsTitle=request.getParameter("title");
		String friendsContents=request.getParameter("friendsContents");
		String memberId=request.getParameter("memberId");
		String mbti=request.getParameter("mbti");
		String type=request.getParameter("type");
		char expYn=request.getParameter("expYn").charAt(0);
		String purArr=Arrays.toString(request.getParameterValues("purpose"));  //[여행, 공부]
		String purpose=purArr.substring(1, purArr.length()-1);  //여행, 공부
		
		Friends f=Friends.builder()
			//.friendsNo(friendsNo)
			.nName(nName)
			.friendsTitle(friendsTitle)
			.friendsContents(friendsContents)
			//.enrollDate(enrollDate)
			.memberId(memberId)
			.mbti(mbti)
			.type(type)
			.expYn(expYn)
			.purpose(purpose)
			.build();
		System.out.println("객체:"+f);
		
		int result=new FriendsService().insertFriends(f);
		String msg="", loc="";
		if(result>0) {
			//msg="프렌즈 등록 성공!";
			//request.setAttribute("msg", msg);
			request.setAttribute("id", memberId);
			RequestDispatcher rd=request.getRequestDispatcher("/views/friends/friendsAfterEnroll.jsp");
			rd.forward(request, response);
		}else {
			msg="프렌즈 등록 실패!";
			loc="/friends/friendsEnroll.do";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
			rd.forward(request, response);
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
