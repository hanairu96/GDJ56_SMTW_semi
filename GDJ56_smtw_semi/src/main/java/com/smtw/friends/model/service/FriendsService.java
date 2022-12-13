package com.smtw.friends.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.friends.model.dao.FriendsDao;
import com.smtw.friends.model.vo.Friends;

public class FriendsService {
	
	private FriendsDao dao=new FriendsDao();

	public List<Friends> selectFriendsList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Friends> list=dao.selectFriendsList(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectFriendsCount() {
		Connection conn=getConnection();
		int result=dao.selectFriendsCount(conn);
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
	
	public Friends selectFriendsId(String id) {
		Connection conn=getConnection();
		Friends m=dao.selectFriendsId(conn, id);
		close(conn);
		return m;
	}
	
	public int deleteFriends(int no) {
		Connection conn=getConnection();
		int result=dao.deleteFriends(conn, no);
		close(conn);
		return result;
	}
	
	//

}
