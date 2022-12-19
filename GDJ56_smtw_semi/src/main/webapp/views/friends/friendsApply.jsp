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
<title>친구 신청</title>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<h2>친구 신청</h2>
	<p>자기소개</p>
	<form action="<%=request.getContextPath() %>/friends/friendsApplyEnd.do" onsubmit="return false;">
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
			if($("[name=propose]").val().length==0){
				alert("내용을 입력해주세요!");				
			}else{
				let check=confirm("정말로 친구 신청을 등록하시겠습니까?");
				if(check){
					f.submit();
				}
				//check가 false여도 자동 submit이 되는 문제가 있었는데
				//form 태그에 onsubmit="return false;"를 추가하면서 해결함
			}
		}
		
		const cancel=()=>{
			window.close();
		}
	</script>

</body>
</html>