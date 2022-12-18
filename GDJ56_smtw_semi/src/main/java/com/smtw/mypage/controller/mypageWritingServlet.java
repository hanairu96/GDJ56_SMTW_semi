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
		
//		int rcPage=new MypageService().getrCpage(userId);
//		int rnumPerpage=new MypageService().getrnumPerpage(userId);
//		System.out.println("rcpage"+rcPage);
//		System.out.println("rnumPerpage"+rnumPerpage);
//		
//		int fcPage=new MypageService().getfCpage(userId);
//		int fnumPerpage=new MypageService().getfnumPerpage(userId);
//		System.out.println("fcpage"+fcPage);
//		System.out.println("fnumPerpage"+fnumPerpage);
//		
//		int qcPage=new MypageService().getqCpage(userId);
//		int qnumPerpage=new MypageService().getqnumPerpage(userId);
//		System.out.println("qcPage"+fcPage);
//		System.out.println("qcPage"+fnumPerpage);
//	
//		
//		
//		List<ReviewList> rlist=new MypageService().reviewList(userId,rcPage, rnumPerpage);
//		System.out.println(rlist);
//		
//		List<ReviewList> fworiteList=new MypageService().fworiteList(userId,fcPage, fnumPerpage);
//		System.out.println(fworiteList);
//		
//		List<ReviewList> qnaList=new MypageService().qnaList(userId,qcPage, qnumPerpage);
//		System.out.println(qnaList);
//		
//		List<ReviewList> allList = new ArrayList();
//		allList.addAll(rlist);
//		allList.addAll(fworiteList);
//		allList.addAll(qnaList);
//		
//		System.out.println("전체리스트"+allList);
		
		
		
		
		
//		int totalData=new QnaService().selectQnaCount();
//		
//		String pageBar="";
//		int pageBarSize=5;
//		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
//		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
//		int pageEnd=pageNo+pageBarSize-1;
//		
//		if(pageNo==1) {
//			pageBar+="<button class='customBtn btnStyle'>이전</button>";
//		}else {
//			pageBar+="<button class='customBtn btnStyle'><a href='"+request.getContextPath()
//				+"/admin/qnaManage.do?cPage="+(pageNo-1)+"'>이전</a></button>";
//		}
//		
//		while(!(pageNo>pageEnd||pageNo>totalPage)) {
//			if(cPage==pageNo) {
//				pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
//			}else {
//				pageBar+="<a href='"+request.getContextPath()
//				+"/admin/qnaManage.do?cPage="+pageNo+"'><button class='customBtn btnStyle'>"+pageNo+"</button></a>";
//			}
//			pageNo++;
//		}
//		
//		if(pageNo>totalPage) {
//			pageBar+="<button class='customBtn btnStyle'>다음</button>";
//		}else {
//			pageBar+="<a href='"+request.getContextPath()
//				+"/admin/qnaManage.do?cPage="+pageNo+"'>다음</a>";
//		}
//
//		request.setAttribute("pageBar", pageBar);
//		
//		request.setAttribute("list", list);
//		
//		request.getRequestDispatcher("/views/admin/qnaManage.jsp")
//		.forward(request, response);
		
		
		
		
//		int cPage;
//		int numPerpage=10;
		
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
				+"/admin/qnaManage.do?cPage="+(pageNo-1)+"'>이전</a></button>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/admin/qnaManage.do?cPage="+pageNo+"'><button class='customBtn btnStyle'>"+pageNo+"</button></a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<button class='customBtn btnStyle'>다음</button>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
				+"/admin/qnaManage.do?cPage="+pageNo+"'>다음</a>";
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
