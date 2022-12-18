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
 * Servlet implementation class noticeListServlet
 */
@WebServlet("/notice/noticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 메인메뉴
		int cPage;
		int numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		numPerpage=8;
		String pageBar="";
		
		//현재 있는 공지사항 리스트들
		List<Notice> list=new NoticeService().selectNoticeList(cPage,numPerpage);
		//전체 공지사항 개수
		int totalData=new NoticeService().selectNoticeCount();
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);//총 페이지 수= 전체공지사항개수/5
		
		int pageBarsize=3;
		
		int pageNo=((cPage-1)/pageBarsize)*pageBarsize+1;
		int pageEnd=pageNo+pageBarsize-1;
		
		if(pageNo==1) {
			pageBar+="<a>&laquo;</a>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"?cPage="+(pageNo-1)+"' style='color: #7e8cd2;'>&laquo;</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				//보고있는 페이지
				pageBar+="<span style='color: #7e8cd2;'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a>&raquo;</a>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"cPage="+pageNo+"' style='color: #7e8cd2;'>&raquo;</a>";
		}
		
		request.setAttribute("notices", list);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
