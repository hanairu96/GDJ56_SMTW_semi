package com.smtw.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypageNoteEnrollEndServlet
 */
@WebServlet("/mypage/mypageNoteEnrollEnd.do")
public class mypageNoteEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageNoteEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId=request.getParameter("memberId");
		String receiver=request.getParameter("receiver");
		String context=request.getParameter("context");
		
		//사용자 이름가져오기
		String name = new MypageService().getName(memberId);
		
		//쪽지를 db에 저장하기
		int result = new MypageService().insertNote(memberId,receiver,context);
		
		String msg="", loc="";
		if(result<1) {
			msg="쪽지안보내짐...ㅋ";
		}else {
			msg="쪽지가 보내기 완료!";
		}
		loc="/mypage/mypageNoteReceive.do?id"+memberId;
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
