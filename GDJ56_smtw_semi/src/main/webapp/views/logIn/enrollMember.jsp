<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/enrollMember.css"/>
<section>
<div class="container py-4">
            <div class="row align-items-center justify-content-between"> 
                <span class="text-dark h4">회원정보 입력</span>                 
            </div>
            
            <form name="enrollMemberFrm" action="<%=request.getContextPath()%>/logIn/enrollMemberEnd.do" 
        		method="post" onsubmit="return fn_enrollFail();">
        		
                <div class="form-group">
               		<label for="inputId" class="form-label mt-4">아이디<span class="obli">(필수)</span></label>
                    <input id="idCheck" type="button" value="중복확인"><span class="check" id="checkId"><small></small></span>
                    <input type="text" class="form-control" name="inputId" id="inputId" 
                    	aria-describedby="emailHelp" placeholder="아이디를 입력해주세요" required>
                    <small class="form-text text-muted">아이디는 5자리 이상 입력하세요</small>
                </div>
                <script>
                	//아이디 중복확인
                	$("input#idCheck").click(e=>{
                		
                		$.ajax({
                			url:"<%=request.getContextPath()%>/logIn/idDuplicateCheck.do",
                			data:{inputId:$("input#inputId").val().trim()},
                			dataType:"json",
                			success:data=>{
                				if(data!=null){
                					$("span#checkId>small").text("사용 불가한 아이디입니다.").css("color","red");
                				}
                				else{
                					$("span#checkId>small").text("사용 가능한 아이디입니다.").css("color","green");
                				}
                			}
                		})
                	});
                	//비밀번호 재확인
                	$(()=>{
                        $("#pwdCheck").blur(e=>{
                           const pw=$("#inputPwd").val();
                           const pwck=$(e.target).val();
                           if(pw==pwck){
                              $("span#checkPwd>small").css("color","green").text("비밀번호가 일치합니다.");
                           }else{
                              $("span#checkPwd>small").css("color","red").text("비밀번호가 불일치합니다.");
                              
                           }
                        });
                     })
                	
                	
                </script>
				<div class="form-group has-success">
					<label class="form-label mt-4" for="inputPwd">비밀번호<span class="obli">(필수)</span></label>
					<input type="password" class="form-control" name="inputPwd" id="inputPwd" placeholder="비밀번호를 입력해주세요" required>
                    <small id="emailHelp" class="form-text text-muted">비밀번호는 숫자, 특수문자 및 영문자를 포함하여 8자리 이상 입력하세요</small>
				</div>

				<div class="form-group has-danger">
					<label class="form-label mt-4" for="pwdCheck">비밀번호 재확인</label> 
					<input type="password" class="form-control" name="pwdCheck" id="pwdCheck"
						 placeholder="비밀번호를 다시한번 입력해주세요">
					<span class="check" id="checkPwd"><small></small></span>
				</div>
                <div class="form-group">
               		<label for="inputName" class="form-label mt-4">이름<span class="obli">(필수)</span></label>
                    <input type="text" class="form-control" name="inputName" id="inputName"
                    	aria-describedby="emailHelp" placeholder="이름을 입력해주세요" required>
                </div>
                <div class ="bir_wrap">
                	<label class="form-label mt-4">생년월일<span class="obli">(필수)</span></label>
                <div class="bir_yy">
                	<span class="ps_box">
                		<input type="text" class="form-control" name="yy" id="yy" 
                		placeholder="년(4자)" maxlength="4" required>
                	</span>
                </div>
                	<div class="bir_mm">
                        <span class="ps_box focus">
                            <select name="month" name="month" id="month" class="custom-select">
                                <option value="01">1
                                </option>
                                <option value="02">2
                                </option>
                                <option value="03">3
                                </option>
                                <option value="04">4
                                </option>
                                <option value="05">5
                                </option>
                                <option value="06">6
                                </option>
                                <option value="07">7
                                </option>
                                <option value="08">8
                                </option>
                                <option value="09">9
                                </option>
                                <option value="10">10
                                </option>
                                <option value="11">11
                                </option>
                                <option value="12">12
                                </option>
                            </select>
                        </span>
                	</div>
                    <div class="bir_dd">
                        <select name="day" name="day" id="day" class="custom-select">
                            <option value="01" selected="selected">1
                            </option>
                            <option value="02">2
                            </option>
                            <option value="03">3
                            </option>
                            <option value="04">4
                            </option>
                            <option value="05">5
                            </option>
                            <option value="06">6
                            </option>
                            <option value="07">7
                            </option>
                            <option value="08">8
                            </option>
                            <option value="09">9
                            </option>
                            <option value="10">10
                            </option>
                            <option value="11">11
                            </option>
                            <option value="12">12
                            </option>
                            <option value="13">13
                            </option>
                            <option value="14">14
                            </option>
                            <option value="15">15
                            </option>
                            <option value="16">16
                            </option>
                            <option value="17">17
                            </option>
                            <option value="18">18
                            </option>
                            <option value="19">19
                            </option>
                            <option value="20">20
                            </option>
                            <option value="21">21
                            </option>
                            <option value="22">22
                            </option>
                            <option value="23">23
                            </option>
                            <option value="24">24
                            </option>
                            <option value="25">25
                            </option>
                            <option value="26">26
                            </option>
                            <option value="27">27
                            </option>
                            <option value="28">28
                            </option>
                            <option value="29">29
                            </option>
                            <option value="30">30
                            </option>
                            <option value="31">31
                            </option>
                        </select>
                	</div>
                </div>
                <div class="form-group">
                    <label for="inputPhone" class="form-label mt-4">전화번호('-'없이 입력해주세요)</label>
                 <input type="text" class="form-control" name="inputPhone" id="inputPhone" 
                 	aria-describedby="emailHelp" >
                </div>
			    <div class="form-group">
			      <label class="form-label mt-4">성별</label>
			    </div>  
                <div class="btn-group " data-toggle="buttons">
                    <label for="gender1" class="btn btn-outline-secondary radio">
                        <input type="radio" class="radio " name="gender" id="gender1" value="M" checked> 남
                    </label>
                    <label for="gender2" class="btn btn-outline-secondary">
                        <input type="radio" class="radio" name="gender" id="gender2" value="F"> 여
                    </label>
                </div>      
                      
                <div class="form-group">
               		<label for="inputEmail" class="form-label mt-4">이메일<span class="obli">(필수)</span></label>
                    <input type="email" class="form-control" name="inputEmail" id="inputEmail"
                    	  placeholder="이메일을 입력해주세요" required>
                </div>
                <div class ="adddressContainer">
                    <label class="form-label mt-4">주소</label>
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr"
                            	name="inputAddress_postcode" id="inputAddress_postcode" placeholder="우편번호" readonly>
                    </div>
                    <div class="bir_yy address">
                        <input id="searchAddr" type="button" value="주소 검색" onclick="sample6_execDaumPostcode()">
                    </div>
                </div>
                <div class ="adddressContainer">
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr"
                            	name="inputAddress_address" id="inputAddress_address" placeholder="주소" readonly>
                    </div>
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr" 
                            	name="inputAddress_detailAddress"id="inputAddress_detailAddress" placeholder="상세주소">
                    </div>
                </div>
                <div id="insert">
                    <div class="d-grid">
                        <button class="customBtn btnStyle" type="submit">
                            가입하기
                        </button>
                    </div>
                </div>
            </form>
        </div>
