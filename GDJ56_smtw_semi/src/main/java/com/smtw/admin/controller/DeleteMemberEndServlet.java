package com.smtw.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.admin.model.service.MemberService;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/admin/deleteMemberEnd.do")
public class DeleteMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String accept=(String)request.getAttribute("accept");
		
		//if(accept.equals("t")==true) {
				
//			Member m=Member.builder()
//					.memberId(request.getParameter("memberId"))
//					.build();

//			String id=(String)request.getAttribute("memberId");
			String id=request.getParameter("memberId");
			System.out.println(id);
			
			int result=new MemberService().deleteMember(id);
			
			request.setAttribute("msg", result>0?"회원이 삭제됐습니다.":"삭제 실패");
			request.setAttribute("loc", "/admin/memberList.do");
			
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
//		}else {
//			request.getRequestDispatcher("/admin/memberList.do")
//			.forward(request, response);
//		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
