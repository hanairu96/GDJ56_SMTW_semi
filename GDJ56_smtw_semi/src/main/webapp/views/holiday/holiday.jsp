<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/holiday.css"/>

<section>
	 <div class="sector">
            <div class="sidemenu">
                <div><a href="<%=request.getContextPath()%>/holiday/holiday.do"><p>워킹 홀리데이란?</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holiday.do"><p>워킹 홀리데이란?</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holidayRoad.do"><p>찾아 오시는 길</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holidaySMTW.do"><p>쇼미더웨이 소개</p></a></div>
            </div>
    
             <div class="menuDiv"></div>
    
            <div id="all">
                <h3><span style="background-color: rgb(178 183 239);">워킹홀리데이란?</span></h3>
                <img src="./images/holiday.jpg" id="plane">
                
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이란?</h4>
                    <pre>
      워킹홀리데이란,국가들 간에 양해각서 협정을 맺어 젊은이들로 하여금 
      방문국에서 일반적으로 1년간 자유롭게 거주, 취업, 여행은 공부할 수 있도록 특별히 허가해 
      주고 각 방문국들의 현지 삶의 방식, 문화 체험, 언어 학습, 역사 공부, 유적지 탐방, 여행 
      및 타국의 이해를 높일 수 있도록 젊은 청년 시절의 경험의 폭을 넓힐 수 있는 
      기회를 제공하는 <span style="background-color: rgb(178 183 239);">청년 교환 이동성 프로그램</span>
                    </pre>
                </div>
    
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이 신청 정보</h4>
                        <pre>
      <span style="background-color: rgb(178 183 239);">저희와 함께 워킹홀리데이를 지금 당장 준비하세요!</span>
      워킹홀리데이는 총 23개 국에서 신청이 가능합니다.
      23개국 나라의 상황에 따라 면접 또는 신청서 서류 작성이 필요합니다.
      나라마다 달라지는 워킹홀리데이 신청 및 준비가 어려우시다고요?
      저희 홈페이지에서 그 고민을 해결해 드리겠습니다.
      <b>Show Me The Way</b>는 워킹홀리데이를 가고자 하는 용감한 젊은이들의 준비를 돕겠습니다.
                        </pre>
                </div>
            </div>
        </div>
</section>

<script>
    // 기본 위치(top)값
    $(document).ready(function() {
        // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
        var floatPosition = parseInt($(".sidemunu").css('top'));
        // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

        $(window).scroll(function() {
            // 현재 스크롤 위치를 가져온다.
            var scrollTop = $(window).scrollTop();
            var newPosition = scrollTop + floatPosition + "px";
            /* 애니메이션 없이 바로 따라감
            $("#floatMenu").css('top', newPosition);
            */
            $(".sidemunu").stop().animate({
                "top" : newPosition
            }, 500);
        }).scroll();
    });
</script>

<%@include file="/views/common/footer.jsp" %>