<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member" %>
<%
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu">
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p>관리자 페이지</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p id="purple">회원 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/qnaManage.do"><p>Q&A 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/noteReceive.do"><p>쪽지함</p></a></div>
        </div>

        <div class="menuDiv"></div>

        <div class="memberInfo" style="border:2px solid;border-radius:10px">
            <h1>회원 정보</h1>
            <br>

            <div id="proImg">
            	<%if(m.getMyImg()!=null) {%>
            		<img src="<%=m.getMyImg()%>">
            	<%}else {%>
            		<img src="<%=request.getContextPath() %>/images/tweety.jpg"
            		width="170" height="250">
            	<%} %>
            </div>
        
            <table id="list">
                <tr>
                    <td>아이디</td>
                    <td width="500px">
                    	<%=m.getMemberId() %>
                    </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>
                    	<%=m.getMemberName() %>
                    </td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                    	<%if(m.getGender()=='M') { %>
                    		남성
                    	<%}else {%>
                    		여성
                    	<%} %>
                    </td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td>
                    	<%=m.getBirth() %>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                    	<%=m.getAddress() %>
                    </td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td>
                    	<%=m.getPhone() %>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                    	<%=m.getEmail() %>
                    </td>
                </tr>
            </table>
            <br><br>
            <button id="del" onclick="deleteMember();" class="customBtn btnStyle btn btn-primary" style="height:30px;padding-bottom:40px;background-color: rgba(221, 160, 221, 0.508) !important;">&nbsp회원 삭제&nbsp</button>
        </div>
    </section>
    <style>
        .memberInfo{
            width: 70%;  
            padding: 20px;
            margin-right: 150px;
        }
        .memberInfo>h1{
            text-align: center;
        }

        #proImg{
            float: left;
            width: 170px;
            height: 250px;
            border: 1px solid;
            margin-top: 50px;
            margin-left: 50px;
            margin-right: 30px;
        }
        
        #del{
            text-align: right;
            margin-left: 880px;
            margin-top: 5px;
            margin-bottom: 20px;
        }

        #list{
            /* margin: 0 auto; */
            margin-top: 50px;
            margin-left: 20px;
            width: 700px;
            height: 300px;
            border-collapse: collapse;
        }

        #list td{
            border: 1px solid;
            text-align: center;
        }
        #list td:nth-child(1){
            font-weight: bold;
        }

/*      .sidemenu>div:nth-child(1){
            color: purple;
        } */
        .sidemenu #purple{
            color: purple;
        }
        
    </style>
    <script>
<%--         $(".sidemenu>div:nth-child(1)").click(e=>{
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
        
       	const deleteMember=()=>{
       		let check=confirm("정말로 삭제하겠습니까?");
       		if(check==true){
       			location.replace("<%=request.getContextPath() %>/admin/deleteMemberEnd.do?memberId=<%=m.getMemberId() %>");
       		}
       	}
    </script>
<%@ include file="/views/common/footer.jsp" %>