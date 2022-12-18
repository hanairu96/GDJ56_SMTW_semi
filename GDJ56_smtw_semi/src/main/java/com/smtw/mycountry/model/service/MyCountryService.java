package com.smtw.mycountry.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.mycountry.model.dao.MyCountryDao;
import com.smtw.mycountry.model.vo.MyCountry;

public class MyCountryService {
	
	MyCountryDao dao=new MyCountryDao();
	
	public List<MyCountry> searchMyCountry(String nLanguage, String nPlace, String nSeason, String nTend) {
		Connection conn=getConnection();
		List<MyCountry> myCountry=dao.searchMyCountry(conn,nLanguage,nPlace,nSeason,nTend);
		
		close(conn);
		return myCountry;	
	}
}
