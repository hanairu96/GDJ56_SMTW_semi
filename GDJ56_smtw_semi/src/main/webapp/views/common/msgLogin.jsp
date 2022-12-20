<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
	/* String script=(String)request.getAttribute("script"); */
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인메세지페이지</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<body>
	<script>
		Swal.fire({
		  icon: 'error',
		  title: '<%=msg%>',
		  confirmButtonText: '확인'})
			.then((result)=>{
					if(result.isConfirmed){
						location.replace("<%=request.getContextPath()%><%=loc%>"); 
					}
			})
		
	</script>
</body>
</html>