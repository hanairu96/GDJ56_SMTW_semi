package com.smtw.review.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.commit;
import static com.smtw.common.JDBCTemplate.getConnection;
import static com.smtw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smtw.qna.model.vo.QnaComments;
import com.smtw.review.model.dao.ReviewCommentsDao;
import com.smtw.review.model.vo.ReviewComments;

public class ReviewCommentsService {
	
	
	private  ReviewCommentsDao  dao =new  ReviewCommentsDao();
	
	
	public List<ReviewComments> selectReviewComments(int ReviewNo ){
		Connection conn=getConnection();
		List<ReviewComments> list=dao.selectReviewComments(conn,ReviewNo);
		close(conn);
		return list;
				
		
		
	}
	
	
	 public int  insertReviewComments(int qcLevel,String  qnaQcRef,String comment,int qnaNo, String writer) {
		 Connection conn=getConnection();
			int result=dao.insertReviewComments(conn,qcLevel,qnaQcRef,comment,qnaNo,writer);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		 
		 
		 
		 
	 }
	
	 
	 public int deleteReviewComment(int qnaNo, int qcNo) {
			Connection conn=getConnection();
			int result=dao.deleteReviewComment(conn,qnaNo,qcNo);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
	 
	 
	 
	 
	 
	 
	
	
	
}
