package com.smtw.country.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.smtw.common.JDBCTemplate.*;
import com.smtw.country.model.vo.Country;

public class CountrytDao {
	private Properties sql=new Properties();
	
	public CountrytDao() {
		String path=CountrytDao.class.getResource("/sql/country/country_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Country> searchCountryList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Country> c=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCountry"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				c.add(getCountry(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
	}
	
	private Country getCountry(ResultSet rs) throws SQLException{
		return Country.builder()
				.nName(rs.getString("N_NAME"))
				.nLanguage(rs.getString("N_LANGUAGE"))
				.nTend(rs.getString("N_TEND"))
				.nPlace(rs.getString("N_PLACE"))
				.nSeason(rs.getString("N_SEASON"))
				.nImg(rs.getString("N_IMG"))
				.npharse(rs.getString("N_PHARSE"))
				.build();
	}
	
	public int insertCountry(Connection conn, Country c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertCountry"));
			pstmt.setString(1,c.getNName());
			pstmt.setString(2,c.getNLanguage());
			pstmt.setString(3, c.getNTend());
			pstmt.setString(4,c.getNPlace());
			pstmt.setString(5, c.getNSeason());
			pstmt.setString(6,c.getNImg());
			pstmt.setString(7,c.getNpharse());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}
}
