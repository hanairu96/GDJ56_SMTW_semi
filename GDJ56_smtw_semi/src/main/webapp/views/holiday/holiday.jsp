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
                <h1><span style="background-color: rgb(178 183 239);">워킹홀리데이란?</span></h1>
               	  <img src="<%=request.getContextPath()%>/images/holiday.jpg" id="plane"> 
                
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이란?</h4>
                    <p>
      워킹홀리데이란,<br>국가들 간에 양해각서 협정을 맺어 젊은이들로 하여금 
      방문국에서 일반적으로 1년간 자유롭게 거주, 취업, 여행은 공부할 수 있도록 특별히 허가해 
      주고 각 방문국들의 현지 삶의 방식, 문화 체험, 언어 학습, 역사 공부, 유적지 탐방, 여행 
      및 타국의 이해를 높일 수 있도록 젊은 청년 시절의 경험의 폭을 넓힐 수 있는 
      기회를 제공하는 <span style="background-color: rgb(178 183 239);">청년 교환 이동성 프로그램</span>입니다.
                    </p>
                </div>
    
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이 신청 정보</h4>
                        <p>
      <span style="background-color: rgb(178 183 239);">저희와 함께 워킹홀리데이를 지금 당장 준비하세요!<br></span>
      워킹홀리데이는 총 23개 국에서 신청이 가능합니다.<br>
      23개국 나라의 상황에 따라 면접 또는 신청서 서류 작성이 필요합니다.<br>
      나라마다 달라지는 워킹홀리데이 신청 및 준비가 어려우시다고요?<br>
      저희 홈페이지에서 그 고민을 해결해 드리겠습니다.<br>
      <b>Show Me The Way</b>는 워킹홀리데이를 가고자 하는 용감한 젊은이들의 준비를 돕겠습니다.
                        </p>
                </div>
            </div>
        </div>
</section>

<script>
	$(document).ready(function() {
	    var floatPosition = parseInt($(".sidemenu").css('top')); //사이드메뉴바의 top위치 가져옴
	
	    $(window).scroll(function() {
	        var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
	        console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
	                                //사이드메뉴바가 딱 정지하는 위치값 확인할것
	
	        var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치
	
	        if(scrollTop<=630){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
	            $(".sidemenu").stop().animate({
	                "top" : newPosition
	            }, 500);}
	    }).scroll();
	});
</script>

<%@include file="/views/common/footer.jsp" %>