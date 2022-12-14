<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
	//String id=(String)request.getAttribute("memberId");
	/* String script=(String)request.getAttribute("script"); */
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지페이지</title>
</head>
<body>
	<p>정말로 삭제하겠습니까?</p>
	<button onclick="deleteMember();">확인</button>
	<button onclick="cancel();">취소</button>

	<script>
		const deleteMember=()=>{
			<%String id=(String)request.getAttribute("id");%>
			<%request.setAttribute("id", id);%>
			<%System.out.println(id);%>
			opener.location.replace("<%=request.getContextPath()%>/admin/deleteMemberEnd.do");
			close();
		}
		
		const cancel=()=>{
			close();
		}
	
	
		<%-- 	
		open("","_blank","width=300,height=300");
	
	
	
		alert('<%=msg%>');
		boolean ch=false;
		let check=confirm('<%=msg%>');
		if(check==true){
			ch=true;
		}
		location.replace("<%=request.getContextPath()%><%=loc%>"); 
		if(ch===false){	
			<%request.getRequestDispatcher("/admin/memberList.do")
			.forward(request, response);%>
		}else{
			<%request.setAttribute("id", id);%>
			<%request.getRequestDispatcher("/admin/deleteMemberEnd.do")
			.forward(request, response);%>
		}
		<%=script!=null?script:""%>
		 --%>
	</script>
</body>
</html>