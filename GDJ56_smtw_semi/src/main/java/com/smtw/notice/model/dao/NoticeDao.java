package com.smtw.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smtw.notice.model.vo.Notice;
import static com.smtw.common.JDBCTemplate.*;

public class NoticeDao {
	Properties sql=new Properties();
	
	public NoticeDao() {
		String path=NoticeDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//메인화면에 전체 리스트 출력화면
	public List<Notice> selectNoticeList(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getNotice(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	//현재 가지고있는 공지사항 개수
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	//공지사항 작성
	public int insertNotice(Connection conn,String writer,String title,String contents) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, contents);
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//제목,내용 별 검색
	public List<Notice> searchNotice(Connection conn, String option,String notice,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		
		String query=sql.getProperty("searchNotice");
		query=query.replace("$COL", option);
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,"%"+notice+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(getNotice(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectNoticeCount(Connection conn,String option,String notice) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String query=sql.getProperty("selectNoticeCountKeyword");
		query=query.replace("$COL", option);
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1,"%"+notice+"%");
			rs=pstmt.executeQuery();

			if(rs.next()) result=rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	
	private Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder()
				.noticeNo(rs.getInt("notice_no"))
				.memberId(rs.getString("member_id"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContents(rs.getString("notice_contents"))
				.noticeEnrollDate(rs.getDate("enroll_date"))
				.fileName(rs.getString("file_name"))
				.build();
	}
	
}
