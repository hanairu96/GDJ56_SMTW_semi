package com.smtw.admin.model.service;

import static com.smtw.common.JDBCTemplate.close;
import static com.smtw.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smtw.admin.model.dao.MemberDao;
import com.smtw.member.model.vo.Member;

public class MemberService {
	
	private MemberDao dao=new MemberDao();

	public List<Member> selectMemberList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberList(conn, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public List<Member> selectMemberList(String type, String keyword, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Member> list=dao.selectMemberList(conn, type, keyword, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectMemberCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn, type, keyword);
		close(conn);
		return result;
	}
	
	public Member selectMemberId(String memberId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberId(conn, memberId);
		close(conn);
		return m;
	}
	
	public int deleteMember(String id) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn, id);
		close(conn);
		return result;
	}

}
