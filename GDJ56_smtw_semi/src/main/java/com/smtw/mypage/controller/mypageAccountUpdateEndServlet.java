package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypageAccountUpdateEndServlet
 */
@WebServlet("/mypageAccountUpdateEnd.do")
public class mypageAccountUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageAccountUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String path=request.getServletContext().getRealPath("/upload/account/");
		
		  MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
	      
	      Enumeration e=mr.getFileNames();
	      String pic="";
	      if(e.hasMoreElements()) {
	         String filename=(String)e.nextElement();//파일을 반환
	         pic = mr.getFilesystemName(filename);
	      }
		
		
		String id=mr.getParameter("id");
		String name=mr.getParameter("name");
		char gender=mr.getParameter("gender").charAt(0);
		String bYear=mr.getParameter("bYear");
		String bMonth=mr.getParameter("bMonth");
		String bDay=mr.getParameter("bDay");
		String email=mr.getParameter("email");
		String phone=mr.getParameter("phone");
		String myImg=mr.getParameter("mypcs");
		
		String address="("+mr.getParameter("inputAddress_postcode")+")"+mr.getParameter("inputAddress_address")+","+mr.getParameter("inputAddress_detailAddress");
		
		String birth = bYear+"/"+bMonth+"/"+bDay;
		
		System.out.println("아이디"+id);
		System.out.println("이름"+name);
		System.out.println("성별"+gender);
		System.out.println("생년월일"+birth);
		System.out.println("주소"+address);
		System.out.println("이멜일"+email);
		System.out.println("내사진"+pic);
		
		Member updateMember = Member.builder()
						.memberId(id)
						.memberName(name)
						.email(email)
						.phone(phone)
						.birth(birth)
						.gender(gender)
						.address(address)
						.myImg(pic)
						.build();
							
		int result=new MypageService().updateMember(updateMember);
		
		String msg="", loc="";
		if(result<1) {
			msg="실패했습니다. 다시 시도해주세요";
			loc="/mypage/mypageAccountUpdate.do?id="+id;
		}else {
			msg="회원정보가 수정되었습니다";
			loc="/mypage/mypageAccountView.do?id="+id;
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
