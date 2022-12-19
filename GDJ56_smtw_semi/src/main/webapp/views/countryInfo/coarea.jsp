<%@ page import="com.smtw.country.model.vo.CountryPage" %>
<%
	CountryPage coarea=(CountryPage)request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%=coarea.getNInfo() %>
	</div>
</body>
</html>
