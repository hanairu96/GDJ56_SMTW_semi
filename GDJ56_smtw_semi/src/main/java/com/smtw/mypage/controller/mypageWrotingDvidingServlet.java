package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.friends.model.vo.Friends;
import com.smtw.mypage.model.service.MypageService;
import com.smtw.qna.model.vo.Qna;
import com.smtw.review.model.vo.Review;

/**
 * Servlet implementation class mypageWrotingDvidingServlet
 */
@WebServlet("/mypage/mypageWrotingDviding.do")
public class mypageWrotingDvidingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageWrotingDvidingServlet() {
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
		id = "USER01";
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
				+"/mypage/mypageWrotingDviding.do?cPage="+(pageNo-1)+"'>이전</a></button>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<button class='customBtn btnStyle'>"+pageNo+"</button>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/mypage/mypageWrotingDviding.do?cPage="+pageNo+"&id="+id+"'><button class='customBtn btnStyle'>"+pageNo+"</button></a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<button class='customBtn btnStyle'>다음</button>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
				+"/mypage/mypageWrotingDviding.do?cPage="+pageNo+"&id="+id+"'>다음</a>";
		}

		request.setAttribute("pageBar", pageBar);
		
		request.setAttribute("qlist", qlist);
		//request.getRequestDispatcher("/views/mypage/mypagenotereceive.jsp").forward(request, response);
		
		//내가 쓴 리뷰 글 불러오기
		int cPage2;
		int numPerpage2=3;
				
		try {
		cPage2=Integer.parseInt(request.getParameter("cPage2"));
		}catch(NumberFormatException e) {
					cPage2=1;
		}
				
				//test용 id : wkendbfl
				
				List<Review>rlist = new MypageService().getReviewList(id,cPage2,numPerpage2);
				System.out.println("내가 쓴 리뷰 리스트"+rlist);
			
				int totalData2=new MypageService().selectReviewListCount(id);
				System.out.println("내가 쓴 리뷰 글 갯수:"+totalData2);
				
				String pageBar2="";
				int pageBarSize2=5;
				int totalPage2=(int)Math.ceil((double)totalData2/numPerpage2);
				int pageNo2=((cPage2-1)/pageBarSize2)*pageBarSize2+1;//5
				int pageEnd2=pageNo2+pageBarSize2-1;//9
				
				if(pageNo2==1) {
					pageBar2+="<button class='customBtn btnStyle'>이전</button>";
				}else {
					pageBar2+="<button class='customBtn btnStyle'><a href='"+request.getContextPath()
						+"/mypage/mypageWrotingDviding.do?cPage2="+(pageNo2-1)+"'>이전</a></button>";
				}
				
				while(!(pageNo2>pageEnd2||pageNo2>totalPage2)) {
					if(cPage2==pageNo2) {
						pageBar2+="<button class='customBtn btnStyle'>"+pageNo2+"</button>";
					}else {
						pageBar2+="<a href='"+request.getContextPath()
						+"/mypage/mypageWrotingDviding.do?cPage2="+pageNo2+"&id="+id+"'><button class='customBtn btnStyle'>"+pageNo2+"</button></a>";
					}
					pageNo2++;
				}
				
				if(pageNo2>totalPage2) {
					pageBar2+="<button class='customBtn btnStyle'>다음</button>";
				}else {
					pageBar2+="<a href='"+request.getContextPath()
						+"/mypage/mypageWrotingDviding.do?cPage2="+pageNo2+"&id="+id+"'>다음</a>";
				}

				request.setAttribute("pageBar2", pageBar2);
				
				request.setAttribute("rlist", rlist);
				//request.getRequestDispatcher("/views/mypage/mypagenotereceive.jsp").forward(request, response);	
				
				
				
				//내가 쓴 프렌즈 글 불러오기
				int cPage3;
				int numPerpage3=3;
				
				try {
					cPage3=Integer.parseInt(request.getParameter("cPage3"));
				}catch(NumberFormatException e) {
					cPage3=1;
				}
				
				//test용 id : wkendbfl
				// 내가 쓴 프렌즈 글 불러오기
				List<Friends>flist = new MypageService().getFriendsList(id,cPage3,numPerpage3);
				System.out.println("내가 쓴 프렌즈 리스트"+flist);
				
				int totalData3=new MypageService().selectFriendsListCount(id);
				System.out.println("내가 쓴 프렌즈 글 갯수:"+totalData3);
				
				String pageBar3="";
				int pageBarSize3=5;
				int totalPage3=(int)Math.ceil((double)totalData3/numPerpage3);
				int pageNo3=((cPage3-1)/pageBarSize3)*pageBarSize3+1;//5
				int pageEnd3=pageNo3+pageBarSize3-1;//9
				
				if(pageNo3==1) {
					pageBar3+="<button class='customBtn btnStyle'>이전</button>";
				}else {
					pageBar3+="<button class='customBtn btnStyle'><a href='"+request.getContextPath()
					+"/mypage/mypageWrotingDviding.do?cPage="+(pageNo3-1)+"'>이전</a></button>";
				}
				
				while(!(pageNo3>pageEnd3||pageNo3>totalPage3)) {
					if(cPage3==pageNo3) {
						pageBar3+="<button class='customBtn btnStyle'>"+pageNo3+"</button>";
					}else {
						pageBar3+="<a href='"+request.getContextPath()
						+"/mypage/mypageWrotingDviding.do?cPage3="+pageNo3+"&id="+id+"'><button class='customBtn btnStyle'>"+pageNo3+"</button></a>";
					}
					pageNo3++;
				}
				
				if(pageNo3>totalPage3) {
					pageBar3+="<button class='customBtn btnStyle'>다음</button>";
				}else {
					pageBar3+="<a href='"+request.getContextPath()
					+"/mypage/mypageWrotingDviding.do?cPage3="+pageNo3+"&id="+id+"'>다음</a>";
				}
				
				request.setAttribute("pageBar3", pageBar3);
				
				request.setAttribute("flist", flist);
				request.getRequestDispatcher("/views/mypage/mypageWritingDviding.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
