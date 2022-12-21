package com.smtw.diary.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smtw.common.EmailDiaryAlarm;
import com.smtw.common.EmailSendModule;

/**
 * Servlet implementation class DiaryMailAlarmServlet
 */
@WebServlet("/diary/mailAlarm.do")
public class DiaryMailAlarmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaryMailAlarmServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memberEmailtotal=request.getParameter("memberEmailtotal");
		
        String arrEmailTotal[] = memberEmailtotal.split(",");
        
        response.setContentType("application/json;charset=utf-8"); 
        String result="";
        
        if(arrEmailTotal.length==0) {
        	result="출국10일전인 사람이 없습니다.";
//    		response.getWriter().append(result);
        }else {
        	result=EmailDiaryAlarm.gmailSend(arrEmailTotal);//메일 전송
//        	response.getWriter().append(result);
        }
        
        new Gson().toJson(result,response.getWriter());
        System.out.println(result);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
