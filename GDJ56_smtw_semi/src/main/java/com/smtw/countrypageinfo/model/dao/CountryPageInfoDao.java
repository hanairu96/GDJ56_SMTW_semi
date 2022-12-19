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

import com.smtw.country.model.vo.CountryPage;
import com.smtw.country.model.vo.CountryPageInfo;

public class CountryPageInfoDao {
	private Properties sql=new Properties();
	
	public CountryPageInfoDao() {
		String path=CountryPageInfoDao.class.getResource("/sql/country/countryPageInfo_sql.properties").getPath();
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
			pstmt.setString(2, c.getCLanguage());
			pstmt.setString(3, c.getUrban());
			pstmt.setString(4, c.getMoney());
			pstmt.setString(5, c.getElect());
			pstmt.setString(6, c.getMapAddress());
			pstmt.setString(7, c.getEnglishName());
			pstmt.setString(8, c.getClock());
			pstmt.setString(9, c.getCPic());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public CountryPageInfo searchName(Connection conn, String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPageInfo cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchName"));
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getContryInfo(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}

	public int updateInfo(Connection conn, CountryPageInfo c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateinfo"));
			pstmt.setString(1, c.getCLanguage());
			pstmt.setString(2, c.getUrban());
			pstmt.setString(3, c.getMoney());
			pstmt.setString(4, c.getElect());
			pstmt.setString(5, c.getMapAddress());
			pstmt.setString(6, c.getEnglishName());
			pstmt.setString(7, c.getClock());
			pstmt.setString(8, c.getCPic());
			pstmt.setString(9, c.getNName());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		}
		
	
	
	
	//CountryPage의 dao항목들
	//전체출력
	public List<CountryPage> selectCoAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CountryPage> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCoAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getCountryPage(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	

	public CountryPage coArea(Connection conn,String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInfototal"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}
	
	public CountryPage whVisa(Connection conn,String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInfototal"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}
	public CountryPage safe(Connection conn,String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInfototal"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}
	
	public CountryPage stay(Connection conn,String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInfototal"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}
	
	public CountryPage job(Connection conn,String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cp=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectInfototal"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) cp=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cp;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static CountryPage getCountryPage(ResultSet rs) throws SQLException{
		return CountryPage.builder()
				.nName(rs.getString("N_NAME"))
				.nInfo(rs.getString("N_INFO"))
				.nVisa(rs.getString("N_VISA"))
				.nSafety(rs.getNString("N_SAFETY"))
				.nSettle(rs.getString("N_SETTLE"))
				.nJob(rs.getString("N_JOB"))
				.build();
	}		
	
	
	public int insertContent(Connection conn, CountryPage c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertct"));
			pstmt.setString(1, c.getNName());
			pstmt.setString(2, c.getNInfo());
			pstmt.setString(3,c.getNVisa());
			pstmt.setString(4, c.getNSafety());
			pstmt.setString(5, c.getNSettle());
			pstmt.setString(6, c.getNJob());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public CountryPage selectPageName(Connection conn, String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CountryPage cc=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectPageName"));
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()) cc=getCountryPage(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return cc;
		
	}
	
	public int updateContent(Connection conn, CountryPage c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateContent"));
			pstmt.setString(1, c.getNInfo());
			pstmt.setString(2, c.getNVisa());
			pstmt.setString(3, c.getNSafety());
			pstmt.setString(4, c.getNSettle());
			pstmt.setString(5, c.getNJob());
			pstmt.setString(6, c.getNName());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
}
