package com.smtw.mypage.model.dao;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.MemberInfo;

public class MypageDao {
	
	private Properties sql=new Properties();

	public MypageDao() {
		String path=MypageDao.class.getResource("/sql/mypage/mypage.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	
	private Applyfriends getApplyfriendsList(ResultSet rs) throws SQLException{
		return Applyfriends.builder()
				.propose(rs.getString("PROPOSE"))
				.memberId(rs.getString("MEMBER_FROM"))
				.fEnroll(rs.getDate("F_ENROLL"))
				.build();
	}
	
	private MemberInfo getInfoApplyfriendsList(ResultSet rs) throws SQLException{
		return MemberInfo.builder()
				.memberName(rs.getString("MEMBER_NAME"))
				.gender(rs.getString("GENDER").charAt(0))
				.age(rs.getString("AGE"))
				.build();
	}
	
	
	
	
	public List<Applyfriends> applyfriendsList(Connection conn, String userId){
		
		List<Applyfriends> af=new ArrayList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("applyfriendsList"));
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
					af.add(getApplyfriendsList(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return af;
	}
	
	public List<MemberInfo> InfoapplyfriendsList(Connection conn, String userId){
		List<MemberInfo> m=new ArrayList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("infoapplyfriendsList"));
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
					m.add(getInfoApplyfriendsList(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
		
			}return m;
		}
	
	public List<MemberInfo> FriendsList(Connection conn,String userId){
		List<MemberInfo> m=new ArrayList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("friendsList"));
			pstmt.setString(1,userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
					m.add(getInfoApplyfriendsList(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				
			}return m;
		
	}
	
	public int acceptFriends(Connection conn, String userId, String memberFrom) {
	
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(sql.getProperty("acceptFriends"));
				pstmt.setString(1,userId);
				pstmt.setString(2,memberFrom);
				result=pstmt.executeUpdate();
			
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			
			}return result;
	}
	
	public int rejectFriends(Connection conn, String userId, String memberFrom) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("rejectFriends"));
			pstmt.setString(1,userId);
			pstmt.setString(2,memberFrom);
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			System.out.println(result);
		}return result;
	}
		
	
		
}


		
		
		
	
	

