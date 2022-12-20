package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mypage.model.service.MypageService;
import com.smtw.qna.model.vo.Qna;

/**
 * Servlet implementation class mypageWroteQnaServlet
 */
@WebServlet("/mypage/mypageWroteQna.do")
public class mypageWroteQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageWroteQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		//내가 쓴 질문 글 불러오기
				int cPage;
				int numPerpage=3;
				
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				
				//test용 id 
				
				List<Qna>qlist = new MypageService().getQnaList(id,cPage,numPerpage);
				System.out.println("내가 쓴 질문 리스트"+qlist);
			
				int totalData=new MypageService().selectQnaListCount(id);
				System.out.println("내가 쓴 질문 글 갯수:"+totalData);
				
				String pageBar="";
				int pageBarSize=5;
				int totalPage=(int)Math.ceil((double)totalData/numPerpage);
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;//5
				int pageEnd=pageNo+pageBarSize-1;//9
				
				if(pageNo==1) {
					pageBar+="<button class='customBtn btnStyle'>이전</button>";
				}else {
					pageBar+="<button class='customBtn btnStyle'><a href='"+request.getContextPath()
						+"/mypage/mypageWroteQna.do?cPage="+(pageNo-1)+"'>이전</a></button>";
				}
				
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(cPage==pageNo) {
						pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
					}else {
						pageBar+="<a href='"+request.getContextPath()
						+"/mypage/mypageWroteQna.do?cPage="+pageNo+"&id="+id+"'><button class='customBtn btnStyle'>"+pageNo+"</button></a>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<button class='customBtn btnStyle'>다음</button>";
				}else {
					pageBar+="<a href='"+request.getContextPath()
						+"/mypage/mypageWroteQna.do?cPage="+pageNo+"&id="+id+"'>다음</a>";
				}

				request.setAttribute("pageBar", pageBar);
				
				request.setAttribute("qlist", qlist);
				request.getRequestDispatcher("/views/mypage/mypageWroteQna.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
