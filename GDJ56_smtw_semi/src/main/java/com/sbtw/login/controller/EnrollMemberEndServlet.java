package com.sbtw.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.member.model.service.MemberService;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class EnrollMemberEndServlet
 */
@WebServlet("/logIn/enrollMemberEnd.do")
public class EnrollMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원이 입력한 값 가져오기
		String memberId=request.getParameter("inputId");
		String memberPwd=request.getParameter("inputPwd");
		String memberName=request.getParameter("inputName");
		String birthYear=request.getParameter("yy");
		String birthMonth=request.getParameter("month");
		String birthDay=request.getParameter("day");
		String birth=birthYear+birthMonth+birthDay;
		String phone=request.getParameter("inputPhone");
		char gender=request.getParameter("gender").charAt(0);
		String email=request.getParameter("inputEmail");
		String address="("+request.getParameter("inputAddress_postcode")+")"+request.getParameter("inputAddress_address")+","+request.getParameter("inputAddress_detailAddress");

		Member m=Member.builder()
				.memberId(memberId)
				.memberPwd(memberPwd)
				.memberName(memberName)
				.email(email)
				.phone(phone)
				.birth(birth)
				.gender(gender)
				.address(address)
				.build();
		int result=new MemberService().insertMember(m);
		String msg="",loc="";
		if(result>0) {
			msg="회원가입 성공! 환영합니다!";
			loc="/";
		}else {
			msg="회원가입에 실패했습니다. 다시 시도해주세요.";
			loc="/logIn/enrollMember.do";
		}
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
