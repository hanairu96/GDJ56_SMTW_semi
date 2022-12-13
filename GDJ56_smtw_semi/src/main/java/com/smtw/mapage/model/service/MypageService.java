package com.smtw.mapage.model.service;

import java.sql.Connection;
import java.util.List;
import static com.smtw.common.JDBCTemplate.*;

import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.dao.MypageDao;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.MemberInfo;

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
	
}
