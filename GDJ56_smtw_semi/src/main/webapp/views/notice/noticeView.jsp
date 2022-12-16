<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member,com.smtw.notice.model.vo.Notice" %>
<%
	Notice n=(Notice)request.getAttribute("notice");
%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/noticeView.css"/>

<section>

	<div style="height:auto;">
            <div style="display:flex;border: 0px;">
                <div style="border:0px solid red;width:100%;height:auto;display:flex; ">
                        <div style="border:0px solid green;width:1390px;;height:auto;margin: 0 auto;">
                            <div style="border:0px solid pink;width:950px;height:140px;margin: 0 auto;">
                                <div>
                                    <form action="" method="post">
                                        <table id="tbl-notice">
                                        <tr>
                                            <td style="border-left: 0px; padding-left: 40px;" colspan="2">
                                                <a href="<%=request.getContextPath() %>/notice/noticeList.do" style="color:  #7e8cd2">
                                                	<small>&raquo;&nbsp;공지사항</small>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>제 목</th>
                                            <td><span id="insertTitle"><%=n.getNoticeTitle()%></span></td>
                                        </tr>
                                        
                                        <tr>
                                            <th>작성자</th>
                                            <td><span id="insertWriter">관리자</span></td>
                                        </tr>
                                        <tr>
                                            <th><small style="color: #bebebe;">작성일</small></th>
                                            <td>
                                                <span id="enroll_date"><small style="color: #bebebe;"><%=n.getNoticeEnrollDate() %></small></span>
                                            </td>
                                        </tr>
                                        </table>
                                        
                                    </form>
                                </div>
                              
                            </div>
                            <div style="border:0px solid pink;width:950px;height:auto;margin: 0 auto;margin-top: 30px; ">
                              
                                <div style="padding:30px;border:1px solid lightgray;width:800px;height:auto;border-radius:10px;margin-left:75px;">
                                	<%=n.getNoticeContents() %>
                                </div> 
                            </div>
                            <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")){ %>
                            <div style="display:flex; border:0px solid rgb(15, 231, 231);width:900px;height:auto;margin: 0 auto;">
                                <div style="border:0px solid yellow;width:800px;height:60px;margin:0 auto;margin-top: 10px;">
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                         <button onclick="location.assign('<%=request.getContextPath() %>/notice/modifyNotice.do?noticeNo=<%=n.getNoticeNo()%>');" class="customBtn btnStyle" type="button" value="수정">수정하기</button>
                                        <button onclick="cancel_review('주소값');"    class="customBtn btnStyle" type="button"value="삭제">삭제하기</button> 
                                    </div>
                                </div>
                            </div>
                            <%} %>
                            <div style="border-top:0px solid #7e8cd2;width:850px;height:20px;margin:0 auto;margin-top: 30px; padding-left: 20px;padding-bottom: 30px;padding-top: 10px;">
                                <span></span><a href=""style="color:  #7e8cd2">&laquo; 이전글</a>
                                </div>
                                <div style="border-bottom:1px solid #7e8cd2;width:850px;height:20px;margin: 0 auto; padding-left: 20px;padding-bottom: 30px;">
                                <a href=""style="color:  #7e8cd2">&raquo; 다음글</a>
                                </div>
                                <div style="border:0px solid blue;width:850px;height:40px;margin: 0 auto;">
                                    <button onclick="location.assign('<%=request.getContextPath() %>/notice/noticeList.do');" type="button" id="noticeList" class=" customBtn btnStyle"
                                        style="margin-top: 10px;height: 30px;line-height: 20px;margin-left: 10px;">목록</button>
                                </div>
                        </div>  
                   
                </div>
            </div>
        </div>
</section>

<%@include file="/views/common/footer.jsp" %>