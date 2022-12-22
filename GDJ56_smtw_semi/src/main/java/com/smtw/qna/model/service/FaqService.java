package com.smtw.qna.model.service;

import java.sql.Connection;
import java.util.List;

import com.smtw.qna.model.dao.FaqDao;
import com.smtw.qna.model.vo.Faq;

import static com.smtw.common.JDBCTemplate.*;

public class FaqService {
	private FaqDao dao=new FaqDao();
	
	public List<Faq> selectFaqList(){
		Connection conn=getConnection();
		List<Faq> list=dao.selectFaqList(conn);
		close(conn);
		return list;
	}
	
	public int updateFaq(String faqQue,String faqAns,String faqNo){
		Connection conn=getConnection();
		int result=dao.updateFaq(conn,faqQue,faqAns,faqNo);
		close(conn);
		return result;
	}
	
}
