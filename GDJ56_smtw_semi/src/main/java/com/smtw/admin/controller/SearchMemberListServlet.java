package com.smtw.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.admin.model.service.MemberService;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class SearchMemberListServlet
 */
@WebServlet("/admin/searchMember.do")
public class SearchMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type="";
		if(request.getParameter("searchType").equals("userId")) {
			type="member_id";
		}else if(request.getParameter("searchType").equals("userName")) {
			type="member_name";			
		}
		
		String keyword=request.getParameter("searchKeyword");

		int cPage;
		int numPerpage=10;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		System.out.println(type);
		System.out.println(keyword);
		List<Member> list=new MemberService().selectMemberList(type, keyword, cPage, numPerpage);
		
		request.setAttribute("list", list);
		
		String pageBar="";
		int totalData=new MemberService().selectMemberCount(type, keyword);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<button class='customBtn btnStyle'>이전</button>";
		}else {
			pageBar+="<button class='customBtn btnStyle'><a href='"+request.getRequestURI()
			+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+(pageNo-1)+"'>이전</a></button>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
			}else {
				pageBar+="<button class='customBtn btnStyle'><a href='"+request.getRequestURI()
				+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+pageNo+"'>"+pageNo+"</a></button>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<button class='customBtn btnStyle'>다음</button>";
		}else {
			pageBar+="<button class='customBtn btnStyle'><a href='"+request.getRequestURI()
			+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+pageNo+"'>다음</a></button>";
		}
		
		request.setAttribute("pageBar", pageBar);
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/admin/memberList.jsp");
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