</section>
<script>
	const fn_enrollFail=()=>{
		//아이디 5자리 이상 필수입력
// 		const inputId=$("#inputId").val().trim();
// 		if(inputId.length<5){
// 			alert("아이디는 5자리 이상 입력해주세요.");
// 			$("#inputId").focus();
// 			return false;
// 		}
		
		//비밀번호 필수입력
// 		const inputPwd=$("#inputPwd").val().trim();
// 		//숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력조건
// 		const pwdReg=/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		
// 		if(inputPwd.match(pwdReg)==null){//비밀번호가 입력조건대로 입력되지 않았으면(==실패)
// 			alert("비밀번호는 숫자, 특수문자 및 영문자를 포함하여 8자리 이상이여야합니다.");
// 			$("#inputPwd").focus();
// 			return false;
// 		}

		//이름 2자리 이상 필수입력
// 		const inputName=$("#inputName").val().trim();
// 		if(inputName.length<2){
// 			alert("이름은 2자리 이상 입력해주세요.");
// 			$("#inputName").focus();
// 			return false;
// 		}
		
		//년도 입력
// 		const yy=$("#yy").val().trim();
// 		const pattern=/^(19|20)\d{2}$/;//1900~2099년도까지
// 		if(!pattern.test(yy)){//연도입력이 잘못 되었으면
// 			alert("올바른 연도를 입력해주세요.");
// 			$("#yy").focus();
// 			return false;
// 		}

		//핸드폰 번호 입력
// 		const inputPhone=$("#inputPhone").val().trim();
// 		console.log(inputPhone);
// 		const phoneReg=/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;//핸드폰 번호(- 없음)
// 		if(inputPhone==""||phoneReg.test(inputPhone)){
// 			console.log("정상입력");
// 		}
// 		else{
// 			alert("올바른 휴대폰 번호를 입력해주세요");
// 			$("#inputPhone").focus();		
// 			return false;
// 		}

		//이메일 입력
// 		const inputEmail=$("#inputEmail").val().trim();
// 		var emailReg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 		if(inputEmail==""){
// 			alert("이메일을 입력해주세요.");
// 			$("#inputEmail").focus();
// 			return false;
// 		}else{
// 			if(!emailReg.test(inputEmail)){
// 				alert("이메일 형식에 맞게 입력해주세요");
// 				$("#inputEmail").focus();
// 				return false;
// 			}
// 		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
//                 var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('inputAddress_postcode').value = data.zonecode;
                document.getElementById("inputAddress_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("inputAddress_detailAddress").focus();
            }
        }).open();
    }
</script>
<%@include file="/views/common/footer.jsp" %>