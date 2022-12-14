package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mypage.model.service.MypageService;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.MemberInfo;

/**
 * Servlet implementation class mapageFriendsSevlet
 */
@WebServlet("/mypage/mypageFriends.do")
public class mypageFriendsSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageFriendsSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//userId가지고 오기
		String userId=request.getParameter("id");
		List<Applyfriends> list = new MypageService().applyfriendsList(userId);
		List<MemberInfo> infolist = new MypageService().InfoapplyfriendsList(userId);
		List<MemberInfo> friendslist = new MypageService().FriendsList(userId);
		request.setAttribute("list",list);
		request.setAttribute("infolist",infolist);
		request.setAttribute("friendslist",friendslist);
		
		request.getRequestDispatcher("/views/mypage/mypagefriends.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
