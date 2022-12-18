package com.smtw.review.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.review.model.dao.ReviewDao;
import com.smtw.review.model.vo.Review;

public class ReviewService {

	
	private ReviewDao dao =new  ReviewDao();
	
	
	
	public List<Review> searchReviewAll(int cPage,int numPerpage,String stateSort){
		 Connection conn=getConnection();
		 
		 List<Review> list=dao.searchReviewAll(conn,cPage,numPerpage,stateSort);
		 
		 close(conn);
		 
		 return list;
		 
	
		
		 
		 
	}
	
	
	 public int  selectReviewCount() {
		 Connection conn=getConnection();

		 int result=dao.selectReviewCount(conn);
		 close(conn);
		 
		 return result;
		 
		 
	 }
	
	
	 public List<Review> searchReviewList(String type,String keyword, int cPage, int numPerpage,String stateSort){
		 Connection conn=getConnection();
		 
		 List<Review> list=dao.searchReviewList(conn,type,keyword,cPage,numPerpage,stateSort);
		 
		 close(conn);
		 
		 return list;
		 
	
		 
		 
	}
	 
	 public int selectReviewCount(String type,String keyword) {
		 
		 Connection conn=getConnection();		
		  
		  int result=dao.selectReviewCount(conn,type,keyword);
			 close(conn);
			 
			 return result;
		 
		 
	 }
	
	 
	 
	 /// 여기까지  reviewBasic.jsp에 사용되는 메소드
	 
	 
	//상세화면
	 
	 
	public Review readReview(int ReviewNo) {
		
		Connection conn=getConnection();
		
		Review readReview=dao.readReview(conn,ReviewNo);
		
		return  readReview;
		
		
	}
	 
	 
	 
	
	
	
	
	
}
