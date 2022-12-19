<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.qna.model.vo.*, java.util.List" %>
<%
	List<Qna> qnas=(List<Qna>)request.getAttribute("qnaLists");
	List<Faq> faqs=(List<Faq>)request.getAttribute("faqList");
%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/qnaList.css"/>
<section>
	<div class="sector">
	    <div class="sidemenu">
	        <div><a href="<%=request.getContextPath()%>/notice/noticeList.do"><p>게시판</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/notice/noticeList.do"><p>공지사항</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/qna/qnaList.do"><p>질문하기</p></a></div>
	    </div>

        <div class="menuDiv"></div>

        <div class="all">
            <h1 style="text-align: center;">질문하기</h1>
            <!-- 검색창 -->
            
 		<form id="modifyFaQ" action="<%=request.getContextPath()%>/qna/modifyFaq.do" method="post" > 
            <div id="Accordion_wrap">
                <h2>FAQ</h2><span>자주 묻는 질문들</span>
                <%if(!faqs.isEmpty()) {%>
                	<%for(Faq f : faqs) {%>
                <div class="que">
                	<input type="hidden" name="faqNo_" value="<%=f.getFaqNo()%>"/>
                    <span id="faqQue_1"  class="faqQue faqAll"><%=f.getFaqTitle() %></span>
                    <textarea id="faqQue_1_" name="faqQue_1_" class="textArea textQue" rows="1px" cols="120px" style="display:none;resize: none;"></textarea>
                    <div class="arrow-wrap">
                        <span class="arrow-top">↑</span>
                        <span class="arrow-bottom">↓</span>
                    </div>
                </div>
                <div class="anw">
                    <span id="faqAns_1" class="faqAnswer faqAll"><%=f.getFaqContents() %></span>
                    <textarea id="faqAns_1_" name="faqAns_1_" class="textArea textAns" rows="2px" cols="120px" style="display:none;resize: none;"></textarea>
                </div>
                	<%} %>
                <%} %>
                <!-- 관리자만 글쓰기 버튼 보이게  -->
			    <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) { %>
			    	<button id="completeFaq" type="submit" class="write customBtn btnStyle"
			    	 style="display:none;">완료</button>	  
			    	<button id="modifyFaq" type="button" class="write customBtn btnStyle"
			    	onclick="modifyFaqText();">수정</button>
			    <%} %>
            </div>
		</form> 
            <script>
            	//수정버튼 눌렀을 때
            	function modifyFaqText(){
            		for(i=0;i<<%=faqs.size()%>;i++){
            			//질문 textarea에 값 넣기
            			let faqQue=document.querySelectorAll(".faqQue")[i].innerText;
            			document.querySelectorAll(".textQue")[i].innerText=faqQue;
            			
            			//대답 textarea에 값 넣기
            			let faqAns=document.querySelectorAll(".faqAnswer")[i].innerText;
            			document.querySelectorAll(".textAns")[i].innerText=faqAns;
            		};
            		$(".textArea").show();
            		$(".faqAll").hide();
            		$("#completeFaq").show();
            	};
            	
            	//완료버튼 눌렀을 때 DB로 저장하게 하기
//             	const completeFaq=()=>{
//             		console.log($(".textArea")[0].innerText);
//             		$.ajax({
<%--             			url:"<%=request.getContextPath()%>/qna/ModifyFaq.do", --%>
//             			data:{"faqQue":$(".faqQue")[0].innerText,
//             				}
//             		})
//             	};
            </script>
            
            
            
            <div id="notice">
                <h2>Q&A</h2><span>질문 게시판</span>
                <nav class="navbar navbar-expand-sm " style="background-color: white;" >
                <div class="container-fluid position-absolute top-0 end-0" >
                   <div class=" navbar-collapse" id="navbarSupportedContent">
                    <form action="<%=request.getContextPath() %>/qna/searchQna.do" class="d-flex" role="search">
	                    <select name="searchOption" class="form-select">
	                        <option value="REVIEW_TITLE">제목</option>
	                        <option value="REVIEW_CONTENTS">내용</option>
	                        <option value="MEMBER_ID">작성자</option>
	                    </select>
	                      <input class="form-control me-2" name="searchQna" type="search" placeholder="Search">
	                      <button class="customBtn btnStyle" type="submit">검색</button>
                    </form>
                  </div>
                </div>
              </nav>
                
                <ul>
		                <!-- 질문이 있으면  -->
			        <%if(!qnas.isEmpty()) {%>
				        <li class="title">
				            <span class="number">번호</span>제목<span class="right">작성일</span><span class="right">작성자</span>
				        </li>	        	
			        	<%for(Qna qn : qnas){%>
					        <li class="content">
					        	<span class="number">　　<%=qn.getQnaNo() %>　　</span>
					        	<a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=qn.getQnaNo()%>"><%=qn.getReviewTitle()%></a>
					        	<span class="right"><%=qn.getEnrollDate() %></span>
					        	<span class="right"><%=qn.getMemberId() %></span>
					        </li>
			        	
			        	<%} %>
			        <%}else { %><!-- 질문내용이 없으면  -->
			        	<li class="title">
		                    <span style="text-align: center;">내용이 없습니다.</span>
		                </li>
			        <%} %>
			        
                </ul>
                <!-- 로그인 한 사용자만 글쓰기 버튼 보이게  -->
			    <%if(logInMember!=null) { %>
			    	<button id="writeQna" type="button" class="write customBtn btnStyle"
			    	onclick="location.assign('<%=request.getContextPath()%>/qna/qnaWrite.do');">글쓰기</button>	    
			    <%} %>
                <div id="pagination">
			        <%=request.getAttribute("pageBar") %>
			    </div>
            </div>
        </div>
    </div>
</section>
<script>
	$(".que").click(function() {
	    $(this).next(".anw").stop().slideToggle(300);
	    $(this).toggleClass('on').siblings().removeClass('on');
	    $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
	
	<!-- ##### 사이드바 스크롤 위치 따라 움직이는 스크립트문 ##### -->
    <!-- ##### 개별적으로 설정해줘야 하는 부분 있음 (각자 페이지 푸터위까지만 움직이게) ##### -->
    <!-- ##### 크롬 비율 80프로기준으로 설정했음 ##### -->
    $(document).ready(function() {
        var floatPosition = parseInt($(".sidemenu").css('top')); //사이드메뉴바의 top위치 가져옴

        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
            console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
                                    //사이드메뉴바가 딱 정지하는 위치값 확인할것

            var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치

            if(scrollTop<=860){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                $(".sidemenu").stop().animate({
                    "top" : newPosition
                }, 500);}
        }).scroll();
    });
</script>

<%@include file="/views/common/footer.jsp" %>