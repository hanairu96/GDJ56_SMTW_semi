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
				.reviewFileName(rs.getString("FILENAME"))
				.build();
	}
	
	
	
	
	
	public List<Review>  searchReviewAll(Connection conn,int cPage,int numPerpage,String stateSort){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review r=null;
		List<Review> list=new ArrayList();
		String query=sql.getProperty("searchReviewAll");
		String addQuery = "";
		if(stateSort != null) {
			addQuery += " " + stateSort +" ";
		}
		addQuery += ")R)WHERE rnum BETWEEN ? AND ?";
		//System.out.println(query+addQuery);
		try {

			//기존 쿼리문
			//SELECT * FROM (SELECT rownum AS rnum, R.* FROM (SELECT * FROM REVIEW)R) WHERE rnum BETWEEN ? AND ?
			//변경하고 싶은 쿼리문
//			SELECT * FROM 
//			(SELECT rownum AS rnum, R.* FROM (SELECT * FROM REVIEW ORDER BY enroll_date DESC)R)
//			WHERE rnum BETWEEN 3 AND 5;
			
			pstmt=conn.prepareStatement(query + addQuery);			
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
	
public List<Review> searchReviewList(Connection conn,String type,String keyword,int cPage,int numPerpage,String stateSort){
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	
		List<Review> result=new ArrayList();
		
		String query=sql.getProperty("searchReviewListKeyword");
		//SELECT *FROM REVIEW WHERE $COL LIKE ?
		//System.out.println(type);
		query=query.replace("$COL",type);
		///   여기까지가   SELECT * FROM(SELECT ROWNUM AS RNUM,R.*FROM(SELECT *FROM REVIEW WHERE $COL LIKE ?
		
		
		String addQuery="";
		if(stateSort != null) {
			addQuery += " " + stateSort +" ";
		}
		addQuery += ")R)WHERE rnum BETWEEN ? AND ?";
		
	//  )R) WHERE RNUM BETWEEN ? AND ?
		
		
		
		
		try {
			pstmt=conn.prepareStatement(query+addQuery);
			pstmt.setString(1, "%"+keyword+"%");   //  % 는   이음검색이나 아이디 검색할떄 포함하는 기호
			
			//시작값
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			//끝값
			pstmt.setInt(3, cPage*numPerpage);
			
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getReview(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
		
		
	}
	
	

	public int selectReviewCount(Connection conn,String type, String keyword) {
		   
		  PreparedStatement pstmt=null;
			ResultSet rs=null;
			int result=0;
			String query=sql.getProperty("selectReviewCountKeyword");
			query=query.replace("$COL", type);
			try {
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"%"+keyword+"%");
				rs=pstmt.executeQuery();
				if(rs.next()) result=rs.getInt(1);   //		1 대신   count(*) 여도 상관없음   성별  아이디
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return result;
			   
			   
		  }


	
	///상세화면에대한 메소드
	
	public Review readReview(Connection conn,int ReviewNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review readReview=null;
	
		//String query=sql.getProperty("readReview");
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("readReview"));
			pstmt.setInt(1,ReviewNo);
			//
			rs=pstmt.executeQuery();
			if(rs.next()) {
				readReview=getReview(rs);
				
			}
			
		
			
		}catch(SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}return readReview;
		
		
		
	}

	
	//리뷰 작성에 대한 메소드
	public int  insertReview(Connection conn, Review r) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertReview"));
			//sql 문에 ? 설정
//			1.작성자 아이디
//			2.나라
//			3.제목
//			4내용
//			5도시
//			6만족도
//			7파일명
			pstmt.setString(1, r.getMemberId());
			pstmt.setString(2, r.getNationName());
			pstmt.setString(3, r.getReviewTitle());
			pstmt.setString(4, r.getReviewCity());
			pstmt.setInt(5, r.getReviewSat());
			pstmt.setString(6, r.getReviewFileName());
			pstmt.setString(7, r.getReviewContnet());
			//
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
		
		
		
		
	}
	
	
	
	
	
}
