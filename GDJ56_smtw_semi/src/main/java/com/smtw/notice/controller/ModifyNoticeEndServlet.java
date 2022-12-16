package com.smtw.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.notice.model.service.NoticeService;

/**
 * Servlet implementation class ModifyNoticeEndServlet
 */
@WebServlet("/notice/modifyNoticeEnd.do")
public class ModifyNoticeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyNoticeEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeTitle=request.getParameter("noticeTitle");
		String summernote=request.getParameter("summernote");
		int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
		
		int result=new NoticeService().updateNotice(noticeTitle,summernote,noticeNo);
		
		String msg="",loc="";
		if(result>0) {
			msg="글 수정 완료!";
			loc="/notice/noticeView.do?noticeNo="+noticeNo;
		}else {
			msg="글 수정 실패..";
			loc="/notice/modifyNotice.do?noticeNo="+noticeNo;
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
