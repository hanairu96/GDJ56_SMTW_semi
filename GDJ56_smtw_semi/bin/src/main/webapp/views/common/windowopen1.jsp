<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
	String id=(String)request.getAttribute("memberId");
	/* String script=(String)request.getAttribute("script"); */
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지페이지</title>
</head>
<body>
	<script>
		<%request.setAttribute("id", id);%>
		open("<%=request.getContextPath()%>/views/common/windowopen2.jsp","_blank","width=300,height=300");

		
	</script>
</body>
</html>