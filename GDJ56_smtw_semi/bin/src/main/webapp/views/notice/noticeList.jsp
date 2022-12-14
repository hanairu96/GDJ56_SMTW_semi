<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/noticeList.css"/>
<section>
 <!-- ##### 여기 왼쪽 사이드메뉴 div ##### -->
	<div class="sector">
	    <div class="sidemenu">
	        <div><a href="<%=request.getContextPath()%>/notice/noticeList.do"><p>게시판</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/notice/noticeList.do"><p>공지사항</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/qna/qnaList.do"><p>질문하기</p></a></div>
	    </div>
	<!-- ##### 사이드메뉴랑 본내용 구분하는 div ##### -->
	    <div class="menuDiv"></div>
	    
	<div id="notice">
	    <h1>공지사항</h1>
	    <nav class="navbar"style="background-color: white;">
	        <div class="container-fluid">
	            <a class="navbar-brand"></a>
	            <form class="d-flex" role="search">
	                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	            <button class="customBtn btnStyle" type="submit">Search</button>
	          </form>
	        </div>
	    </nav>
	    <ul>
	        <li class="title">
	            <span class="number">번호</span>내용<span class="right">작성일</span>
	        </li>
	        <li class="content"><span class="number">　　1　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	        <li class="content"><span class="number">　　2　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	        <li class="content"><span class="number">　　3　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	        <li class="content"><span class="number">　　4　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	        <li class="content"><span class="number">　　5　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	        <li class="content"><span class="number">　　6　　</span><a href="#">아무거라도 좋으니 내용을 입력하세요!!!</a><span class="right">2018-10-24</span></li>
	    </ul>
	    <button id="write" type="button" class="write customBtn btnStyle">글쓰기</button>
	    <div id="pagination">
	        <a href="#">&laquo;</a><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span><a href="#">&raquo;</a>
	    </div>
	</div>
	</div>
</section>

<!-- ##### 사이드바 스크롤 위치 따라 움직이는 스크립트문 ##### -->
    <!-- ##### 개별적으로 설정해줘야 하는 부분 있음 (각자 페이지 푸터위까지만 움직이게) ##### -->
    <!-- ##### 크롬 비율 80프로기준으로 설정했음 ##### -->
<script>
    $(document).ready(function() {
        var floatPosition = parseInt($(".sidemenu").css("top")); //사이드메뉴바의 top위치 가져옴

        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
            console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
                                    //사이드메뉴바가 딱 정지하는 위치값 확인할것

            var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치

            if(scrollTop<=620){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                $(".sidemenu").stop().animate({
                    "top" : newPosition
                }, 500);}
        }).scroll();
    });
</script> 
    <!-- ##### 여기까지 스크립트 구문 ##### -->

<%@include file="/views/common/footer.jsp" %>