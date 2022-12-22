package com.smtw.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smtw.common.EmailSendModule;

/**
 * Servlet implementation class GmailCheckServlet
 */
@WebServlet("/gmailCheck.do")
public class GmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");//입력받은 이메일
		
		String crtfcNo=EmailSendModule.gmailSend(email);//전송된 인증번호;
		System.out.println(crtfcNo);
//		request.setAttribute("email",email);
//		request.setAttribute("crtfcNo", crtfcNo);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(crtfcNo, response.getWriter());
		
		
//		request.getRequestDispatcher("/views/logIn/emailCheck.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
