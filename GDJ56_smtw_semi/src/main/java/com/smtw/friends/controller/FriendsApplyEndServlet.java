package com.smtw.friends.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.friends.model.service.FriendsService;
import com.smtw.friends.model.vo.ApplyFriends;

/**
 * Servlet implementation class FriendsApplyEndServlet
 */
@WebServlet("/friends/friendsApplyEnd.do")
public class FriendsApplyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendsApplyEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String propose=request.getParameter("propose");
		String memberFrom=request.getParameter("memberFrom");
		int friendsNo=Integer.parseInt(request.getParameter("friendsNo"));
		String nName=request.getParameter("nName");
		System.out.println(propose);
		System.out.println(memberFrom);
		System.out.println(friendsNo);
		System.out.println(nName);
		
		ApplyFriends af=ApplyFriends.builder()
						.propose(propose)
						.memberFrom(memberFrom)
						.friendsNo(friendsNo)
						.nName(nName)
						.build();
		
		int result=new FriendsService().insertFriendsApply(af);
		
		String msg, loc;
		if(result>0) {
			msg="친구 신청이 되었습니다.";
		}else {
			msg="친구 신청이 실패하였습니다.";
		}
		loc="/views/common/close.jsp";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/common/msg.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
