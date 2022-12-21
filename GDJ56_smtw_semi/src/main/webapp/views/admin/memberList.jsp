<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member, com.smtw.diary.model.vo.Diary ,java.util.List" %>
<%
	List<Member> members=(List<Member>)request.getAttribute("list");
	List<Member> listAll=(List<Member>)request.getAttribute("listAll");
	List<Diary> diaryAll=(List<Diary>)request.getAttribute("diaryAll");
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
	   	
	   	
	   	$(document).ready(function() {
	   		let memberEmailAgree=[];
	   		let memberEmail=[];
	   		let memberID;
	   		if(!listAll.isEmpty()) { /* 회원리스트가 있다면 */
		   		 for(Member m : listAll) { /* 회원리스트에서 반복 */
		   			 if(m.getEmailAgree()=='Y'){ /* 회원 중 이메일 수신동의 여부 Y인 사람의 경우 */
		   				for(Diary d : diaryAll){ /* 출국일지 테이블에서 반복 */
		   					if(d.getMemberId().equals(m.getMemberId())){ /* 이메일 수신동의 여부 Y인 회원이 출국일지를 가진 경우*/
		   						//D-DAY구하기
			   			        LocalDate today = LocalDate.now(); // 오늘 날짜 구하기 (YYYY-MM-DD)
			   			        LocalDate diaryDate = LocalDate.parse(d.getDDay()); // 출국일 : 문자열 -> LocalDate 타입변환
			   					//날짜 사이의 간격을 계산해주는 메소드
			   					int diaryDday=(int) ChronoUnit.DAYS.between(today, diaryDate);  //출국일-오늘 DDAY계산	
		   						if(diaryDday==10){ //디데이 10인 경우
		   							memberEmailAgree.push(m.getEmail()); //회원의 이메일을 memberEmailAgree에 추가
		   						}
		   					}
		   				}
		   			}
		   		 }
		   	}
		   		
	   		console.log(memberEmailAgree);
	   		
	   		for(let i = 0; i < memberEmailAgree.length; i++) {
	   		  if(memberEmailAgree[i] === 'X')  {
	   			memberEmailAgree.splice(i, 1);
	   		    i--;
	   		  }
	   		}
	   		console.log(memberEmailAgree);
	   		
		   	 const set = new Set(memberEmailAgree);
	         const memberEmailtotal = [...set];
				
			//출국10일전 알림 메일 발송을 위한 ajax
			<%--  $.ajax({
					url:"<%=request.getContextPath()%>/diary/mailAlarm.do",
					data:{
						memberEmailtotal:JSON.stringify(memberEmailtotal)//사용자 이메일 넘기기
					},
					success:data=>{//ajax로 돌려받은 결과값
						Swal.fire(data);
					}
				}) --%> 
	   		}) 
	   	
				
	   	
    </script>
<%@ include file="/views/common/footer.jsp" %>