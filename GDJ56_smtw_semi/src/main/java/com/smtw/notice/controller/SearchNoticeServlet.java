package com.smtw.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.notice.model.service.NoticeService;
import com.smtw.notice.model.vo.Notice;

/**
 * Servlet implementation class SearchNoticeServlet
 */
@WebServlet("/notice/searchNotice.do")
public class SearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchOption=request.getParameter("searchOption");
		String searchNotice=request.getParameter("searchNotice");
//		System.out.println(searchOption+searchNotice);
		
		List<Notice> list=new NoticeService().searchNotice(searchOption,searchNotice);
		for(Notice n : list) {
			System.out.println(n);
		}
		
		request.setAttribute("searchList", list);
//		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response);
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
