package com.smtw.mypage.model.service;

import java.sql.Connection;
import java.util.List;
import static com.smtw.common.JDBCTemplate.*;

import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.dao.MypageDao;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.MemberInfo;
import com.smtw.mypage.model.vo.Note;

public class MypageService {
	
	public List<Applyfriends> applyfriendsList(String userId){
		
		Connection conn = getConnection();
		List<Applyfriends> af=new MypageDao().applyfriendsList(conn,userId);
		close(conn);
		return af;
	}
	
	public List<MemberInfo>  InfoapplyfriendsList(String userId){
		Connection conn = getConnection();
		List<MemberInfo> m=new MypageDao().InfoapplyfriendsList(conn,userId);
		close(conn);
		return m;
	}

	public List<MemberInfo>  FriendsList(String userId){
		Connection conn = getConnection();
		List<MemberInfo> m=new MypageDao().FriendsList(conn,userId);
		close(conn);
		return m;
	}
	
	public int acceptFriends(String userId, String memberFrom) {
		
		Connection conn=getConnection();
		int result=new MypageDao().acceptFriends(conn,userId,memberFrom);
		close(conn);
		
		
		return result;
	}
	
	public int rejectFriends(String userId, String memberFrom) {
		
		Connection conn=getConnection();
		int result=new MypageDao().rejectFriends(conn,userId,memberFrom);
		close(conn);
		
		
		return result;
	}
	
	public Member memberInfo(String userId){
		Connection conn = getConnection();
		Member m=new MypageDao().memberInfo(conn,userId);
		close(conn);
		return m;
	}
	
	public Member pwdCk(String userId, String pwd) {
		Connection conn = getConnection();
		Member m = new MypageDao().pwdCk(conn,userId,pwd);
		close(conn);
		return m;
	}
	
	public int updateMember(Member updateMember) {
		Connection conn = getConnection();
		int result=new MypageDao().updateMember(conn, updateMember);
		close(conn);
		return result;
	}
	
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().deleteMember(conn, userId);
		close(conn);
		return result;
	}
	
	public int updatePassword(String userId, String newPass) {
		Connection conn = getConnection();
		int result=new MypageDao().updatePassword(conn, userId,newPass);
		close(conn);
		return result;
	}
	
	public List<Note> noteList(String id){
		Connection conn = getConnection();
		List<Note> list = new MypageDao().noteList(conn, id);
		close(conn);
		return list;
	}
	
	public List<Note> noteSendList(String id){
		Connection conn = getConnection();
		List<Note> list = new MypageDao().noteSendList(conn, id);
		close(conn);
		return list;
	}
	
	public Note noteList(int noteNo){
		Connection conn = getConnection();
		Note n = new MypageDao().noteList(conn, noteNo);
		close(conn);
		return n;
	}
	
	public String getName(String memberId) {
		Connection conn = getConnection();
		String name = new MypageDao().getName(conn, memberId);
		close(conn);
		return name;
		
	}
	
	public int insertNote(String memberId, String receiver, String context) {
		Connection conn = getConnection();
		int result=new MypageDao().insertNote(conn, memberId, receiver, context);
		close(conn);
		return result;
	}
	
	
	

}
