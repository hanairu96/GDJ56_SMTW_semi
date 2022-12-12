<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<div id="main01">
	<br><br>
	<h1>메인 화면</h1>
	<p>로그인 후 마이페이지로 가는 것이 아직 구현 안 돼서 일단 관리자 페이지로 가는 버튼을 만들었습니다.</p>
	<p>나중에 구현 되면 합치도록 하겠습니다.</p>
	<button onclick="goAdmin();">관리자 페이지로</button>
</div>
<style>
	#main01{
		height:300px;
		text-align: center;
		color: red;
	}
</style>
<script>
	const goAdmin=()=>{
		<%-- location.assign("<%=request.getContextPath()%>/views/admin/회원리스트.jsp"); --%>
		location.assign('<%=request.getContextPath()%>/admin/memberList.do');
	}
</script>
<%@ include file="/views/common/footer.jsp" %>