package com.smtw.country.model.service;

import static com.smtw.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import com.smtw.country.model.dao.CountrytDao;
import com.smtw.country.model.vo.Country;

public class CountryService {
	private CountrytDao dao=new CountrytDao();
	
	public List<Country> searchCountry() {
		Connection conn=getConnection();
		List<Country> result=dao.searchCountryList(conn);
		close(conn);
		return result;
	}
	
	
	public int insertCountry(Country c) {
		Connection conn=getConnection();
		int result=dao.insertCountry(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
}
