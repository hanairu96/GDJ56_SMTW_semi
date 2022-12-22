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
<title>메세지페이지</title>
</head>

<body>
		<%if(msg.equals("실패했습니다. 다시 시도해주세요")) {%>
		<script>
			alert("실패했습니다. 다시 시도해주세요");
     		history.go(-1);//첫번째 방법
     		history.back();//두번째 방법
     		location.replace("<%=request.getContextPath()%><%=loc%>"); 
	    </script>
	    <%}else{ %>
	    <script type="text/javascript">
            alert('<%=msg%>');
             
            <%-- opener.document.location.href="<%=request.getContextPath()%><%=loc%>"; --%>
			//부모 창을 새로고침함
            //opener.location.reload();
            window.opener.document.location.href=window.opener.document.URL;
            window.close();
        
        </script>
        <%} %>
	
</body>
</html>