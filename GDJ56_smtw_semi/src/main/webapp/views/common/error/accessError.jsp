<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<script>
		alert("잘못된 접근입니다.");
	</script>
	<h1>에러 발생</h1>
	<h3 style="color:red;"><%=exception.getMessage() %></h3>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000)
	</script>
	<style>
		*{
			text-align:center;
			font-family:"궁서체";
		}
		h1{
			font-size:70px;
		}
		h3{
			font-size:50px;
		}
	</style>
</body>
</html>