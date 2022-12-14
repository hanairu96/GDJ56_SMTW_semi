package com.smtw.notice.model.service;

import java.sql.Connection;
import java.util.List;

import com.smtw.notice.model.dao.NoticeDao;
import com.smtw.notice.model.vo.Notice;
import static com.smtw.common.JDBCTemplate.*;

public class NoticeService {
	NoticeDao dao=new NoticeDao();
	
	public List<Notice> selectNoticeList(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Notice> list=dao.selectNoticeList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public int insertNotice(String writer,String title,String contents) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,writer,title,contents);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Notice> searchNotice(String option,String notice){
		Connection conn=getConnection();
		List<Notice> list=dao.searchNotice(conn,option,notice);
		close(conn);
		return list;
	}
}
