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
		
		int cPage;
		int numPerpage=5;
		String pageBar="";
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		//검색 한 결과리스트 불러오기
		List<Notice> list=new NoticeService().searchNotice(searchOption,searchNotice,cPage,numPerpage);
		request.setAttribute("notices", list);
		
		//결과가 총 몇 개인지 불러오기
		int totalData=new NoticeService().selectNoticeCount(searchOption,searchNotice);
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);//총 페이지 수= 전체공지사항개수/5
		int pageBarsize=5;
		int pageNo=((cPage-1)/pageBarsize)*pageBarsize+1;
		int pageEnd=pageNo+pageBarsize-1;
		
		if(pageNo==1) {
			pageBar+="<a>&laquo;</a>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"?cPage="+(pageNo-1)+"'>&laquo;</a>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				//보고있는 페이지
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getRequestURL()+"?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<a>&raquo;</a>";
		}else {
			pageBar+="<a href='"+request.getRequestURL()+"cPage="+pageNo+"'>&raquo;</a>";
		}

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
