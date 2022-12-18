package com.smtw.member.model.dao;

import static com.smtw.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.smtw.member.model.vo.Member;

public class MemberDao {

		private Properties sql=new Properties();
		
		public MemberDao() {
			try {
				String path=MemberDao.class
						.getResource("/sql/member/member_sql.properties")
						.getPath();
				sql.load(new FileReader(path));
			}catch(IOException e) {
				e.printStackTrace();
			}
	}
		
	//회원가입
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getBirth());
			pstmt.setString(7, String.valueOf(m.getGender()));
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, String.valueOf(m.getEmailAgree()));
			
			result=pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//아이디,비밀번호로 회원검색(로그인)
	public Member searchIdPwd(Connection conn, String logInId, String logInPwd) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchIdPwd"));
			pstmt.setString(1, logInId);
			pstmt.setString(2, logInPwd);
			rs=pstmt.executeQuery();
			
			if(rs.next()) m=getMember(rs);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	//아이디중복확인
	public Member idDuplicateCheck(Connection conn,String inputId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("idDuplicateCheck"));
			pstmt.setString(1, inputId);
			rs=pstmt.executeQuery();
			
			if(rs.next()) m=getMember(rs);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	//이름, 이메일로 아이디 찾기
	public Member searchId(Connection conn,String searchName,String searchEmail) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchId"));
			pstmt.setString(1, searchName);
			pstmt.setString(2, searchEmail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) m=getMember(rs);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	//이메일 중복확인
	public Member emailDuplicateCheck(Connection conn,String inputEmail) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("emailDuplicateCheck"));
			pstmt.setString(1, inputEmail);
			rs=pstmt.executeQuery();
			
			if(rs.next()) m=getMember(rs);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
		
	
	private Member getMember(ResultSet rs) throws SQLException {
		return Member.builder()
				.memberId(rs.getString("member_id"))
				.memberPwd(rs.getString("member_pwd"))
				.memberName(rs.getString("member_name"))
				.email(rs.getString("email"))
				.phone(rs.getString("phone"))
				.birth(rs.getString("birth"))
				.gender(rs.getString("gender").charAt(0))
				.address(rs.getString("address"))
				.myImg(rs.getString("myimg"))
				.emailAgree(rs.getString("email_agree").charAt(0))
				.build();
	}
}
