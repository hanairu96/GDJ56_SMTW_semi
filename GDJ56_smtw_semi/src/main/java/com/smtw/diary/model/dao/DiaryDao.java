package com.smtw.diary.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.smtw.common.JDBCTemplate.close;

import com.smtw.diary.model.vo.CheckList;
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
	               .memberId(rs.getString("MEMBER_ID2"))
	               .dDay(rs.getString("D_DAY"))
	               .alarm(rs.getString("ALARM"))
	               .build();
	   }
	   
	   public static CheckList getCheckList(ResultSet rs) throws SQLException{
	         return CheckList.builder()
	               .memberId(rs.getString("MEMBER_ID2"))
	               .passport(rs.getString("PASSPORT").charAt(0))
	               .doller(rs.getString("DOLLER").charAt(0))
	               .resume(rs.getString("RESUME").charAt(0))
	               .sim(rs.getString("SIM").charAt(0))
	               .surplus(rs.getString("SURPLUS").charAt(0))
	               .insurance(rs.getString("INSURANCE").charAt(0))
	               .hCheckup(rs.getString("H_CHECKUP").charAt(0))
	               .vCertificate(rs.getString("V_CERTIFICATE").charAt(0))
	               .ticket(rs.getString("TICKET").charAt(0))
	               .multitab(rs.getString("MULTITAB").charAt(0))
	               .em(rs.getString("EM").charAt(0))
	               .roaming(rs.getString("ROAMING").charAt(0))
	               .aCertificate(rs.getString("A_CERTIFICATE").charAt(0))
	               .certificate(rs.getString("CERTIFICATE").charAt(0))
	               .reservation(rs.getString("RESERVATION").charAt(0))
	               .iLicense(rs.getString("I_LICENSE").charAt(0))
	               .creditCard(rs.getString("CREDIT_CARD").charAt(0))
	               .eContact(rs.getString("E_CONTACT").charAt(0))
	               .clothing(rs.getString("CLOTHING").charAt(0))
	               .dailyNecessity(rs.getString("DAILY_NECESSITY").charAt(0))
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
	
	public CheckList searchCheckList(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CheckList checkList=new CheckList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCheckList"));
			
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery(); 
			if(rs.next()) {
				checkList=getCheckList(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			
		}
		return checkList;
	}
	
	public int insertCheckList(Connection conn, CheckList check) {
		 PreparedStatement pstmt=null;
		   int result=0;
		   try {
			   pstmt=conn.prepareStatement(sql.getProperty("insertCheckList"));
			   pstmt.setString(1, check.getMemberId());
			   pstmt.setString(2, String.valueOf(check.getPassport()));
			   pstmt.setString(3, String.valueOf(check.getDoller()));
			   pstmt.setString(4, String.valueOf(check.getResume()));
			   pstmt.setString(5, String.valueOf(check.getSim()));
			   pstmt.setString(6, String.valueOf(check.getSurplus()));
			   pstmt.setString(7, String.valueOf(check.getInsurance()));
			   pstmt.setString(8, String.valueOf(check.getHCheckup()));
			   pstmt.setString(9, String.valueOf(check.getVCertificate()));
			   pstmt.setString(10, String.valueOf(check.getTicket()));
			   pstmt.setString(11, String.valueOf(check.getMultitab()));
			   pstmt.setString(12, String.valueOf(check.getEm()));
			   pstmt.setString(13, String.valueOf(check.getRoaming()));
			   pstmt.setString(14, String.valueOf(check.getACertificate()));
			   pstmt.setString(15, String.valueOf(check.getCertificate()));
			   pstmt.setString(16, String.valueOf(check.getReservation()));
			   pstmt.setString(17, String.valueOf(check.getILicense()));
			   pstmt.setString(18, String.valueOf(check.getCreditCard()));
			   pstmt.setString(19, String.valueOf(check.getEContact()));
			   pstmt.setString(20, String.valueOf(check.getClothing()));
			   pstmt.setString(21, String.valueOf(check.getDailyNecessity()));
			   
			   result=pstmt.executeUpdate();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }finally {
	           close(pstmt);
		   }
		   return result;
	}
	
	public int updateCheckList(Connection conn, CheckList check) {
		PreparedStatement pstmt=null;
		   int result=0;
		   
		   try {
			   pstmt=conn.prepareStatement(sql.getProperty("updateCheckList"));
			   pstmt.setString(1, String.valueOf(check.getPassport()));
			   pstmt.setString(2, String.valueOf(check.getDoller()));
			   pstmt.setString(3, String.valueOf(check.getResume()));
			   pstmt.setString(4, String.valueOf(check.getSim()));
			   pstmt.setString(5, String.valueOf(check.getSurplus()));
			   pstmt.setString(6, String.valueOf(check.getInsurance()));
			   pstmt.setString(7, String.valueOf(check.getHCheckup()));
			   pstmt.setString(8, String.valueOf(check.getVCertificate()));
			   pstmt.setString(9, String.valueOf(check.getTicket()));
			   pstmt.setString(10, String.valueOf(check.getMultitab()));
			   pstmt.setString(11, String.valueOf(check.getEm()));
			   pstmt.setString(12, String.valueOf(check.getRoaming()));
			   pstmt.setString(13, String.valueOf(check.getACertificate()));
			   pstmt.setString(14, String.valueOf(check.getCertificate()));
			   pstmt.setString(15, String.valueOf(check.getReservation()));
			   pstmt.setString(16, String.valueOf(check.getILicense()));
			   pstmt.setString(17, String.valueOf(check.getCreditCard()));
			   pstmt.setString(18, String.valueOf(check.getEContact()));
			   pstmt.setString(19, String.valueOf(check.getClothing()));
			   pstmt.setString(20, String.valueOf(check.getDailyNecessity()));
			   pstmt.setString(21, check.getMemberId());
			   
			   result=pstmt.executeUpdate();
			   
		   }catch(SQLException e){
			   e.printStackTrace();
		   }finally{
			   close(pstmt);
		   }
		   return result;
		
	}
	
	public int deleteDiary(Connection conn,String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteDiary"));
			pstmt.setString(1, memberId);
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
}
