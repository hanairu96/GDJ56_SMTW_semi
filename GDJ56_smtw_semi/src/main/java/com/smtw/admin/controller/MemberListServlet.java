package com.smtw.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.admin.model.service.MemberService;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class MemberListServlet
 */
@WebServlet("/admin/memberList.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		int numPerpage=10;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		List<Member> list=new MemberService().selectMemberList(cPage, numPerpage);
		
		int totalData=new MemberService().selectMemberCount();
		
		String pageBar="";
		int pageBarSize=5;
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled' style='color:rgba(221, 160, 221, 0.508) !important;'>"
					+"<a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}else {
			pageBar+="<li><a class='page-link' href='"+request.getContextPath()+"/admin/memberList.do?cPage="+(pageNo-1)
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>이전</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"
						+request.getContextPath()+"/admin/memberList.do?cPage="+pageNo
						+"' style='color:rgba(221, 160, 221, 0.508) !important;'>"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'><a class='page-link' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href='"
					+request.getContextPath()+"/admin/memberList.do?cPage="+pageNo
					+"' style='color:rgba(221, 160, 221, 0.508) !important;'>다음</a></li>";
		}
		
		List<Member> listAll=new MemberService().selectMemberListAll(); //페이징 처리 되지 않은 회원 전체 리스트

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("listAll", listAll);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/admin/memberList.jsp")
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
