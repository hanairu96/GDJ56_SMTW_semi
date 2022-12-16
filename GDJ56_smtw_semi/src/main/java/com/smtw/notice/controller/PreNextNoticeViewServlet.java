package com.smtw.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.notice.model.service.NoticeService;
import com.smtw.notice.model.vo.NoticePreNext;

/**
 * Servlet implementation class PreNextNoticeViewServlet
 */
@WebServlet("/notice/preNextNoticeView.do")
public class PreNextNoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreNextNoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));//넘어온 번호
		System.out.println("넘어온번호:"+noticeNo);
		int number=Integer.parseInt(request.getParameter("number"));//이전글은 1, 다음글은 2


		NoticePreNext npn=new NoticeService().preNextNotice(noticeNo);//현재 번호에 대한 값이 옴
//		System.out.println(number);
		System.out.println("이전글번호:"+npn.getPreNo());
		System.out.println("다음글번호:"+npn.getNextNo());

		String msg="",loc="";
		if(number==1) {//이전 글 클릭했을 때
			if(npn.getPreNo()<0) {//이전글이 없으면
				msg="이전 글이 없습니다.";
				loc="/notice/noticeView.do?noticeNo="+npn.getNoticeNo();
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}	
			else {
//				System.out.println("현재번호:"+npn.getNoticeNo());
				request.setAttribute("number", number);
				request.setAttribute("noticePreNext", npn);
				request.getRequestDispatcher("/views/notice/preNext.jsp").forward(request, response);
			}
		}else {//다음 글 클릭했을 때
			if(npn.getNextNo()<0) {//다음글이 없으면
				msg="다음 글이 없습니다.";
				loc="/notice/noticeView.do?noticeNo="+npn.getNoticeNo();
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}
			else {
				noticeNo=noticeNo+1;
				System.out.println("현재번호:"+npn.getNoticeNo());
				request.setAttribute("number", number);
				request.setAttribute("noticePreNext", npn);
				request.getRequestDispatcher("/views/notice/preNext.jsp").forward(request, response);
			}
			
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
