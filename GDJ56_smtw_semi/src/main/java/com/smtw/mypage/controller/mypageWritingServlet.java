package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mypage.model.service.MypageService;
import com.smtw.mypage.model.vo.FriendsWroteList;
import com.smtw.mypage.model.vo.Note;
import com.smtw.mypage.model.vo.ReviewList;
import com.smtw.mypage.model.vo.WroteList;
import com.smtw.mypage.model.vo.qnaList;
import com.smtw.qna.model.service.QnaService;
import com.smtw.qna.model.vo.Qna;
import com.smtw.review.model.vo.Review;

/**
 * Servlet implementation class mypageWritingServlet
 */
@WebServlet("/mypage/mypageWriting.do")
public class mypageWritingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageWritingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("id");

		
		//전체글 보내기 : 보류
		int cPage=new MypageService().getCpage(userId);
		int numPerpage=new MypageService().getNumPerpage(userId);
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		List<WroteList> list=new MypageService().selectWroteList(cPage, numPerpage,userId);
		
		int totalData=new MypageService().selectWroteCount(userId);
		System.out.println(totalData);
		
		String pageBar="";
		int pageBarSize=5;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<button class='customBtn btnStyle'>이전</button>";
		}else {
			pageBar+="<button class='customBtn btnStyle'><a href='"+request.getContextPath()
				+"/mypage/mypageWriting.do?cPage="+(pageNo-1)+"'>이전</a></button>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/mypage/mypageWriting.do?cPage="+pageNo+"'><button class='customBtn btnStyle'>"+pageNo+"</button></a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<button class='customBtn btnStyle'>다음</button>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
				+"/mypage/mypageWriting.do?cPage="+pageNo+"'>다음</a>";
			/* String userId=request.setParameter("id"); */
		}

		request.setAttribute("pageBar", pageBar);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/mypage/mypageWritingjsp.jsp")
		.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
