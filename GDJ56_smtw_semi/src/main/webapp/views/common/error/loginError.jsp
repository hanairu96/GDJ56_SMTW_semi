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
		alert("로그인 시 이용할 수 있는 서비스입니다.");
		location.assign(document.referrer);
	</script>
</body>
</html>