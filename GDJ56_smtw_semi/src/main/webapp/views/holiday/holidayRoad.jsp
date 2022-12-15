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
                <h3><span style="background-color: rgb(178 183 239);">찾아오시는길</span></h3>
                <div id="map" style="width:500px;height:300px;"></div>
                
                <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=63790162820e52da6fdb26e25b092596"></script>
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
                    <h4>주소</h4>
                    <pre>(08505) 서울특별시 금천구 가산디지털로 2로 115(가산동, 대륭테크노타운3차),811호</pre>
                    
                    <h4>교통편</h4>
                    <pre>1,7호선 5,6번출구 보고 5~10분</pre>
                    
                    <h4>고객센터</h4>
                    <pre>문의사항 : 질문게시판 <button>질문게시판</button></pre>
                    <pre>대표전화 : 010-0000-0000  운영시간 : 항시대기</pre>
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