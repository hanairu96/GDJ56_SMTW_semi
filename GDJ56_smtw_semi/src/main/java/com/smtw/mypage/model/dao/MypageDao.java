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

import com.smtw.mypage.model.vo.Applyfriends;

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
	
	public List<Applyfriends> applyfriendsList(Connection conn, String userId){
		
		List<Applyfriends> af=new ArrayList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("applyfriendsList"));
			pstmt.setString(1,"USER01");
			rs=pstmt.executeQuery();
			while(rs.next()) {
					af.add(getApplyfriendsList(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				System.out.println(af);
			}return af;
		}
		
		
		
	
	
}
