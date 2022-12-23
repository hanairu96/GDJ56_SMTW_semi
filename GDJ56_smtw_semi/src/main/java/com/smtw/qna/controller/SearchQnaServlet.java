package com.smtw.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.qna.model.service.FaqService;
import com.smtw.qna.model.service.QnaService;
import com.smtw.qna.model.vo.Faq;
import com.smtw.qna.model.vo.Qna;

/**
 * Servlet implementation class SearchQnaServlet
 */
@WebServlet("/qna/searchQna.do")
public class SearchQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchOption=request.getParameter("searchOption");
		String searchQna=request.getParameter("searchQna");
		
		int cPage;
		int numPerpage=8;
		String pageBar="";
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		//검색 한 결과리스트 불러오기
		List<Qna> list=new QnaService().searchQna(searchOption,searchQna,cPage,numPerpage);
		request.setAttribute("qnaLists", list);
		List<Faq> faqList=new FaqService().selectFaqList();
		request.setAttribute("faqList", faqList);//faq리스트
		//결과가 총 몇 개인지 불러오기
		int totalData=new QnaService().selectQnaCount(searchOption,searchQna);
		
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
		
		request.getRequestDispatcher("/views/qna/qnaList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
