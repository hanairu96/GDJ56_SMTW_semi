<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/logIn.css"/>
<section>
	<div class="wrapper">
	    <div id="login">
	        <h1>Show Me The Way</h1>
	        <form id="loginForm" action="<%=request.getContextPath()%>/logIn/logInEnd.do" method="post">
	            <input class="logInform" name="logInId" type="text" placeholder="아이디"><br>
	            <input class="logInform" name="logInPwd" type="password" placeholder="비밀번호"><br>
	            <span id="pwdCheck"><small></small></span>
	            <br>
	            <button id="loginBtn" class="customBtn btnStyle">로그인</button>
	        </form>
	        <a href="<%=request.getContextPath()%>/logIn/enrollMember.do">회원가입</a><span> / </span>
	        <a href="<%=request.getContextPath()%>/logIn/searchIdPwd.do">아이디 또는 비밀번호 찾기</a>
	    </div>
	</div>
</section>

<%@include file="/views/common/footer.jsp" %>