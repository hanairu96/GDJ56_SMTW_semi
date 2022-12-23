<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member" %>
<%
	Member m2=(Member)request.getAttribute("members");
%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchIdEnd.css"/>
<section>

<div class="container py-4" style="text-align:center;margin:0 auto;">
	<div class="row align-items-center justify-content-between" id="insert" style="text-align:center;margin:0 auto;width:170px;">
			<h2>비밀번호 재설정</h2>
	</div>
	<form name="searchIdPwd" action="<%=request.getContextPath()%>/logIn/changePwd.do?memberId=<%=m2.getMemberId() %>" method="post" onsubmit="return fn_changePwd();" style="align:center;display:flex;flex-direction:column;">    
	 	<small id="emailHelp" class="form-text text-muted" style="padding-top:0px;padding-left:0px;padding-right:0px;width:100%;">
	            비밀번호를 재설정해주세요.<br>
	            비밀번호는 고객님의 소중한 개인정보로 고객센터에서 안내 또는 수정이 불가합니다.
	    </small> 
        <div class="form-group has-success" style="text-align:center;" >
			<label class="form-label mt-4" for="inputPwd">새 비밀번호   </label>
			<input type="password" class="form-control" name="inputPwd" id="inputPwd">
	        <br><small id="emailHelp" class="form-text text-muted" style="color:gray;padding:0;">비밀번호는 숫자, 영문자를 포함하여 8자리 이상 입력하세요</small>
	        <br><br><br>
		</div>

		<div class="form-group has-danger" style="text-align:center;">
			<label class="form-label mt-4" for="pwdCheck">새 비밀번호 확인 </label>
			<input type="password" class="form-control" name="pwdCheck" id="pwdCheck"><br>
			<span class="check" id="checkPwd"><small></small></span>
		</div>
		
		
        <div id="insert">
            <div class="d-grid">
            	<br>
                <button class="customBtn btnStyle" type="submit" style="width:100px;height:50px;font-size:15px;">확인</button>
            </div>
        </div>
    </form>
</div>

</section>

<script>
	//비밀번호 재확인
	$(()=>{
	    $("#pwdCheck").keyup(e=>{
	       const pw=$("#inputPwd").val();
	       const pwck=$(e.target).val();
	       if(pw==pwck){//비밀번호가 일치할 때
	    	   if(pwck!=""){//비밀번호재입력 칸이 비어있지 않으면
	              $("span#checkPwd>small").css("color","green").text("비밀번호가 일치합니다.");                        		   
	    	   }else{
	    		   $("span#checkPwd>small").text(" ");
	    	   }
	       
	       }else{//비밀번호가 불일치할 때
	    	   if(pwck==""){//비밀번호입력칸이 비어있으면
	    		   $("span#checkPwd>small").text(" ");
	    	   }
	              $("span#checkPwd>small").css("color","red").text("비밀번호가 불일치합니다.");
	          
	       }
	    });
	 })
	
	 const fn_changePwd=()=>{
			const inputPwd=$("#inputPwd").val().trim();
			//숫자,영문 1개 이상씩 사용하여 8자리 이상 입력조건
			const pwdReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			
			if(inputPwd.match(pwdReg)==null){//비밀번호가 양식대로 입력되지 않았으면(==실패)
				Swal.fire("비밀번호는 숫자, 영문자를 \n포함하여 8자리이상");
				$("#inputPwd").focus();
				return false;
			}
			if($("span#checkPwd>small").text().includes("불")){//비밀번호가 불일치하면 
				Swal.fire("비밀번호가 일치하지 않습니다.");
				$("#pwdCheck").focus();//다시 입력
				return false;
			}
			if($("#pwdCheck").val().trim()==""){
				Swal.fire("비밀번호 확인란을 입력하세요.");
				$("#pwdCheck").focus();
				return false;
			}
	 }
</script>

<%@include file="/views/common/footer.jsp" %>