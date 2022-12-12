package com.smtw.review.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.review.model.dao.ReviewDao;
import com.smtw.review.model.vo.Review;

public class ReviewService {

	
	private ReviewDao dao =new  ReviewDao();
	
	
	
	public List<Review> searchReviewAll(int cPage,int numPerpage){
		 Connection conn=getConnection();
		 
		 List<Review> list=dao.searchReviewAll(conn,cPage,numPerpage);
		 
		 close(conn);
		 
		 return list;
		 
		 
		
		 
		 
	}
	
	
	 public int   selectReviewCount() {
		 Connection conn=getConnection();

		 int result=dao.selectReviewCount(conn);
		 close(conn);
		 
		 return result;
		 
		 
	 }
	
	
	
	
	
	
	
	
	
}
