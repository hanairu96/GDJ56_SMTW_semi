package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smtw.admin.model.service.MemberService;
import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.service.MypageService;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.MemberInfo;
import com.smtw.mypage.model.vo.MemberInfo2;

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
		
		HttpSession session=request.getSession();
		Member m=(Member) session.getAttribute("logInMember");
		String id = m.getMemberId();
		//userId가지고 오기
		System.out.println("내아이디!!!"+id);
		//내 이미지 가지고 오기 
		String myImg=new MypageService().getImg("id");
		request.setAttribute("myImg", myImg);
		System.out.println("내사진"+myImg);
		// 친구 신청한 리스트
		List<Applyfriends> list = new MypageService().applyfriendsList(id);
		//친구 신청한 사람들의 정보
		List<MemberInfo> infolist = new MypageService().InfoapplyfriendsList(id);
		//친구 리스트
		List<MemberInfo> friendslist = new MypageService().FriendsList(id);
		// (상대방이 나의 친구 신청을 받아준=)친구 수락받은 리스트
		List<Member> acceptedFlist = new MypageService().acceptedFlist(id);
		// 그의 정보
		List<MemberInfo2> acceptedlist=null;
		
		System.out.println("신청수락받은 리스트:"+acceptedFlist);
		
		if(!acceptedFlist.isEmpty()) {
			for(int i=0;i<acceptedFlist.size();i++){
				System.out.println(acceptedFlist.get(i).getMemberId());
				acceptedlist=new MypageService().acceptedFinfo2(acceptedFlist.get(i).getMemberId());
			}
		}
		System.out.println("신청수락받은 리스트의 친구 정보:"+acceptedlist);
		
		
		
		System.out.println("친구리스트:"+friendslist);
		
		request.setAttribute("list",list);
		request.setAttribute("infolist",infolist);
		request.setAttribute("friendslist",friendslist);
		request.setAttribute("acceptedlist",acceptedlist);
		
		
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
