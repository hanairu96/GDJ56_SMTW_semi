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
		String memberEmailtotal = request.getParameter("memberEmailtotal");
		
		List<String> list=new Gson().fromJson(memberEmailtotal, List.class);
		 
        // List를 배열로 변환
        int arrListSize = list.size();
        String arrmemberEmail[] = list.toArray(new String[arrListSize]);
        
        System.out.println(Arrays.toString(arrmemberEmail));
        
        response.setContentType("application/json;charset=utf-8"); 
        String result="";
        if(arrmemberEmail.length==0) {
        	result="메일 전송 실패";
    		response.getWriter().append(result);
        }else {
        	result=EmailDiaryAlarm.gmailSend(arrmemberEmail);//메일 전송
        	response.getWriter().append(result);
        }
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
