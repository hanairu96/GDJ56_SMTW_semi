package com.smtw.country.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.getConnection;
import static com.smtw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smtw.country.model.dao.CountrytDao;
import com.smtw.country.model.vo.Country;

public class CountryService {
	private CountrytDao dao=new CountrytDao();
	
	
	public List<Country> searchCountry(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Country> result=dao.searchCountryList(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public List<Country> searchList(){
		Connection conn=getConnection();
		List<Country> result=dao.searchList(conn);
		close(conn);
		return result;
	}
	
	//페이징처리
	public int searchCountryCount() {
		Connection conn=getConnection();
		int result=dao.searchCountryCount(conn);
		close(conn);
		return result;
		
	}
	
	//나라추가
	public int insertCountry(Country c) {
		Connection conn=getConnection();
		int result=dao.insertCountry(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	//삭제
	public int deleteCountry(Country c) {
		Connection conn=getConnection();
		int result=dao.deleteCountry(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//나라정보 메인페이지 수정
	public Country searchNName(String name) {
		Connection conn=getConnection();
		Country c=dao.searchNName(conn,name);
		close(conn);
		return c;
	}
	
	//수정
	public int updateCountry(Country c) {
		Connection conn=getConnection();
		int result=dao.updateCountry(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
}
