package com.smtw.countrypageinfo.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.getConnection;
import static com.smtw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smtw.country.model.vo.CountryPage;
import com.smtw.country.model.vo.CountryPageInfo;
import com.smtw.countrypageinfo.model.dao.CountryPageInfoDao;

public class CountryPageInfoService {
	private CountryPageInfoDao dao=new CountryPageInfoDao();
	
	public List<CountryPageInfo> searchAll(){
		Connection conn=getConnection();
		List<CountryPageInfo> result=dao.searchAll(conn);
		close(conn);
		return result;
	}
	
	
	
	public int insertInfo(CountryPageInfo c) {
		Connection conn=getConnection();
		int result=dao.insertCountry(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	
	public CountryPageInfo searchName(String name) {
		Connection conn=getConnection();
		CountryPageInfo cp=dao.searchName(conn,name);
		close(conn);
		return cp;
	}
	
	
	public int updateInfo(CountryPageInfo c) {
		Connection conn=getConnection();
		int result=dao.updateInfo(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
//////countrypage의 service항목들
	
	//ajax전체 출력
	public List<CountryPage> selectCoAll(){
		Connection conn=getConnection();
		List<CountryPage> result=dao.selectCoAll(conn);
		close(conn);
		return result;
	}
	
	//내용들
	public CountryPage coArea(String name) {
		Connection conn=getConnection();
		CountryPage result=dao.coArea(conn,name);
		close(conn);
		return result;
	}
	
	public CountryPage whVisa(String name) {
		Connection conn=getConnection();
		CountryPage result=dao.whVisa(conn,name);
		close(conn);
		return result;
	}
	
	public CountryPage safe(String name) {
		Connection conn=getConnection();
		CountryPage result=dao.safe(conn,name);
		close(conn);
		return result;
	}
	
	public CountryPage stay(String name) {
		Connection conn=getConnection();
		CountryPage result=dao.stay(conn,name);
		close(conn);
		return result;
	}
	public CountryPage job(String name) {
		Connection conn=getConnection();
		CountryPage result=dao.job(conn,name);
		close(conn);
		return result;
	}
	
	
	

	
	
	
	
	public int insertContent(CountryPage c) {
		Connection conn=getConnection();
		int result=dao.insertContent(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	public CountryPage selectPageName(String name) {
		Connection conn=getConnection();
		CountryPage cc=dao.selectPageName(conn,name);
		close(conn);
		return cc;
	}
	
	public int updateContent(CountryPage c) {
		Connection conn=getConnection();
		int result=dao.updateContent(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
}
