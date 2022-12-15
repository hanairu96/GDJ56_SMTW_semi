package com.smtw.member.model.service;

import static com.smtw.common.JDBCTemplate.*;

import java.sql.Connection;

import com.smtw.member.model.dao.MemberDao;
import com.smtw.member.model.vo.Member;

public class MemberService {
	private MemberDao dao=new MemberDao();
	
	//회원가입
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//아이디,비번으로 회원검색(로그인)
	public Member searchIdPwd(String logInId, String logInPwd) {
		Connection conn=getConnection();
		Member m=dao.searchIdPwd(conn,logInId,logInPwd);
		close(conn);
		return m;
	}
	//아이디중복확인
	public Member idDuplicateCheck(String inputId) {
		Connection conn=getConnection();
		Member m=dao.idDuplicateCheck(conn,inputId);
		close(conn);
		return m;
	}
	//이름, 이메일로 아이디 찾기
	public Member searchId(String searchName,String searchEmail) {
		Connection conn=getConnection();
		Member m=dao.searchId(conn,searchName,searchEmail);
		close(conn);
		return m;
	}
	
	//이메일중복확인
	public Member emailDuplicateCheck(String inputEmail) {
		Connection conn=getConnection();
		Member m=dao.emailDuplicateCheck(conn,inputEmail);
		close(conn);
		return m;
	}
}
