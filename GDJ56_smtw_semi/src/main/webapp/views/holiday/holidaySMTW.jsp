<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/holidaySMTW.css"/>

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
                <div id="title"><h2 class="fade-in">Show Me The Way를 만든 사람들</h2></div>
                <div class="container">
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/INTP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h1>최유리</h1>
                                <p>
                                    팀의 리더<br>
                                    카리스마로 팀을 이끄는 최고의 리더다.<br>
                                    INTP<br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h1>구예지</h1>
                                <p>
                                    팀의 맏언니<br>
                                    항상 간식을 준비하여 팀원들에게 나눠주시는 우리의 귀중한 요원<br>
                                    ISTP<br>
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/INFP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/ISFJ2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h1>홍나리</h1>
                                <p>
                                    카리스마 그 자체<br>
                                    특유의 카리스마로 선생님을 제압하는 자<br>
                                    ISFJ
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h1>문지희</h1>
                                <p>
                                    에이스<br>
                                    힘을 숨기고 있는 전공자<br>
                                    ISFP
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/ISFP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/INFJ2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h1>이동민</h1>
                                <p>
                                    비밀요원<br>
                                    그의 정체는 수수께끼이다.<br>
                                    INFJ 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h1>장선우</h1>
                                <p>
                                    팀의 광대이자 분위기 메이커<br>
                                    얼굴만 봐도 웃음이 나는, 이 시대 최고의 코미디언이다.<br>
                                    그의 이름은 바로 <strong>Cutty Jang</strong><br>
                                    INFP
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath()%>/images/mbti/INFP2-1.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
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
	
	        if(scrollTop<=1120){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
	            $(".sidemenu").stop().animate({
	                "top" : newPosition
	            }, 500);}
	    }).scroll();
	});
</script>
<%@include file="/views/common/footer.jsp" %>