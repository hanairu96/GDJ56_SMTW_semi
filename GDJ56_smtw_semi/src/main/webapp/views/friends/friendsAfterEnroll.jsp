<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String msg=(String)request.getAttribute("msg");
	String id=(String)request.getAttribute("id");
	//String id=request.getParameter("memberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지페이지</title>
</head>

<body>
	<script>
		<%-- alert(<%=msg%>); --%>
		let check=confirm('프렌즈 등록 성공!\n확인을 누르시면 마이 페이지로 이동합니다. 취소를 누르시면 워홀 프렌즈 구하기 화면으로 돌아갑니다.');
		if(check){
			location.replace("<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=id%>"); 
		}else{
			location.replace("<%=request.getContextPath()%>/friends/friendsList.do");
		}
	</script>
</body>
</html>