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
}
