package com.smtw.country.model.dao;

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

import com.smtw.country.model.vo.Country;
import com.smtw.country.model.vo.CountryPageInfo;
import com.smtw.country.model.vo.Likenation;

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
	
	public List<Country> searchCountryList(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Country> c=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCountry"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2,cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Country co=getCountry(rs);
				co.setInfo(getContryInfo(rs));
				c.add(co);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
	}
	
	
	//국가 및 지역정보 메인페이지에 리스트를 전부 출력하기 위한 로직
	public List<Country> searchList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Country> c=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				c.add(getCountry(rs));
				Country co=getCountry(rs);
				co.setInfo(getContryInfo(rs));
				c.add(co);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
		
		
	}
	
	
	//페이징처리
	public int searchCountryCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCountryCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	
	public static Country getCountry(ResultSet rs) throws SQLException{
		return Country.builder()
				.nName(rs.getString("N_NAME"))
				.nLanguage(rs.getString("N_LANGUAGE"))
				.nTend(rs.getString("N_TEND"))
				.nPlace(rs.getString("N_PLACE"))
				.nSeason(rs.getString("N_SEASON"))
				.nImg(rs.getString("N_IMG"))
				.npharse(rs.getString("N_PHARSE"))
				.emergency(rs.getString("N_EMERGENCY"))
				.build();
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
	
	//추가
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
	
	//삭제
	public int deleteCountry(Connection conn, Country c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteCountry"));
			pstmt.setString(1,  c.getNName());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//수정을위해 정보를 가져옴
	public Country searchNName(Connection conn, String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Country c=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchNName"));
			pstmt.setString(1,name);
			rs=pstmt.executeQuery();
			if(rs.next()) c=getCountry(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
	}
	
	public int updateCountry(Connection conn, Country c) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateCountry"));
			pstmt.setString(1, c.getNLanguage());
			pstmt.setString(2, c.getNTend());
			pstmt.setString(3, c.getNPlace());
			pstmt.setString(4, c.getNSeason());
			pstmt.setString(5, c.getNImg());
			pstmt.setString(6, c.getNpharse());
			pstmt.setString(7, c.getEmergency());
			pstmt.setString(8, c.getNName());
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	//좋아요 기능에 대한 dao
	public int insertlike(Connection conn,String id,String name ) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertlike"));
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deletLikeCountry(Connection conn, String id) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deletLikeCountry"));
			pstmt.setString(1,id);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Likenation selectLike(Connection conn, String id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Likenation n=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectLike"));
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) n=getLikenation(rs);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
	}
	
	public static Likenation getLikenation(ResultSet rs) throws SQLException{
		return Likenation.builder()
				.memId(rs.getString("MEMBER_ID"))
				.nName(rs.getString("N_NAME"))
				.ckLike(rs.getString("CK_LIKE"))
				.build();
	}
	
	
		
}
