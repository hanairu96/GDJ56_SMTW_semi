<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/enrollAgree.css"/>
<style>
	textarea.agreeJoin{display:none;width: 390px;height: 96px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none; text-align: -webkit-match-parent;}
	.agree:hover{
		cursor:pointer;
	}
</style>
<section>
	<div class="wrapper">
	    <div id="check">
	        <form action="<%=request.getContextPath()%>/logIn/enrollMember.do" onsubmit="return fn_agree();">
	            <ul>
	                <li>
	                	<input type="checkbox" name="joinMember" id="allcheck" value="selectAll">
	                	<label for="allcheck"><b>　모두 확인, 동의합니다.</b></label>
	                </li>
	                <li>
		                <input type="checkbox" name="joinMember" id="join1" value='join1'>
		                <label for="join1">　이용약관 동의(필수)</label><span class="join"><a class="agree" onclick="fn_agreeJoin1();">내용보기</a></span>
		                <textarea readonly class="agreeJoin" id="agreeJoin1">제1조 (목적)
Show Me The Way(SMTW) 이용약관(이하 ‘본 약관’이라 함)은 Show Me The Way가 제공하는 Show Me The Way(이하 ‘홈페이지’라 함)의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제2조 (서비스 이용시간)

① 서비스는 24시간 제공됩니다. 단, 부득이한 사유에 의해 서비스의 제공이 곤란한 사태가 발생한 경우는 예외로 합니다.
② 서비스 제공일 및 시간대의 변경은 시행 전에 홈페이지를 통하여 이용자에게 공지합니다. 다만, 피치못할 사정이 있는 경우 사전공고는 생략될 수 있습니다.
                  		</textarea>
	                </li>
	                <li>
		                <input type="checkbox" name="joinMember" id="join2" value='join2'>
		                <label for="join2">　개인정보 수집 및 이용 동의(필수)</label><span class="join"><a class="agree" onclick="fn_agreeJoin2();">내용보기</a></span>
		                <textarea readonly class="agreeJoin" id="agreeJoin2"> 개인정보의 처리목적은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는
								다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
								- 회원 가입 및 관리
								회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다. 
                  		</textarea>
	                </li>
	                <li>
		                <input type="checkbox" name="joinMember" id="join3" value='join3'>
		                <input type="hidden" name="emailAgree" id="emailAgree" value="N" />
		                <label for="join3">　이메일 마케팅 수신 동의(선택)</label>
	                </li>
	            </ul>
	            <div id="button">
	                <button class="agree customBtn btnStyle">동의하고 가입하기</button>
	            </div>
	        </form>
	    </div>
	</div>
	<script>
		const fn_agreeJoin1=()=>{
			$("#agreeJoin1").show();
		};const fn_agreeJoin2=()=>{
			$("#agreeJoin2").show();
		};
		$(document).ready(function() {//페이지 로드가 끝나면 실행하는 함수
			
			$("#allcheck").click(function() {//전체선택을 클릭했을 때
				if($("#allcheck").is(":checked")) {
					$("input[name=joinMember]").prop("checked", true);//전부 체크
					$("#emailAgree").attr("value","Y"); //이메일 수신동의 값 'Y'
				}else {
					$("input[name=joinMember]").prop("checked", false);//전부체크해제
					$("#emailAgree").attr("value","N"); //이메일 수신동의 값 'N'
				}
			});
			
			$("input[name=joinMember]").click(function() {
				var total = $("input[name=joinMember]").length;//모든 체크박스의 개수
				var checked = $("input[name=joinMember]:checked").length;//체크되어있는 것의 개수
				
				if(total != checked) $("#allcheck").prop("checked", false);//개수가 다르면 전체선택 체크 해제
				else $("#allcheck").prop("checked", true); 
			});
			Swal.fire({ //이메일 마케팅 수신 동의 서비스 소개
    				html:"이메일 마케팅 수신 동의 시 <br>메일 서비스를 받으실 수 있습니다.",
    				icon: 'info',
    		 })
			
		});
		//필수 체크 로직
		const fn_agree=()=>{
			if($("#join1").is(":checked")==false){//필수 동의에 체크하지 않으면
				console.log($("#join1").is(":checked"))
				Swal.fire("필수 이용약관에 \n동의해주세요.");
				return false;
			}
			if($("#join2").is(":checked")==false){//개인정보 수집 및 이용동의에 체크하지 않으면
				console.log($("#join2").is(":checked"))
				Swal.fire("필수 개인정보 수집 \n및 이용에 동의해주세요.");
				return false;
			}
			
			
		}
		
		//이메일 수신 동의 체크 로직
	  $("#join3").change(function(){  //이메일 수신 동의 체크시 Y, 체크 해제시 N
	    	 if($("#join3").is(":checked")){
	    		 $("#emailAgree").attr("value","Y");
	    	 }else{
	    		 $("#emailAgree").attr("value","N");
	    		 Swal.fire({
	    				text:"체크 해제시 메일 알림 서비스를 받을 수 없습니다.",
	    				icon: 'warning',
	    		 })
		    	 console.log( $("#emailAgree").val());
		      }
	  });
			
	</script>
</section>

<%@include file="/views/common/footer.jsp" %>