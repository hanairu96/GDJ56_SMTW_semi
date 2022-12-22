<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.smtw.admin.controller.GmailCheckServlet"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<%
	String email=(String)request.getAttribute("email");
	String crtfcNo=(String)request.getAttribute("crtfcNo");
%>
<form method="post" action="" name="emailcheck">
	<table>
		<tr>
			<th colspan="2">인증번호를 입력하세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="emailconfirm">
			</td>
			<td>
				<input type="button" value="확인" 
                 onclick="confirmemail(emailcheck.emailconfirm.value,
                                                               <%=crtfcNo%>)">
			</td>
		</tr>
	</table>
</form>
<script>
function confirmemail(emailconfirm_value, crtfcNo){
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != crtfcNo){
		Swal.fire("인증에 실패하였습니다. \n다시 시도해주세요");
		emailconfirm_value="";
		self.close();
		
    // 인증코드가 일치하는 경우
	}else if(emailconfirm_value==crtfcNo){
		emailconfirm_value="";
		Swal.fire("");
		//self.close();
		//opener.document.insertform.emailconfirm_value.value=1;
	}
}
</script>