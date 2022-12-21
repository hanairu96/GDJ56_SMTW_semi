package com.smtw.review.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smtw.review.model.service.ReviewService;
import com.smtw.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateEndServlet
 */
@WebServlet("/community/updateReviewEnd.do")
public class ReviewUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		
		
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
		//경로 설정
		String path=request.getServletContext().getRealPath("/upload/review");	
			
		//저장 파일 설정
		int maxSize=1024*1024*1024;  //1GB
		
		//인코딩 설정
		String encoding="UTF-8";
		
		//rename 클래스  설정
		DefaultFileRenamePolicy dfr=new DefaultFileRenamePolicy();
		
		//매개변수있는 생성자로 MultipartRequest클래스를 생성  //결국에 request 객체니까  getParameter를 이용한다.
		MultipartRequest mr=new MultipartRequest(request, 
				path,maxSize,encoding,dfr);
		
		
		int reviewNo=Integer.parseInt(mr.getParameter("reviewNo"));
		String userId=mr.getParameter("userId"); // 작성자
		String reviewTitle=mr.getParameter("reviewTitle"); //제목
		
		//수정요망시-> 스크립트로  히든 타입을 이용하기-> 나라값 받아옴 해결 완료
		String reviewNation=mr.getParameter("reviewNation");  //나라   
		//System.out.println("reviewNation 값 : "+reviewNation);
		
		String reviewCity=mr.getParameter("reviewCity"); // 도시
		int reviewSat=Integer.parseInt(mr.getParameter("reviewSat"));  //만족도
		
		//수정요망시->구조 바꾸기
		String content=mr.getParameter("summernote");  // 내용
		
		
		//수정요망시->구조 바꾸기
		//리네임  파일 내용
		//대표사진 파일 첨부
		String fileName=mr.getFilesystemName("upFile");
	//	String oriName=mr.getOriginalFileName("upFile");
		
		
		
		// 객체 생성
				Review newR= Review.builder()
						.reviewNo(reviewNo)
						.memberId(userId)
						.reviewTitle(reviewTitle)
						.nationName(reviewNation)
						.reviewCity(reviewCity)
						.reviewSat(reviewSat)
						.reviewFileName(fileName)
						.reviewContnet(content)
						.build();
		
				
				
				int result=new ReviewService().updateReview(newR);
				
				
				
			
				
				
				
				String msg="", loc="";
				
				if(result>0) {
					msg="리뷰가 수정됨";
					loc="/community/reviewBasic.do";	
					
					
					//기존업로드 파일 삭제 #1
					//oriFile
				String oriFile=mr.getParameter("oriFile");
					
			System.out.println("oriFile가뵤 : "+oriFile);
				
					//방안들
					
					
					//mr.getParameter  // 
					//mr.getFilesystemName // 
					
					//request.getParameter  // 
			
			//request.getFilesystemName // 쓸수없음
					
					
					
					//기존 업로드 파일 삭제하기  #2
					
					// path 설정도 다시해야함
			String deletepath=getServletContext().getRealPath("/upload/review/");
			
			
					
					File delFile=new File(deletepath+oriFile);
					if(delFile.exists()) delFile.delete();
					
					
					
					
				}else {
					msg="리뷰가 수정 실패 다시수정해주세요";
					loc="/community/updateReviewEnd.do?reviewNo="+newR.getReviewNo();
					
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				request.getRequestDispatcher("/views/common/msg.jsp")
				.forward(request, response);
				
				
				
				
				
				
		
		}
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
