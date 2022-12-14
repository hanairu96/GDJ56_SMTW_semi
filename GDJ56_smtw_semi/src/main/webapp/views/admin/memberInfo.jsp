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
            <div><p>회원 관리</p></div>
            <div><p>Q&A 관리</p></div>
        </div>

        <div class="menuDiv"></div>

        <div class="memberInfo">
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
        	<button id="del" onclick="deleteMember();">회원 삭제</button>
        </div>
    </section>
    <style>
        .memberInfo{
            width: 85%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
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
            margin-left: 150px;
            margin-right: 30px;
        }
        
        #del{
            text-align: right;
            /* margin-right: 0 auto; */
            margin-left: 950px;
            margin-top: 20px;
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

        .sidemenu>div:nth-child(1){
            color: purple;
        }
    </style>
    <script>
        $(".sidemenu>div:nth-child(1)").click(e=>{
        	location.assign('<%=request.getContextPath()%>/admin/memberList.do');
        })
        $(".sidemenu>div:nth-child(2)").click(e=>{
            location.assign("<%=request.getContextPath()%>/admin/qnaManage.do");
        })
        
       	const deleteMember=()=>{
       		let check=confirm("정말로 삭제하겠습니까?");
       		if(check==true){
       			location.replace("<%=request.getContextPath() %>/admin/deleteMemberEnd.do?memberId=<%=m.getMemberId() %>");
       		}
       	}
    </script>
<%@ include file="/views/common/footer.jsp" %>