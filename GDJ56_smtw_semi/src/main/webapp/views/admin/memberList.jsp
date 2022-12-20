<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member, java.util.List" %>
<%
	List<Member> members=(List<Member>)request.getAttribute("list");
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
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p id="purple">회원 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/qnaManage.do"><p>Q&A 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/noteReceive.do"><p>쪽지함</p></a></div>
        </div>

        <div class="menuDiv"></div>

        <div class="contentList" style="border:2px solid;border-radius:10px">
            <h1>회원 리스트</h1>
            <br>
            <div id="search-container">
	            <select id="searchType">
	                <option value="userId" selected>아이디</option>
	                <option value="userName">이름</option>
	            </select>
	        	<div id="search-userId">
	        		<form action="<%=request.getContextPath()%>/admin/searchMember.do">
	        			<input type="hidden" name="searchType" value="userId" >
	        			<input type="text" name="searchKeyword" size="25" 
	        			placeholder="검색할 아이디를 입력하세요.">
	        			<button type="submit" class="customBtn btnStyle btn btn-primary" style="height:30px;padding-bottom:40px; margin-left:10px; margin-bottom :5px;background-color: rgba(221, 160, 221, 0.508) !important;">&nbsp검색&nbsp</button>
	        		</form>
	        	</div>
	        	<div id="search-userName">
	        		<form action="<%=request.getContextPath()%>/admin/searchMember.do">
	        			<input type="hidden" name="searchType" value="userName">
	        			<input type="text" name="searchKeyword" size="25" 
	        			placeholder="검색할 이름을 입력하세요.">
	        			<button type="submit" class="customBtn btnStyle btn btn-primary" style="height:30px;padding-bottom:40px; margin-left:10px; margin-bottom :5px;background-color: rgba(221, 160, 221, 0.508) !important;">&nbsp검색&nbsp</button>
	        		</form>
	        	</div>
	        </div>
            <br><br><br>
        
            <table id="list">
	            <thead>
	                <tr>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>이메일</th>
	                </tr>
	            </thead>
                <tbody>
				<%if(members.isEmpty()) {%>
					<tr>
						<td colspan="3">조회된 회원이 없습니다.</td>
					</tr>
				<%}else {
					for(Member m : members) {%>
						<tr>
							<td><a href="<%=request.getContextPath()%>/admin/memberInfo.do?memberId=<%=m.getMemberId()%>">
								<%=m.getMemberId() %></a></td>
							<td><a href="<%=request.getContextPath()%>/admin/memberInfo.do?memberId=<%=m.getMemberId()%>">
								<%=m.getMemberName() %></a></td>
							<td><%=m.getEmail() %></td>
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

    </section>
    <style>
        .contentList{
            width: 70%;
            padding: 20px;
            padding-top:30px;
            margin-right: 150px;
            text-align: center;
        }

        #list{
            margin: 0 auto;
            width: 700px;
            border-collapse: collapse;
        }
        #list th{
            border: 1px solid;
            border-bottom: 3px solid;
        }
        #list td{
            border: 1px solid;
        }

/*      .sidemenu>div:nth-child(1){
            color: purple;
        } */
        .sidemenu #purple{
            color: purple;
        }
        
        .sidemenu>div{
        	margin-top:20px;
        }
        
        #search-userId{
        	display:inline-block;
        }
    	#search-userName{
    		display:none;
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
	    
	   	$("#searchType").change(e=>{
	    	const type=$(e.target).val();
	    	$("#search-container>div").hide();
	    	$("#search-"+type).css("display", "inline-block");
	   	})
    </script>
<%@ include file="/views/common/footer.jsp" %>