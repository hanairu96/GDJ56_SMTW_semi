package com.smtw.notice.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.getConnection;
import static com.smtw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smtw.notice.model.dao.NoticeDao;
import com.smtw.notice.model.vo.Notice;

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
	
	public List<Notice> searchNotice(String option,String notice,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Notice> list=dao.searchNotice(conn,option,notice,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public int selectNoticeCount(String option,String notice) {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn,option,notice);
		close(conn);
		return result;
	}
	
	public Notice selectNoticeNo(int noticeNo){
		Connection conn=getConnection();
		Notice n=dao.selectNoticeNo(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public int updateNotice(String title,String contents,int noticeNo) {
		Connection conn=getConnection();
		int result=dao.updateNotice(conn,title,contents,noticeNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Notice> selectPreNextNoticeNo(int noticeNo){
		Connection conn=getConnection();
		List<Notice> list=dao.selectPreNextNoticeNo(conn,noticeNo);
		close(conn);
		return list;
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn,noticeNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

}
