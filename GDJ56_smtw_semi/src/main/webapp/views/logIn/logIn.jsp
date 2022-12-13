<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/logIn.css"/>
<section>
	<div class="wrapper">
	    <div id="login">
	        <h1>Show Me The Way</h1>
	        <form id="loginForm" action="<%=request.getContextPath()%>/logIn/logInEnd.do"  method="post">
	            <input class="logInform" name="logInId" type="text" id="logInId" placeholder="아이디"><br>
	            <input class="logInform" name="logInPwd" type="password" id="logInPwd" placeholder="비밀번호"><br>
	            <span id="pwdCheck"><small></small></span>
	            <br>
	            <button type="button" id="loginBtn" class="customBtn btnStyle">로그인</button>
	        </form>
	        <a href="<%=request.getContextPath()%>/logIn/enrollAgree.do">회원가입</a><span> / </span>
	        <a href="<%=request.getContextPath()%>/logIn/searchIdPwd.do">아이디 또는 비밀번호 찾기</a>
	    </div>
	</div>
	<script>
		$("#loginBtn").click(e=>{
			$.ajax({
				url:"<%=request.getContextPath()%>/logIn/logInEnd.do",
				data:{"logInId":$("#logInId").val().trim(),
					"logInPwd":$("#logInPwd").val().trim()},
				success:data=>{
					if(data==null){
						$("span#pwdCheck>small").text("아이디 또는 비밀번호가 일치하지 않습니다.").css("color","red");
						$("#logInId").focus();
						return false;
					}else{
						location.replace("<%=request.getContextPath()%>");
					}
				}
			})
		});
	</script>
</section>

<%@include file="/views/common/footer.jsp" %>