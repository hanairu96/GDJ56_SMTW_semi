package com.smtw.mapage.model.service;

import java.sql.Connection;
import java.util.List;
import static com.smtw.common.JDBCTemplate.*;

import com.smtw.mypage.model.dao.MypageDao;
import com.smtw.mypage.model.vo.Applyfriends;

public class MypageService {
	
	public List<Applyfriends> applyfriendsList(String userId){
		
		Connection conn = getConnection();
		List<Applyfriends> af=new MypageDao().applyfriendsList(conn,userId);
		close(conn);
		return af;
	}

}
