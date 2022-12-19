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

import com.smtw.friends.model.vo.ApplyFriends;
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
	
	public List<Friends> selectFriendsList(Connection conn, int cPage, int numPerpage, String nation){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Friends> result=new ArrayList();
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsNationList"));
			
			pstmt.setString(1, nation);
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

	public int selectFriendsNationCount(Connection conn, String nation) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsNationCount"));
			pstmt.setString(1, nation);
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
	
	public Friends selectFriendsNo(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Friends m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFriendsNo"));
			pstmt.setInt(1, no);
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
	
	public int insertFriends(Connection conn, Friends f) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertFriends"));
			pstmt.setString(1, f.getNName());
			pstmt.setString(2, f.getFriendsTitle());
			pstmt.setString(3, f.getFriendsContents());
			pstmt.setString(4, f.getMemberId());
			pstmt.setString(5, f.getMbti());
			pstmt.setString(6, f.getType());
			pstmt.setString(7, String.valueOf(f.getExpYn()));
			pstmt.setString(8, f.getPurpose());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateFriends(Connection conn, Friends f) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateFriends"));
			pstmt.setString(1, f.getNName());
			pstmt.setString(2, f.getFriendsTitle());
			pstmt.setString(3, f.getFriendsContents());
			pstmt.setString(4, f.getMemberId());
			pstmt.setString(5, f.getMbti());
			pstmt.setString(6, f.getType());
			pstmt.setString(7, String.valueOf(f.getExpYn()));
			pstmt.setString(8, f.getPurpose());
			pstmt.setString(9, f.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertFriendsApply(Connection conn, ApplyFriends af) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertFriendsApply"));
			pstmt.setString(1, af.getPropose());
			pstmt.setString(2, af.getMemberFrom());
			pstmt.setInt(3, af.getFriendsNo());
			pstmt.setString(4, af.getNName());
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
				.friendsContents(rs.getString("friends_Contents"))
				.enrollDate(rs.getDate("enroll_Date"))
				.memberId(rs.getString("member_Id"))
				.mbti(rs.getString("mbti"))
				.type(rs.getString("type"))
				.expYn(rs.getString("exp_yn").charAt(0))
				.purpose(rs.getString("purpose"))
				.build();
	}
	
}
