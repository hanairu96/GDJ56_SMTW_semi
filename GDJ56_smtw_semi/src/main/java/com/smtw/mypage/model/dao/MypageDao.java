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
import com.smtw.mypage.model.vo.Note;

public class MypageDao {
	
	private Properties sql=new Properties();

	public MypageDao() {
		String path=MypageDao.class.getResource("/sql/mypage/mypage_sql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int updateMember(Connection conn, Member updateMember) {
		
		int result = 0;
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			
			pstmt.setString(1,updateMember.getMemberName());
			pstmt.setString(2,updateMember.getEmail());
			pstmt.setString(3,updateMember.getPhone());
			pstmt.setString(4,updateMember.getBirth());
			pstmt.setString(5,String.valueOf(updateMember.getGender()));
			pstmt.setString(6,updateMember.getAddress());
			pstmt.setString(7,updateMember.getMyImg());
			pstmt.setString(8,updateMember.getMemberId());
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		
			close(pstmt);
		
		}return result;
	}
	
	public int deleteMember(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt=null;
		
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteMember"));
			
			pstmt.setString(1,userId);
			
			result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
		
			close(pstmt);
		
		}return result;
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
				.memberId(rs.getString("MEMBER_FROM"))
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
	
	private Note getNoteList(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		return Note.builder()
				.ntNo(rs.getInt("NT_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.content(rs.getString("NOTE_CONTENTS"))
				.date(rs.getDate("ENROLL_DATE"))
				.sender(rs.getString("SENDER"))
				.senderName(rs.getString("SENDER_NAME"))
				.build();
	}
	
	public List<Note> noteList(Connection conn, String id){
		
		List<Note> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("noteList"));
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNoteList(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Note> noteSendList(Connection conn, String id){
		
		List<Note> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("noteSendList"));
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNoteList(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public Note noteList(Connection conn, int noteNo){
		
		Note n = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("noteList2"));
			pstmt.setInt(1,noteNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=getNoteList(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
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
				System.out.println(m);
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
	
	
	public Member memberInfo(Connection conn, String userId){
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("memberInfo"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	public Member pwdCk(Connection conn, String userId, String pwd) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("pwdCk"));
			pstmt.setString(1, userId);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
		
	}
	
	
	private Member getMember(ResultSet rs) throws SQLException {
		return Member.builder()
				.memberId(rs.getString("MEMBER_ID"))
				.memberPwd(rs.getString("MEMBER_PWD"))
				.memberName(rs.getString("MEMBER_NAME"))
				.email(rs.getString("EMAIL"))
				.phone(rs.getString("PHONE"))
				.birth(rs.getString("BIRTH"))
				.gender(rs.getString("GENDER").charAt(0))
				.address(rs.getString("ADDRESS"))
				.myImg(rs.getString("MYIMG"))
				.build();
	}
	
	public int updatePassword(Connection conn, String userId, String newPass) {
		
		int result = 0;
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1,newPass);
			pstmt.setString(2,userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public String getName(Connection conn, String memberId) {
		Member m = null;
		String name = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("getName"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
				name=m.getMemberName();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return name;
		
	}
	
	public int insertNote(Connection conn, String memberId, String receiver, String context) {
		int result = 0;
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNote"));
			pstmt.setString(1,receiver);
			pstmt.setString(2,context);
			pstmt.setString(3,memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	

	

	
		
}


		
		
		
	
	

