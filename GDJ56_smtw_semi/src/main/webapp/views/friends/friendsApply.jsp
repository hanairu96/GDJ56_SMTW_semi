<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberFrom=(String)request.getAttribute("memberFrom");
	int friendsNo=(int)request.getAttribute("friendsNo");
	String nName=(String)request.getAttribute("nName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>친구 신청</h2>
	<p>자기소개</p>
	<form action="<%=request.getContextPath() %>/friends/friendsApplyEnd.do">
		<textarea name="propose" cols="80" rows="15" style="resize:none;" placeholder="자기소개 내용을 입력해주세요."></textarea>
		<input type="hidden" name="memberFrom" value=<%=memberFrom%>>
		<input type="hidden" name="friendsNo" value=<%=friendsNo%>>
		<input type="hidden" name="nName" value=<%=nName%>>
		<br>
		<button onclick="apply(this.form);">신청</button>
		<button onclick="cancel();">취소</button>
	</form>
	
	<script>
		const apply=(f)=>{
			let check=confirm("정말로 친구 신청을 등록하시겠습니까?");
			if(check){
				f.submit();
			}
			//취소해도 왜 등록으로 넘어가는지??
		}
		
		const cancel=()=>{
			window.close();
		}
	</script>

</body>
</html>