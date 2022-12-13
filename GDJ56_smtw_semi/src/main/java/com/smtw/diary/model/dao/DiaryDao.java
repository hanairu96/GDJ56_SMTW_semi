package com.smtw.diary.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.smtw.common.JDBCTemplate.close;
import com.smtw.diary.model.vo.Diary;

public class DiaryDao {

	private Properties sql=new Properties();
	   
	   public DiaryDao() {
	      try {
	         String path=DiaryDao.class.getResource("/sql/diary/diary_sql.properties").getPath();
	         sql.load(new FileReader(path));
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	   public static Diary getDiary(ResultSet rs) throws SQLException{
	         return Diary.builder()
	               .memberId(rs.getString("MEMBER_ID"))
	               .dDay(rs.getString("D_DAY"))
	               .alarm(rs.getString("ALARM"))
	               .build();
	   }
	
	public Diary searchDiary(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Diary diary=new Diary();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchDiary"));
			
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery(); 
			if(rs.next()) {
				diary=getDiary(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			
		}
		return diary;
	}
	
	public int insertDiary(Connection conn, String memberId, String leavingdate, String alarmYN) {
		 PreparedStatement pstmt=null;
		   int result=0;
		   try {
			   pstmt=conn.prepareStatement(sql.getProperty("insertDiary"));
			   pstmt.setString(1, memberId);
			   pstmt.setString(2, leavingdate);
			   pstmt.setString(3, String.valueOf(alarmYN));
			   
			   result=pstmt.executeUpdate();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }finally {
	           close(pstmt);
		   }
		   return result;
	}
	
	public int updateDiary(Connection conn, String memberId, String leavingdate, String alarmYN) {
		   PreparedStatement pstmt=null;
		   int result=0;
		   
		   try {
			   pstmt=conn.prepareStatement(sql.getProperty("updateDiary"));
			   pstmt.setString(1, leavingdate);
			   pstmt.setString(2, String.valueOf(alarmYN));
			   pstmt.setString(3, memberId);
			   
			   result=pstmt.executeUpdate();
			   
		   }catch(SQLException e){
			   e.printStackTrace();
		   }finally{
			   close(pstmt);
		   }
		   return result;
		}
}
