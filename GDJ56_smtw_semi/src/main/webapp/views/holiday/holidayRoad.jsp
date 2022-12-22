<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/holidayRoad.css"/>

<section>
<div class="sector">
            <!-- 페이지 왼편 메뉴 바 -->
           <div class="sidemenu">
                <div><a href="<%=request.getContextPath()%>/holiday/holiday.do"><p>워킹 홀리데이란?</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holiday.do"><p>워킹 홀리데이란?</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holidayRoad.do"><p>찾아 오시는 길</p></a></div>
                <div><a href="<%=request.getContextPath()%>/holiday/holidaySMTW.do"><p>쇼미더웨이 소개</p></a></div>
            </div>
    
            <div class="menuDiv"></div>
    
            <!-- 다음 지도+찾아오시는길 -->
            <div id="all">
                <h1><span style="background-color: rgb(178 183 239);">찾아오시는길</span></h1>
                <div id="map" style="width:700px;height:400px;margin:0 auto;"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63790162820e52da6fdb26e25b092596"></script>
                <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(37.4780485, 126.8790079), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
                    
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                    
                    // 마커가 표시될 위치입니다 
                    var markerPosition  = new kakao.maps.LatLng(37.4780485, 126.8790079); 
                    
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
                    
                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
                    
                    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                    // marker.setMap(null);    
                </script>   
                <div id="info">
                    <h2>주소</h2>
                    <p>(08505) 서울특별시 금천구 가산디지털로 2로 115(가산동, 대륭테크노타운3차),811호</p>
                    
                    <h2>교통편</h2>
                    <p>1,7호선 5,6번출구 보고 5~10분</p>
                    
                    <h2>고객센터</h2>
                    <p>문의사항 : 질문게시판 <button class="customBtn btnStyle" id="boardBtn" onclick="location.assign('<%=request.getContextPath()%>/qna/qnaList.do')">이동</button></p>
                    <p>대표전화 : 02-2108-5900  운영시간 : 항시대기</p>
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
	
	        if(scrollTop<=760){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
	            $(".sidemenu").stop().animate({
	                "top" : newPosition
	            }, 500);}
	    }).scroll();
	});
</script>

<%@include file="/views/common/footer.jsp" %>