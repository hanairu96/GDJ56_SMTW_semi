package com.smtw.mypage.model.service;

import java.sql.Connection;
import java.util.List;
import static com.smtw.common.JDBCTemplate.*;

import com.smtw.country.model.vo.Country;
import com.smtw.friends.model.vo.Friends;
import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.dao.MypageDao;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.FriendsWroteList;
import com.smtw.mypage.model.vo.MemberInfo;
import com.smtw.mypage.model.vo.MemberInfo2;
import com.smtw.mypage.model.vo.Note;
import com.smtw.mypage.model.vo.ReviewList;
import com.smtw.mypage.model.vo.WroteList;
import com.smtw.qna.model.vo.Qna;
import com.smtw.review.model.vo.Review;
import com.smtw.mypage.model.vo.qnaList;

public class MypageService {
	
	public List<Applyfriends> applyfriendsList(String userId){
		
		Connection conn = getConnection();
		List<Applyfriends> af=new MypageDao().applyfriendsList(conn,userId);
		close(conn);
		return af;
	}
	
	
	public List<Applyfriends> sendfriends(String userId){
		
		Connection conn = getConnection();
		List<Applyfriends> af=new MypageDao().sendfriends(conn,userId);
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
	
	public List<MemberInfo>  acceptedFinfo(String userId){
		Connection conn = getConnection();
		List<MemberInfo> m=new MypageDao().acceptedFinfo(conn,userId);
		close(conn);
		return m;
	}
	
	public List<MemberInfo2>  acceptedFinfo2(String userId){
		Connection conn = getConnection();
		List<MemberInfo2> m=new MypageDao().acceptedFinfo2(conn,userId);
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
	
	public List<Note> noteList(String userId,int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Note> list = new MypageDao().noteList2(conn, userId, cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public List<Note> noteSendList(String id,int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Note> list = new MypageDao().noteSendList(conn, id, cPage, numPerpage);
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
	
	public List<Member>  acceptedFlist(String userId){
		Connection conn = getConnection();
		List<Member> m=new MypageDao().acceptedFlist(conn,userId);
		close(conn);
		return m;
	}
	
	public List<ReviewList> reviewList(String userId,int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<ReviewList> list=new MypageDao().reviewList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public List<ReviewList> fworiteList(String userId,int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<ReviewList> list=new MypageDao().fworiteList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	public List<ReviewList> qnaList(String userId,int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<ReviewList> list=new MypageDao().qnaList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int getrCpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getrCpage(conn, userId);
		close(conn);
		return result;
	}
	
	public int getrnumPerpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getrnumPerpage(conn, userId);
		close(conn);
		return result;
	}
	
	
	public int getfCpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getfCpage(conn, userId);
		close(conn);
		return result;
	}
	
	public int getfnumPerpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getfnumPerpage(conn, userId);
		close(conn);
		return result;
	}
	
	
	public int getqCpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getqCpage(conn, userId);
		close(conn);
		return result;
	}
	
	public int getqnumPerpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getqnumPerpage(conn, userId);
		close(conn);
		return result;
	}
	
	
	
	public List<WroteList> selectWroteList(int cPage, int numPerpage, String userId) {
		Connection conn=getConnection();
		List<WroteList> list=new MypageDao().selectWroteList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectWroteCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectWroteCount(conn, userId);
		close(conn);
		return result;
	}
	
	public int selectNoteCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectNoteCount(conn, userId);
		close(conn);
		return result;
	}
	
	public int selectSendCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectSendCount(conn, userId);
		close(conn);
		return result;
	}
	
	public int getCpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getCpage(conn, userId);
		close(conn);
		return result;
	}
	
	public int getNumPerpage(String userId) {
		Connection conn = getConnection();
		int result=new MypageDao().getNumPerpage(conn, userId);
		close(conn);
		return result;
	}
	
	public List<Qna>getQnaList(String userId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Qna> list=new MypageDao().getQnaList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectQnaListCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectQnaListCount(conn, userId);
		close(conn);
		return result;
	}
	
	public List<Review>getReviewList(String userId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Review> list=new MypageDao().getReviewList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectReviewListCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectrReviewListCount(conn, userId);
		close(conn);
		return result;
	}
	
	public List<Friends>getFriendsList(String userId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Friends> list=new MypageDao().getFriendsList(conn, userId,cPage, numPerpage);
		close(conn);
		return list;
	}
	
	public int selectFriendsListCount(String userId) {
		Connection conn=getConnection();
		int result=new MypageDao().selectFriendsListCount(conn, userId);
		close(conn);
		return result;
	}
	
	public List<Country> getNation(String userId){
		Connection conn = getConnection();
		List<Country> n=new MypageDao().getNation(conn,userId);
		close(conn);
		return n;
	}
	
	public String getImg(String userId) {
		Connection conn = getConnection();
		String result=new MypageDao().getImg(conn, userId);
		close(conn);
		return result;
	}
	
	public int deleteNote(String checkNum) {
		Connection conn = getConnection();
		int result=new MypageDao().deleteNote(conn, checkNum);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	

}
