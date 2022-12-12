package com.smtw.diary.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.rollback;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.smtw.diary.model.dao.DiaryDao;
import com.smtw.diary.model.vo.Diary;

public class DiaryService {

	DiaryDao dao=new DiaryDao();
	
	public Diary searchDiary(String memberId) {
		Connection conn=getConnection();
		Diary diary=dao.searchDiary(conn,memberId);
		
		close(conn);
		return diary;	
	}
	
	public int insertDiary(String memberId, String leavingdate, String alarmYN) {
		Connection conn=getConnection();
		int result=0;
		result=dao.insertDiary(conn,memberId,leavingdate,alarmYN);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
}
