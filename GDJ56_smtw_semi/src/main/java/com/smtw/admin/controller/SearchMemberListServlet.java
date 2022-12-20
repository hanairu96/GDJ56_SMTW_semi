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
			pageBar+="<li class='page-item disabled' style='color:rgba(221, 160, 221, 0.508) !important;'>"
					+"<a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}else {
			pageBar+="<li><a class='page-link' href='"
					+request.getRequestURI()+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+(pageNo-1)
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"
						+request.getRequestURI()+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+pageNo
						+"' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"
					+request.getRequestURI()+"?searchType="+type+"&searchKeyword="+keyword+"&cPage="+pageNo
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
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
