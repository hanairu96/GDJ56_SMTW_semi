<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.qna.model.vo.Qna, java.util.List" %>
<%
	List<Qna> qnas=(List<Qna>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css"/>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu">
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p>관리자 페이지</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p>회원 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/qnaManage.do"><p id="purple">Q&A 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/noteReceive.do"><p>쪽지함</p></a></div>
        </div>

        <div class="menuDiv"></div>

        <div class="texts" style="border:2px solid;border-radius:10px">
            <h1>Q&A 관리</h1>
            <br>

            <div>
                <table id="list">
                	<thead>
	                    <tr>
	                        <th>번호</th>
	                        <th>제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                    </tr>
					</thead>
					<tbody>
					<%if(qnas.isEmpty()) {%>
						<tr>
							<td colspan="4">조회된 질문이 없습니다.</td>
						</tr>
					<%}else {
						for(Qna q : qnas) {%>
	                    <tr>
	                        <td><%=q.getQnaNo() %></td>
	                        <td><a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=q.getQnaNo() %>"><%=q.getReviewTitle() %></a></td>
	                        <td><%=q.getMemberId() %></td>
	                        <td><%=q.getEnrollDate() %></td>
	                    </tr>
	                	<%}
					} %>
                    </tbody>
                </table>
                <br>
                <div style="border:0px solid blue;width:100%;height:80px;text-align: center;">
                     <!-- 페이지 바 -->
                     <nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
                         <ul class="pagination justify-content-center" style="color:rgba(221, 160, 221, 0.508) !important;">
							<%=request.getAttribute("pageBar") %>
                         </ul>
                     </nav>
                </div>
            </div>
        </div>

    </section>
    <style>
        .texts{
            width: 70%;  
            padding: 20px;
            padding-top:30px;
            margin-right: 150px;
            text-align: center;
        }
        .texts h1{
            text-align: center;
        }

        .texts>form{
            float: right;
            margin-right: 150px;
        }

        #list{
            margin: 0 auto;
            /* margin-top: 50px;
            margin-left: 20px; */
            width: 900px;
            height: 300px;
            border-collapse: collapse;
        }

        #list td{
            /* border-top: 1px solid; */
            border-bottom: 1px solid;
            text-align: center;
        }
        #list td:nth-child(1){
            font-weight: bold;
        }

/*      .sidemenu>div:nth-child(2){
            color: purple;
        } */
        .sidemenu #purple{
            color: purple;
        }
        
        .sidemenu>div{
        	margin-top:20px;
        }
    </style>
    <script>
<%-- 	    $(".sidemenu>div:nth-child(1)").click(e=>{
	    	location.assign('<%=request.getContextPath()%>/admin/memberList.do');
	    })
	    $(".sidemenu>div:nth-child(2)").click(e=>{
	        location.assign("<%=request.getContextPath()%>/admin/qnaManage.do");
	    }) --%>
	    
		$(document).ready(function() {
		    // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		    var floatPosition = parseInt($(".sidemenu").css('top'));
		    // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		    $(window).scroll(function() {
		        // 현재 스크롤 위치를 가져온다.
		        var scrollTop = $(window).scrollTop();
		        var newPosition = scrollTop + floatPosition + "px";
		        $(".sidemenu").stop().animate({
		            "top" : newPosition
		        }, 500);
		    }).scroll();
		});
    </script>
<%@ include file="/views/common/footer.jsp" %>