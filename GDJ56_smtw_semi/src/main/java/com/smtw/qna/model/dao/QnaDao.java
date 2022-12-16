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

import com.smtw.notice.model.vo.Notice;
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
	
	//Q&A 글 작성-> DB에 저장
	public int insertQna(Connection conn,String writer,String title,String contents) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertQna"));
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//제목,내용,작성자 별 검색
		public List<Qna> searchQna(Connection conn, String option,String qna,int cPage,int numPerpage){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Qna> list=new ArrayList();
			
			String query=sql.getProperty("searchQna");
			query=query.replace("$COL", option);
			
			try {
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"%"+qna+"%");
				pstmt.setInt(2, (cPage-1)*numPerpage+1);
				pstmt.setInt(3, cPage*numPerpage);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					list.add(getQna(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return list;
		}
		
		public int selectQnaCount(Connection conn,String option,String qna) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int result=0;
			String query=sql.getProperty("selectQnaCountKeyword");
			query=query.replace("$COL", option);
			try {
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1,"%"+qna+"%");
				rs=pstmt.executeQuery();

				if(rs.next()) result=rs.getInt(1);
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return result;
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
