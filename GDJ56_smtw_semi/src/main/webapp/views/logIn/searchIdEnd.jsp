<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("members");
%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchIdEnd.css"/>
<section>

<div class="container py-4">
	<div class="row align-items-center justify-content-between" id="insert">
<%-- 	    <a href="<%=request.getContextPath() %>/logIn/searchIdPwd.do"  class="text-dark h4">아이디 찾기</a> --%>
<%-- 	    <a href="<%=request.getContextPath() %>/logIn/searchIdPwd.do"  class="text-dark h4">비밀번호 찾기</a> --%>
	</div>
	<form>       
		<small id="emailHelp" class="form-text text-muted" style="font-size: larger;">
		    고객님의 아이디는<br><span id="idResult">' <%=m.getMemberId() %> '</span><br>입니다.
		</small>
        <div id="insert">
            <div class="d-grid">
                <button class="customBtn btnStyle" type="button" onclick="location.assign('<%=request.getContextPath()%>/logIn/logIn.do')">로그인페이지로 이동</button>
            </div>
        </div>
    </form>
</div>

</section>

<%@include file="/views/common/footer.jsp" %>