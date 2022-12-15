<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member,java.util.List,com.smtw.notice.model.vo.Notice" %>
<%
	List<Notice> list=(List<Notice>)request.getAttribute("notices");
// 	List<Notice> searchList=(List<Notice>)request.getAttribute("searchList");
%>
<%@ include file="/views/common/header.jsp" %>
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
                    <form action="<%=request.getContextPath() %>/notice/searchNotice.do" class="d-flex" role="search">
                        <select name="searchOption" class="form-select">
                            <option value="NOTICE_TITLE">제목</option>
                            <option value="NOTICE_CONTENTS">내용</option>
                        </select>
                        <input class="form-control me-2" name="searchNotice" type="search" placeholder="Search">
                    <button class="customBtn btnStyle" type="submit">검색</button>
                  </form>
                </div>
            </nav>
	    
	    
	    
	    <ul>
	    	<!-- 공지사항이 있으면  -->
	        <%if(!list.isEmpty()) {%>
		        <li class="title">
		            <span class="number">번호</span>제목<span class="right">작성일</span>
		        </li>	        	
	        	<%for(Notice n : list){%>
			        <li class="content">
			        	<span class="number">　　<%=n.getNoticeNo()%>　　</span>
			        	<a href="<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a>
			        	<span class="right"><%=n.getNoticeEnrollDate()%></span>
			        </li>
	        	
	        	<%} %>
	        
	        <%}else { %><!-- 공지사항이 없으면  -->
	        	<li class="title">
                    <span style="text-align: center;">조회된 공지사항이 없습니다.</span>
                </li>
	        <%} %>
	    </ul>
	    <!-- 관리자만 글쓰기 버튼 보이게  -->
		    <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) { %>
		    	<button id="write" type="button" class="write customBtn btnStyle"
		    	onclick="location.assign('<%=request.getContextPath()%>/notice/noticeWrite.do');">글쓰기</button>	    
		    <%} %>
	    <div id="pagination">
	        <%=request.getAttribute("pageBar") %>
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