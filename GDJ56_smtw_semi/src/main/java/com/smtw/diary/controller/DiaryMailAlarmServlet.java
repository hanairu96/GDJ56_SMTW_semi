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
		String memberEmailtotal=request.getParameter("memberEmailtotal"); //수신자(이메일수신동의Y, 출국D-10)
        
        response.setContentType("application/json;charset=utf-8"); 
        String result="";
        
        if(memberEmailtotal.equals("")) { //수신자가 없으면
        	result="출국10일전인 사람이 없습니다.";
        }else {
        	String arrEmailTotal[] = memberEmailtotal.split(",");
        	result=EmailDiaryAlarm.gmailSend(arrEmailTotal);//메일 전송
        }
        
        new Gson().toJson(result,response.getWriter());
		 
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
