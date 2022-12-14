package com.smtw.countrypageinfo.model.dao;

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

import com.smtw.country.model.vo.CountryPageInfo;

public class CountryPageInfoDao {
	private Properties sql=new Properties();
	
	public CountryPageInfoDao() {
		String path=CountryPageInfoDao.class.getResource("/sql/countryPageInfo/countryPageInfo_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<CountryPageInfo> searchAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CountryPageInfo> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getContryInfo(rs));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
		
	}
	
	
	public static CountryPageInfo getContryInfo(ResultSet rs) throws SQLException{
		return CountryPageInfo.builder()
				.nName(rs.getString("N_NAME"))
				.cLanguage(rs.getString("C_LANGUAGE"))
				.urban(rs.getString("URBAN"))
				.money(rs.getString("MONEY"))
				.elect(rs.getString("ELECT"))
				.mapAddress(rs.getString("MAPADDRESS"))
				.englishName(rs.getString("ENGLISHNAME"))
				.clock(rs.getString("CLOCK"))
				.cPic(rs.getString("C_PIC"))
				.build();
	}
	
	
	public int insertCountry(Connection conn, CountryPageInfo c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertCountryInfo"));
			pstmt.setString(1, c.getNName());
			pstmt.setString(2, c.getCPic());
			pstmt.setString(3, c.getCLanguage());
			pstmt.setString(4, c.getUrban());
			pstmt.setString(5, c.getMoney());
			pstmt.setString(6, c.getElect());
			pstmt.setString(7, c.getMapAddress());
			pstmt.setString(8, c.getEnglishName());
			pstmt.setString(9, c.getClock());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
