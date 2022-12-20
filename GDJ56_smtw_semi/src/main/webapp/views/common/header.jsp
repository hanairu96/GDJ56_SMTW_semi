<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member" %>
<%
	Member logInMember=(Member)session.getAttribute("logInMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Me The Way</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
<header>
        <div class="showme">
            <div class="logo">
            	<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/ShowMeTheWay45.jpg" alt=""></a>
            </div>
        </div>
    <div class="bar">
        <div class="menuTotal">
            <ul class="menu">
                <li id="menuli">
                    <div class="hoversection">
                        <div class="holidayhover">
                            <a href="<%=request.getContextPath()%>/holiday/holiday.do"><img src="<%=request.getContextPath()%>/images/워킹홀리데이란.png" alt="" width="60px" height="60px" class="holiday1"></a>
                       		<a href="<%=request.getContextPath()%>/holiday/holiday.do"><img src="<%=request.getContextPath()%>/images/보라워킹홀리데이란.png" alt="" width="60px" height="60px" class="holiday2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/holiday/holiday.do">워킹홀리데이란?</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/holiday/holiday.do">워킹홀리데이란?</a></li>
                            <li><a href="<%=request.getContextPath()%>/holiday/holidayRoad.do">찾아오시는길</a></li>
                            <li><a href="<%=request.getContextPath()%>/holiday/holidaySMTW.do">Show me the way</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hovercountry">
                            <a href="<%=request.getContextPath()%>/country/countryMain.do"><img src="<%=request.getContextPath()%>/images/국가정보.png" alt="" width="60px" height="60px" class="country1"></a>
                        	 <a href="<%=request.getContextPath()%>/country/countryMain.do"><img src="<%=request.getContextPath()%>/images/보라국가정보.png" alt="" width="60px" height="60px" class="country2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/country/countryMain.do">국가정보</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="">국가 및 지역별 정보</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hoverdiary">
                            <a href="<%=request.getContextPath()%>/diary/firstDiary.do"><img src="<%=request.getContextPath()%>/images/참여하기.png" alt="" width="60px" height="60px" class="diary1"></a>
                        	<a href="<%=request.getContextPath()%>/diary/firstDiary.do"><img src="<%=request.getContextPath()%>/images/보라참여하기.png" alt="" width="60px" height="60px" class="diary2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/diary/firstDiary.do">참여하기</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                             <li><a href="<%=request.getContextPath() %>/diary/firstDiary.do">나의 출국일지</a></li>																	
                             <li><a href="<%=request.getContextPath() %>/mycountry/myCountry.do">나에게 맞는 나라찾기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hoverfirends">
                            <a href="<%=request.getContextPath()%>/friends/friendsList.do"><img src="<%=request.getContextPath()%>/images/커뮤니티.png" alt="" width="60px" height="60px" class="friends1"></a>
                        	<a href="<%=request.getContextPath()%>/friends/friendsList.do"><img src="<%=request.getContextPath()%>/images/보라커뮤니티.png" alt="" width="60px" height="60px" class="friends2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/friends/friendsList.do">커뮤니티</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/friends/friendsList.do">워홀 프렌즈 구하기</a></li>
                            <li><a href="<%=request.getContextPath()%>/community/reviewBasic.do">생생후기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hovernotice">
                            <a href="<%=request.getContextPath()%>/notice/noticeList.do"><img src="<%=request.getContextPath()%>/images/게시판.png" alt="" width="60px" height="60px" class="notice1"></a>
                        	<a href="<%=request.getContextPath()%>/notice/noticeList.do"><img src="<%=request.getContextPath()%>/images/보라게시판.png" alt="" width="60px" height="60px" class="notice2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/notice/noticeList.do">게시판</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/notice/noticeList.do">공지사항</a></li>
                            <li><a href="<%=request.getContextPath()%>/qna/qnaList.do">질문하기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <!-- 로그인 유무에 따라 메뉴 다르게 보임 -->
                        <%if(logInMember==null){ %>
                        <div class="hoverlogIn">
                            <a href="<%=request.getContextPath()%>/logIn/logIn.do"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
                        	<a href="<%=request.getContextPath()%>/logIn/logIn.do"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
                        </div>
                        	<div>
                            	<a href="<%=request.getContextPath()%>/logIn/logIn.do">로그인</a>
                        	</div>
                        </div>
                        <%}else{ %>
                        	<%if(logInMember.getMemberId().equals("ADMIN")) {%>
		                        <div class="hoverlogIn">
		                       		<a href="<%=request.getContextPath()%>/admin/memberList.do"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
		                        	<a href="<%=request.getContextPath()%>/admin/memberList.do"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
                        	    </div>
		                        <div> 
		                         	<a href="<%=request.getContextPath()%>/admin/memberList.do">관리자페이지</a>
		                        </div>
                        	<%}else{%>
		                        <div class="hoverlogIn">
		                         	<a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
		                        	<a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
		                        </div>
		                        <div> 
		                            <a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>">마이페이지</a>
		                        </div>
                        	<%} %>
	                    </div>
	                    <!-- 서브메뉴영역 -->
	                    <div class="sub">
	                        <ul class="submenu">
	                            <li><a href="">쪽지함</a></li>
	                            <li><a href="<%=request.getContextPath()%>/logIn/logOut.do">로그아웃</a></li>
	                        </ul>
	                    </div>
                        <%} %>
                </li>
            </ul>
        </div>
    </div>
</header>