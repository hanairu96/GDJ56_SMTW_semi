<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/firstDiary.css"/>

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
                        <legend>출국일 입력</legend>
                            <form action="<%=request.getContextPath()%>/diary/myDiary.do" method="post" id="insertDateform">
                                <input type="date" id="leavingday"><br>
                                <button class="customBtn btnStyle" type="submit" id="leabingDiaryBtn" >확인</button>
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
</script> 

<%@include file="/views/common/footer.jsp" %>