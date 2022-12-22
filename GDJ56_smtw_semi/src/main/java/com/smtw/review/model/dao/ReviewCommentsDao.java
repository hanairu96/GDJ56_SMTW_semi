package com.smtw.review.model.dao;


import static com.smtw.common.JDBCTemplate.*;
import static com.smtw.common.JDBCTemplate.close;


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
import com.smtw.review.model.vo.ReviewComments;

import java.util.Properties;

public class ReviewCommentsDao {

		
	private Properties sql=new Properties();
	
	public ReviewCommentsDao() {
		String path=ReviewCommentsDao.class.getResource("/sql/review/reviewComments_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	private ReviewComments getReviewComments(ResultSet rs)throws SQLException{
		return ReviewComments.builder()
				.rcNo(rs.getInt("RC_NO"))
				.reviewCommentLevel(rs.getInt("REVIEW_COMMENT_LEVEL"))
				.reviewCommentRef(rs.getInt("REVIEW_COMMENT_REF"))
				.rcContents(rs.getString("RC_CONTENTS"))
				.enrollDate(rs.getDate("ENROLL_DATE"))
				.reviewNo2(rs.getInt("REVIEW_NO2"))
				.memberId(rs.getString("MEMBER_ID"))
				.qcCount(rs.getInt("count"))
				.build();
	}
	
	
	
	
	
	// 댓글 출력  ReviewNo
	public   List<ReviewComments>   selectReviewComments (Connection conn,int ReviewNo){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ReviewComments> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectReviewComments"));
			pstmt.setInt(1, ReviewNo);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getReviewComments(rs));
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
		
			
		
	}
	
	
	public int insertReviewComments(Connection conn,int qcLevel,String qnaQcRef, String comment,int qnaNo, String writer) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertReviewComments"));
			pstmt.setInt(1, qcLevel);
			pstmt.setString(2,  qnaQcRef.equals("0")?null:qnaQcRef);  // 추후에 에러 발생 가능
			pstmt.setString(3, comment);
			pstmt.setInt(4, qnaNo);
			pstmt.setString(5, writer);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	//댓글삭제
		public int deleteReviewComment(Connection conn, int qnaNo, int qcNo) {
			PreparedStatement pstmt=null;
			int result=0;
			
			try {
				pstmt=conn.prepareStatement(sql.getProperty("deleteReviewComment"));
				pstmt.setInt(1, qnaNo);
				pstmt.setInt(2, qcNo);
				
				result=pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}
	
	
	
	
	
	
	
	
}
