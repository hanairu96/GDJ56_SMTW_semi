package com.smtw.friends.model.dao;

import static com.smtw.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smtw.friends.model.vo.Friends;

public class FriendsDao {
	
	private Properties sql=new Properties();
	
	public FriendsDao() {
		String path=FriendsDao.class.getResource("/sql/friends/friends_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Friends> selectFriendsList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Friends> result=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsList"));

			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getFriends(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int selectFriendsCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) count=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return count;
	}
	
	public List<Friends> selectFriendsList(Connection conn, String type, String keyword,
			int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Friends> result=new ArrayList();
		String query=sql.getProperty("selectFriendsListKeyword");
		//SELECT * FROM Friends WHERE $COL LIKE ?
		query=query.replace("$COL", type);
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getFriends(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	
	}
	
	public int selectFriendsCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String query=sql.getProperty("selectFriendsCountKeyword");
		query=query.replace("$COL", type);
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public Friends selectFriendsId(Connection conn, String id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Friends m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsId"));
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getFriends(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int deleteFriends(Connection conn, int no) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteFriends"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public static Friends getFriends(ResultSet rs) throws SQLException {
		return Friends.builder()
				.friendsNo(rs.getInt("Friends_No"))
				.nName(rs.getString("n_Name"))
				.friendsTitle(rs.getString("friends_Title"))
				//.friendsContents(rs.getString("friends_Contents"))
				.enrollDate(rs.getDate("enroll_Date"))
				.memberId(rs.getString("member_Id"))
				.mbti(rs.getString("mbti"))
				.type(rs.getString("type"))
				.introduce(rs.getString("introduce"))
				.filed(rs.getString("filed").charAt(0))
				.purpose(rs.getString("purpose"))
				.build();
	}
	
	//

}
