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

import com.smtw.country.model.vo.Country;
import com.smtw.friends.model.vo.Friends;
import com.smtw.member.model.vo.Member;
import com.smtw.mypage.model.vo.Applyfriends;
import com.smtw.mypage.model.vo.FriendsWroteList;
import com.smtw.mypage.model.vo.MemberInfo;
import com.smtw.mypage.model.vo.MemberInfo2;
import com.smtw.mypage.model.vo.Note;
import com.smtw.mypage.model.vo.ReviewList;
import com.smtw.mypage.model.vo.WroteList;
import com.smtw.mypage.model.vo.qnaList;
import com.smtw.qna.model.vo.Qna;
import com.smtw.review.model.vo.Review;

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
   
   private MemberInfo2 getInfoApplyfriendsList2(ResultSet rs) throws SQLException{
      return MemberInfo2.builder()
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
   
   public List<Note> noteList2(Connection conn, String userId, int cPage, int numPerpage){
      
      List<Note> list = new ArrayList();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      System.out.println(userId+":"+cPage+":"+numPerpage);
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("noteList"));
         pstmt.setString(1, userId);
         pstmt.setInt(2, (cPage-1)*numPerpage+1);
         pstmt.setInt(3, cPage*numPerpage);
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
   
   public List<Note> noteSendList(Connection conn, String id ,int cPage, int numPerpage){
      
      List<Note> list = new ArrayList();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("noteSendList"));
         pstmt.setString(1, id);
         pstmt.setInt(2, (cPage-1)*numPerpage+1);
         pstmt.setInt(3, cPage*numPerpage);
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
         }return m;
      
   }
   
   public List<MemberInfo> acceptedFinfo(Connection conn,String userId){
      List<MemberInfo> m=new ArrayList();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         pstmt=conn.prepareStatement(sql.getProperty("acceptedFinfo"));
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
   
   public List<MemberInfo2> acceptedFinfo2(Connection conn,String userId){
      List<MemberInfo2> m=new ArrayList();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         pstmt=conn.prepareStatement(sql.getProperty("acceptedFinfo"));
         pstmt.setString(1,userId);
         rs=pstmt.executeQuery();
         while(rs.next()) {
               m.add(getInfoApplyfriendsList2(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return m;
      
   }
   
   public List<Member> acceptedFlist(Connection conn,String userId){
      List<Member> m=new ArrayList();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      try {
         pstmt=conn.prepareStatement(sql.getProperty("acceptedFlist"));
         pstmt.setString(1,userId);
         rs=pstmt.executeQuery();
         while(rs.next()) {
               m.add(getMember(rs));
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
   
   public List<ReviewList> reviewList(Connection conn, String userId, int cPage, int numPerpage){
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List<ReviewList> result=new ArrayList();
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("wroteReviewList"));
         
         pstmt.setString(1, userId);
         pstmt.setInt(2, cPage);
         pstmt.setInt(3, numPerpage);
         
         rs=pstmt.executeQuery();
         while(rs.next()) {
            result.add(getWroteReview(rs));
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }System.out.println("내가 쓴 리뷰"+result);
      return result;
   }
   
   
   public String getImg(Connection conn, String userId){
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      String result = "";
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("getmyImg"));
         pstmt.setString(1, userId);
         rs=pstmt.executeQuery();
         if(rs.next()) {
        	 result=rs.getString("MYIMG");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }
   
   
   
   private ReviewList getWroteReview(ResultSet rs) throws SQLException {
      return ReviewList.builder()
            .type("reivew")
            .reviewNo(rs.getInt("review_no"))
            .title(rs.getString("review_title"))
            .date(rs.getDate("enroll_date"))
            .build();
   }
   
   public List<ReviewList> fworiteList(Connection conn, String userId, int cPage, int numPerpage){
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List<ReviewList> result=new ArrayList();
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("fworiteList"));
         
         pstmt.setString(1, userId);
         pstmt.setInt(2, cPage);
         pstmt.setInt(3, numPerpage);
         
         rs=pstmt.executeQuery();
         while(rs.next()) {
            result.add(getFriendsWroteList(rs));
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }
   
   private ReviewList getFriendsWroteList(ResultSet rs) throws SQLException {
      return ReviewList.builder()
            .type("friends")
            .reviewNo(rs.getInt("friends_no"))
            .title(rs.getString("friends_title"))
            .date(rs.getDate("enroll_date"))
            .build();
   }
   
   public List<ReviewList> qnaList(Connection conn, String userId, int cPage, int numPerpage){
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List<ReviewList> result=new ArrayList();
      
      try {
         pstmt=conn.prepareStatement(sql.getProperty("qnaList"));
         
         pstmt.setString(1, userId);
         pstmt.setInt(2, cPage);
         pstmt.setInt(3, numPerpage);
         
         rs=pstmt.executeQuery();
         while(rs.next()) {
            result.add(getqnaList(rs));
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }
      return result;
   }
   
   private ReviewList getqnaList(ResultSet rs) throws SQLException {
      return ReviewList.builder()
            .type("qna")
            .reviewNo(rs.getInt("qna_no"))
            .title(rs.getString("review_title"))
            .date(rs.getDate("enroll_date"))
            .build();
   }
   
   

public int getrCpage(Connection conn, String userId) {
   int cPage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("rCpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         cPage=rs.getInt("MIN");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);

   }
   return cPage;
}

public int getrnumPerpage(Connection conn, String userId) {
   int numperpage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("rNumperpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         numperpage=rs.getInt("MAX");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
      
   }
   return numperpage;
}

public int getfCpage(Connection conn, String userId) {
   int cPage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("fCpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         cPage=rs.getInt("MIN");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
   
   }
   return cPage;
}

public int getfnumPerpage(Connection conn, String userId) {
   int numperpage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("fNumperpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         numperpage=rs.getInt("MAX");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
      
   }
   return numperpage;
}

public int getqCpage(Connection conn, String userId) {
   int cPage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("qCpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         cPage=rs.getInt("MIN");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
      System.out.println("cPage"+cPage);
   }
   return cPage;
}

public int getqnumPerpage(Connection conn, String userId) {
   int numperpage=0;
   PreparedStatement pstmt = null;
   ResultSet rs=null;
   try {
      pstmt=conn.prepareStatement(sql.getProperty("qNumperpage"));
      pstmt.setString(1, userId);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         numperpage=rs.getInt("MAX");
      }
   }catch(SQLException e) {
      e.printStackTrace();
   }finally {
      close(rs);
      close(pstmt);
      
   }
   return numperpage;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
      public List<WroteList> selectWroteList(Connection conn, String userId,int cPage, int numPerpage){
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List<WroteList> result=new ArrayList();
         
         try {
            pstmt=conn.prepareStatement(sql.getProperty("wroteList"));
            
            pstmt.setString(1, userId);
            pstmt.setInt(2, (cPage-1)*numPerpage+1);
            pstmt.setInt(3, cPage*numPerpage);
            
            rs=pstmt.executeQuery();
            while(rs.next()) {
               result.add(getWroteList(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return result;
      }
      
      private WroteList getWroteList(ResultSet rs) throws SQLException {
         return WroteList.builder()
               .pkNo(rs.getInt("pk_no"))
               .title(rs.getString("title"))
               .date(rs.getDate("enroll_date"))
               .build();
      }
      
      public int selectWroteCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectWroteCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }
      
      public int getCpage(Connection conn, String userId) {
         int cPage=0;
         PreparedStatement pstmt = null;
         ResultSet rs=null;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("cPage"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) {
               cPage=rs.getInt("MIN");
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return cPage;
      }

      public int getNumPerpage(Connection conn, String userId) {
         int numperpage=0;
         PreparedStatement pstmt = null;
         ResultSet rs=null;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("numPerPage"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) {
               numperpage=rs.getInt("MAX");
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return numperpage;
      }
   

      public int selectNoteCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectNoteCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }
      
      public int selectSendCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectSendCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }
      
      public List<Qna> getQnaList(Connection conn, String userId,int cPage, int numPerpage){
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List<Qna> result=new ArrayList();
         
         try {
            pstmt=conn.prepareStatement(sql.getProperty("getQnaList"));
            
            pstmt.setString(1, userId);
            pstmt.setInt(2, (cPage-1)*numPerpage+1);
            pstmt.setInt(3, cPage*numPerpage);
            
            rs=pstmt.executeQuery();
            while(rs.next()) {
               result.add(getQnaList(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return result;
      }
      
      private Qna getQnaList(ResultSet rs) throws SQLException {
         return Qna.builder()
               .qnaNo(rs.getInt("QNA_NO"))
               .memberId(rs.getString("MEMBER_ID"))
               .reviewTitle(rs.getString("REVIEW_title"))
               .enrollDate(rs.getDate("ENROLL_DATE"))
               .build();
      }

      
      public int selectQnaListCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectQnaListCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }

//리뷰 글 구하기
      public List<Review> getReviewList(Connection conn, String userId,int cPage, int numPerpage){
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List<Review> result=new ArrayList();
         
         try {
            pstmt=conn.prepareStatement(sql.getProperty("getReviewList"));
            
            pstmt.setString(1, userId);
            pstmt.setInt(2, (cPage-1)*numPerpage+1);
            pstmt.setInt(3, cPage*numPerpage);
            
            rs=pstmt.executeQuery();
            while(rs.next()) {
               result.add(getReviewList(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return result;
      }
      
      private Review getReviewList(ResultSet rs) throws SQLException {
         return Review.builder()
               .reviewNo(rs.getInt("REVIEW_NO"))
               .memberId(rs.getString("MEMBER_ID"))
               .reviewTitle(rs.getString("REVIEW_title"))
               .enrollDate(rs.getDate("ENROLL_DATE"))
               .build();
      }

      public int selectrReviewListCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectrReviewListCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }

///프렌즈 글 구하기
      public List<Friends> getFriendsList(Connection conn, String userId,int cPage, int numPerpage){
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List<Friends> result=new ArrayList();
         
         try {
            pstmt=conn.prepareStatement(sql.getProperty("getFriendsList"));
            
            pstmt.setString(1, userId);
            pstmt.setInt(2, (cPage-1)*numPerpage+1);
            pstmt.setInt(3, cPage*numPerpage);
            
            rs=pstmt.executeQuery();
            while(rs.next()) {
               result.add(getFriendsList(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }
         return result;
      }
      
      private Friends getFriendsList(ResultSet rs) throws SQLException {
         return Friends.builder()
               .friendsNo(rs.getInt("FRIENDS_NO"))
               .memberId(rs.getString("MEMBER_ID"))
               .friendsTitle(rs.getString("FRIENDS_title"))
               .enrollDate(rs.getDate("ENROLL_DATE"))
               .build();
      }

      public int selectFriendsListCount(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         int count=0;
         try {
            pstmt=conn.prepareStatement(sql.getProperty("selectrFriendsListCount"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            if(rs.next()) count=rs.getInt(1);
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return count;
      }


      public List<Country> getNation(Connection conn,String userId) {
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         List<Country> n=new ArrayList();
         try {
            pstmt=conn.prepareStatement(sql.getProperty("getNation"));
            pstmt.setString(1, userId);
            rs=pstmt.executeQuery();
            while(rs.next()) {
               n.add(getNation(rs));
            }
         }catch(SQLException e) {
            e.printStackTrace();
         }finally {
            close(rs);
            close(pstmt);
         }return n;
      }
      
      private Country getNation(ResultSet rs) throws SQLException {
         return Country.builder()
               .nName(rs.getString("N_NAME"))
               .nImg(rs.getString("C_PIC"))
               .build();
      }

      public int deleteNote(Connection conn, String checkNum) {
    	   
          PreparedStatement pstmt=null;
          ResultSet rs=null;
          int result=0;
          try {
             pstmt=conn.prepareStatement(sql.getProperty("deleteNote"));
             pstmt.setInt(1, Integer.parseInt(checkNum));
             result=pstmt.executeUpdate();
          
          }catch(SQLException e) {
             e.printStackTrace();
          }finally {
             close(rs);
             close(pstmt);
          
          }return result;
    }





}


      
      
      
   
 