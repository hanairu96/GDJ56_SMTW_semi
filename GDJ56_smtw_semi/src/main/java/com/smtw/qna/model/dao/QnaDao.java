package com.smtw.qna.model.dao;

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

import com.smtw.qna.model.vo.Qna;

public class QnaDao {
	
	private Properties sql=new Properties();
	
	public QnaDao() {
		String path=QnaDao.class.getResource("/sql/qna/qna_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Qna> selectQnaList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Qna> result=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQnaList"));

			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getQna(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectQnaCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQnaCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	public static Qna getQna(ResultSet rs) throws SQLException {
		return Qna.builder()
				.qnaNo(rs.getInt("Qna_No"))
				.memberId(rs.getString("member_Id"))
				.reviewTitle(rs.getString("review_Title"))
				.reviewContents(rs.getString("review_Contents"))
				.enrollDate(rs.getDate("enroll_Date"))
				.lockYn(rs.getString("lock_Yn").charAt(0))
				.password(rs.getString("password"))
				.build();
	}
	
}
