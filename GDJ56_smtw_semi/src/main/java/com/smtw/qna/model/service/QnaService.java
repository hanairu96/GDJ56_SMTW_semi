package com.smtw.qna.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.getConnection;
import static com.smtw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smtw.notice.model.vo.Notice;
import com.smtw.qna.model.dao.QnaDao;
import com.smtw.qna.model.vo.Qna;

public class QnaService {
	
	private QnaDao dao=new QnaDao();

	public List<Qna> selectQnaList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Qna> list=dao.selectQnaList(conn, cPage, numPerpage);
		close(conn);
		return list;
	}

	public int selectQnaCount() {
		Connection conn=getConnection();
		int result=dao.selectQnaCount(conn);
		close(conn);
		return result;
	}
	//Q&A 글 작성-> DB에 저장	
	public int insertQna(String writer,String title,String contents) {
		Connection conn=getConnection();
		int result=dao.insertQna(conn,writer,title,contents);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Qna> searchQna(String option,String qna,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Qna> list=dao.searchQna(conn,option,qna,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int selectQnaCount(String option,String qna) {
		Connection conn=getConnection();
		int result=dao.selectQnaCount(conn,option,qna);
		close(conn);
		return result;
	}
	
}
