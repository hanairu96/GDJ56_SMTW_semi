<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
	/* String script=(String)request.getAttribute("script"); */
%>   

<html>
<head>
<meta charset="UTF-8">
<title>close</title>
</head>
<body>
	<script>
		alert('<%=msg%>');
		window.close();
	</script>
</body>
</html>