package com.smtw.review.model.dao;

import static com.smtw.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smtw.review.model.vo.Review;


public class ReviewDao {
	
	private Properties sql=new Properties();
	
	public ReviewDao() {
		String path=ReviewDao.class
				.getResource("/sql/review/reviewsql.properties")
				.getPath();
		
		try {
			
			sql.load(new FileReader(path));
			
			
		}catch(IOException e) {
			
			e.printStackTrace();
		}
		
		
		
	}
	
	private Review getReview(ResultSet rs) throws SQLException{
		return Review.builder()
				.reviewNo(rs.getInt("REVIEW_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.nationName(rs.getString("N_NAME"))
				.reviewTitle(rs.getString("REVIEW_TITLE"))
				.reviewContnet(rs.getString("REVIEW_CONTENTS"))
				.enrollDate(rs.getDate("ENROLL_DATE"))
				.reviewCity(rs.getString("REVIEW_CITY"))
				.reviewSat(rs.getInt("REVIEW_SAT"))
				.build();
	}
		
	
	
	
	
	public List<Review>  searchReviewAll(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review r=null;
		List<Review> list=new ArrayList();
		
		try {

			
			pstmt=conn.prepareStatement(sql.getProperty("searchReviewAll"));
			//시작값
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			//끝값
			pstmt.setInt(2, cPage*numPerpage);
			
			
		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				r=getReview(rs);
				//
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
		
		
		
	}
	
	
	public int selectReviewCount(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		
		
		try {

			pstmt=conn.prepareStatement(sql.getProperty("selectReviewCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);   //rs.getInt("cnt");
			
		
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
		
		
	}
	
	
	
}
