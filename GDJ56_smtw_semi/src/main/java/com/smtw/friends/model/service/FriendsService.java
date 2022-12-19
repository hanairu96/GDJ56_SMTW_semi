package com.smtw.friends.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.friends.model.dao.FriendsDao;
import com.smtw.friends.model.vo.ApplyFriends;
import com.smtw.friends.model.vo.Friends;

public class FriendsService {
	
	private FriendsDao dao=new FriendsDao();

	public List<Friends> selectFriendsList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Friends> list=dao.selectFriendsList(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public List<Friends> selectFriendsList(int cPage, int numPerpage, String nation) {
		Connection conn=getConnection();
		List<Friends> list=dao.selectFriendsList(conn, cPage, numPerpage, nation);
		close(conn);
		return list;
	}
	
	public int selectFriendsCount() {
		Connection conn=getConnection();
		int result=dao.selectFriendsCount(conn);
		close(conn);
		return result;
	}
	
	public int selectFriendsNationCount(String nation) {
		Connection conn=getConnection();
		int result=dao.selectFriendsNationCount(conn, nation);
		close(conn);
		return result;
	}
	
	public List<Friends> selectFriendsList(String type, String keyword, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Friends> list=dao.selectFriendsList(conn, type, keyword, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectFriendsCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.selectFriendsCount(conn, type, keyword);
		close(conn);
		return result;
	}
	
	public Friends selectFriendsNo(int no) {
		Connection conn=getConnection();
		Friends m=dao.selectFriendsNo(conn, no);
		close(conn);
		return m;
	}
	
	public int deleteFriends(String id) {
		Connection conn=getConnection();
		int result=dao.deleteFriends(conn, id);
		close(conn);
		return result;
	}
	
	public int insertFriends(Friends f) {
		Connection conn=getConnection();
		int result=dao.insertFriends(conn, f);
		close(conn);
		return result;
	}
	
	public int updateFriends(Friends f) {
		Connection conn=getConnection();
		int result=dao.updateFriends(conn, f);
		close(conn);
		return result;
	}
	
	public int insertFriendsApply(ApplyFriends af) {
		Connection conn=getConnection();
		int result=dao.insertFriendsApply(conn, af);
		close(conn);
		return result;
	}
	
}
