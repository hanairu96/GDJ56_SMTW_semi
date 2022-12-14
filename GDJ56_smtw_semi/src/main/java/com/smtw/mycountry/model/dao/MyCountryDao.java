package com.smtw.mycountry.model.dao;

import static com.smtw.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smtw.diary.model.dao.DiaryDao;
import com.smtw.diary.model.vo.Diary;
import com.smtw.mycountry.model.vo.MyCountry;

public class MyCountryDao {

	private Properties sql=new Properties();
	   
	   public MyCountryDao() {
	      try {
	         String path=MyCountryDao.class.getResource("/sql/mycountry/myCountry_sql.properties").getPath();
	         sql.load(new FileReader(path));
	      }catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	   public static MyCountry getMyCountry(ResultSet rs) throws SQLException{
	         return MyCountry.builder()
	               .nName(rs.getString("N_NAME"))
	               .nLanguage(rs.getString("N_LANGUAGE"))
	               .nTend(rs.getString("N_TEND"))
	               .nPlace(rs.getString("N_PLACE"))
	               .nSeason(rs.getString("N_SEASON"))
	               .nImg(rs.getString("N_IMG"))
	               .nPharse(rs.getString("N_PHARSE"))
	               .build();
	   }
	
	public List<MyCountry> searchMyCountry(Connection conn,String nLanguage, String nPlace, String nSeason, String nTend) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MyCountry> myCountry=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchMyCountry"));
			System.out.println(nLanguage+nPlace+nSeason+nTend);
			
			pstmt.setString(1, nLanguage);
			pstmt.setString(2, nTend);
			pstmt.setString(3, nPlace);
			pstmt.setString(4, nSeason);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				myCountry.add(getMyCountry(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			
		}
		return myCountry;
	}
}
