<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/firstDiary.css"/>

<%
	String memberId=(String)request.getAttribute("memberId");
%>
<section>
	<div class="sector">
            <div class="sidemenu">
                <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>참여하기</p></a></div>
                <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>나의 출국일지</p></a></div>
                <div><a href="<%=request.getContextPath()%>/mycountry/myCountry.do"><p>나에게 맞는 나라찾기</p></a></div>
            </div>

            <div class="menuDiv"></div>

            <div id="leavingDiary">
                <h1>나의 출국일지</h1>
                <div id="insertLeavingDate">
                    <fieldset id="leavingfield">
                        <legend>나의 출국일지 등록</legend>
                            <form action="<%=request.getContextPath()%>/diary/myDiary.do?memberId=<%=memberId%>" method="post" id="insertDateform">
                                출국일 : <input type="date" name="leavingdate" id="leavingdate"><br>
                                <input type="checkbox" name="alarm" id="alarm">출국 10일전 알람서비스<br>
                                <small style="font-size:15px;color:blue;font-weight:border;">가입시 이메일 수신동의 했다면 메일로도 알림 서비스를 받을 수 있습니다.</small><br>
                                <input type="hidden" name="alarmcheck" value="N" id="alarmcheck"/>
                                <button class="customBtn btnStyle" type="submit" name="leabingDiaryBtn" id="leabingDiaryBtn">확인</button>
                            </form>
                    </fieldset>
                </div>  
            </div>
        </div>
</section>

<script>
      //  기본 위치(top)값
      $(document).ready(function() {
          // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
          var floatPosition = parseInt($("#sideMenu").css('top'));
          // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

          $(window).scroll(function() {
              // 현재 스크롤 위치를 가져온다.
              var scrollTop = $(window).scrollTop();
              var newPosition = scrollTop + floatPosition + "px";
              /* 애니메이션 없이 바로 따라감
              $("#floatMenu").css('top', newPosition);
              */
              $("#sideMenu").stop().animate({
                  "top" : newPosition
              }, 500);
          }).scroll();
      });
      
      $("#alarm").change(function(){  //출국10일전 알람서비스 체크시 Y, 체크해제시 N
    	 if($("#alarm").is(":checked")){
    		 $("#alarmcheck").attr("value","Y");
    	 }else{
    		 $("#alarmcheck").attr("value","N");
    	 }
    	 console.log( $("#alarmcheck").val());
      });
      
      
      /* 오늘날짜 이후로만 선택할 수 있게 설정 */
      var nowDate = Date.now(); // 지금 날짜를 밀리초로
      var timeOff = new Date().getTimezoneOffset()*60000; // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
      var today = new Date(nowDate-timeOff).toISOString().split("T")[0];
   						// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
      document.getElementById("leavingdate").setAttribute("min", today);
      
</script> 

<%@include file="/views/common/footer.jsp" %>