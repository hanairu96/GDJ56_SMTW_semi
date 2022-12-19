<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchIdPwd.css"/>

<section>
	<div class="container py-4">
	    <div class="row align-items-center justify-content-between" id="insert">
	        <h2 class="text-dark h4" onclick="fn_searchId();" id="searchIdtext" style="font-weight: bold;">아이디 찾기</h2>
	        <h2 class="text-dark h4" onclick="fn_searchPwd();" id="searchPwdtext">비밀번호 찾기</h2>
	    </div>
	    <form name="searchIdPwd" action="<%=request.getContextPath()%>/logIn/searchIdPwdEnd.do" 
        		method="post" onsubmit="return fn_searchIdPwd();">
	        <small id="emailHelp" class="form-text text-muted">
	            가입 당시 입력한 <b>이메일인증</b>을 통해 이용할 수 있습니다.<br>
	            비밀번호는 고객님의 소중한 개인정보로 고객센터에서 안내 또는 수정이 불가합니다.
	        </small>
	        <div id="searchIdContainer" class="form-group"  style="display: none;">
	       		<label for="exampleInputId" class="form-label mt-4">아이디　　</label>
	            <input type="text" name="searchId" id="exampleInputId" >
	        </div>
	        <div class="form-group">
	       		<label for="exampleInputName" class="form-label mt-4">이름　　　</label>
	            <input type="text" name="searchName" id="exampleInputName" required>
	        </div>
	        <span class="check" id="checkEmail"><small></small></span>
	        <div class="form-group" style="display:inline-flex; align-items:center;">
	               <label for="exampleInputEmail" class="form-label mt-4">이메일　　</label>
	            <input type="email" name="searchEmail" id="exampleInputEmail" style="margin-right:10px;" required >
	            
	            <!-- 이메일인증 -->
	             <div id="searchPwd" class="bir_yy address" >
                     <input id="searchAddr" name="emailconfirm_btn" type="button" value="인증" style="width:60px;"
                     onclick="emailcheck();" ><br>
            	</div>
            </div>
             <div class="bir_yy address crtfcNo" id="bir_yy" style="display: none;">
                 <span class="check" id="checkCrtfcNo"><small></small></span>
                 	<input type="text" class="form-control" name="inputEmail" id="crtfcNoCheck"
                 	  placeholder="인증번호 입력">
                 	  
            	 <div class="bir_yy address crtfcNo" style="display:none;">
             	  	<input id="crtfcButton" name="emailconfirm_btn" type="button" value="확인"
                    onclick="crtNoCheck();" style="float:right;">
                 </div>
            </div>
	        <div id="insert">
	            <div class="d-grid">
	                <button id="searchIdPwd" class="customBtn btnStyle" type="submit">다음</button>
	            </div>
	        </div>
	    </form>
	</div>
	<script>
		const fn_searchId=()=>{
			$("#searchIdContainer").hide();
			
			$("#searchIdtext").css("font-weight","bold");
			$("#searchPwdtext").css("font-weight","normal");
		}
		const fn_searchPwd=()=>{
			$("#searchIdContainer").show();
			
			$("#searchPwdtext").css("font-weight","bold");
			$("#searchIdtext").css("font-weight","normal");
		}
		
		var crtfcNoData="";//변수에 인증번호를 저장하기 위함
		//인증번호전송 눌렀을 때
          const emailcheck=()=>{
        	  $("span#checkEmail>small").text("");
	          	const inputEmail=$("#exampleInputEmail").val().trim();
			var emailReg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				if(inputEmail==""){
					$("span#checkEmail>small").text("이메일을 입력해주세요.").css("color","red");
					$("#exampleInputEmail").focus();
					return false;
				}
				if(!emailReg.test(inputEmail)){
					$("span#checkEmail>small").text("올바른 이메일을 입력해주세요.").css("color","red");
					$("#exampleInputEmail").focus();
					return false;
				}
				
				$("span#checkCrtfcNo>small").text("인증번호를 발송했습니다. 인증번호를 입력해주세요.").css("color","#7e8cd2");
				$("span#checkCrtfcNo").show();
				$("div.crtfcNo").show();
				
			//인증번호 확인하기 위한 ajax
			$.ajax({
				url:"<%=request.getContextPath()%>/gmailCheck.do",
				data:{"email":inputEmail},//입력받은 이메일 넘기기
				success:data=>{//ajax로 돌려받은 인증번호
					// 인증번호 값이 없을 경우
					if(data==null){
						alert("인증에 실패하였습니다. 다시 시도해주세요");
						$("span#checkCrtfcNo>small").text(" ");//인증번호 발신메세지 지우기
						return false;
				    // ajax가 돌아가서 제대로 값이 돌아온 경우
					}else{
						crtfcNoData=data;//인증번호를 변수에 저장
					}
				}
			})
      }
          
          
        //인증번호 입력 후 확인버튼 눌렀을 때
			const crtNoCheck=()=>{
//				console.log("인증번호 : "+crtfcNoData);
				//인증번호 칸에 아무것도 입력하지 않았을 경우
				if($("#crtfcNoCheck").val()==""){
					$("span#checkCrtfcNo>small").text("인증번호를 입력해주세요.").css("color","red");
					$("span#checkEmail>small").text("");
					console.log("인증번호 칸 비어있음");
				}
				//인증번호가 틀렸을 경우
				else if(crtfcNoData!=$("#crtfcNoCheck").val()||$("#crtfcNoCheck").val()==""){
					$("span#checkCrtfcNo>small").text("인증에 실패하였습니다. 다시 시도해주세요.").css("color","red");//인증번호 실패메세지
					$("span#checkEmail>small").text("");
					console.log("인증코드 틀림");
					return false;
					
				//올바른 인증번호 입력
				}else if(crtfcNoData == $("#crtfcNoCheck").val()){
           			$("span#checkCrtfcNo>small").text("인증에 성공하였습니다.").css("color","green");
           		}
           	}
			
			const fn_searchIdPwd=()=>{
				//이메일인증 성공
		   		if(!($("span#checkCrtfcNo>small").text().includes("성공"))){
		   			alert("이메일인증이 필요합니다.")
		   			$("#exampleInputEmail").focus();
		   			return false;
		   		}
			}
	</script>
	<style>
		.text-dark:hover{
			cursor: pointer;
		}
	</style>
</section>

<%@include file="/views/common/footer.jsp" %>