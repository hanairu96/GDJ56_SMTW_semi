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
		<%-- alert('<%=msg%>'); --%>
		boolean ch=false;
		let check=confirm('<%=msg%>');
		if(check==true){
			ch=true;
		}
		<%-- location.replace("<%=request.getContextPath()%><%=loc%>");  --%>
		if(ch===false){	
			<%request.getRequestDispatcher("/admin/memberList.do")
			.forward(request, response);%>
		}else{
			<%request.setAttribute("id", id);%>
			<%request.getRequestDispatcher("/admin/deleteMemberEnd.do")
			.forward(request, response);%>
		}
		<%-- <%=script!=null?script:""%> --%>
		
	</script>
</body>
</html>