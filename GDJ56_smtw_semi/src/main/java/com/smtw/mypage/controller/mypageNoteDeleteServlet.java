package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypageNoteDeleteServlet
 */
@WebServlet("/mypage/mypageNoteDelete.do")
public class mypageNoteDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageNoteDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Thread t = new Thread(()->{
			try {
			Thread.sleep(4000);
			}catch(InterruptedException e) {
				e.printStackTrace();
			}
		});
		
		String[] checkBoxArr=request.getParameterValues("checkBoxArr[]");
		int result =0;
		String checkNum="";
		
		for(String str:checkBoxArr) {
			checkNum=str;
			result=new MypageService().deleteNote(checkNum);
			System.out.println(result);
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
