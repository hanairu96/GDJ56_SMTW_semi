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

import com.smtw.qna.model.vo.Faq;

public class FaqDao {
	private Properties sql=new Properties();
	
	public FaqDao() {
		String path=QnaDao.class.getResource("/sql/qna/faq_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Faq> selectFaqList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Faq> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFaqList"));
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getFaq(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int updateFaq(Connection conn,String faqQue,String faqAns,String faqNo){
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateFaq"));
			pstmt.setString(1,faqQue );
			pstmt.setString(2, faqAns);
			pstmt.setString(3, faqNo);
			
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	public static Faq getFaq(ResultSet rs) throws SQLException{
		return Faq.builder()
				.faqNo(rs.getInt("faq_no"))
				.faqTitle(rs.getString("faq_title"))
				.faqContents(rs.getString("faq_contents"))
				.build();
	}
}
