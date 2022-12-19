<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.WroteList, java.util.List" %>
<%
	List<WroteList> list=(List<WroteList>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
             <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p>내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>

        <div class="menuDiv"></div>

        <div class="texts">
            <h1>내가 쓴 글</h1>
            <br>

            <div>
                <table id="list">
                	<thead>
	                    <tr>
	                        <th>글 목록</th>
	                        <th>작성일</th>
	                    </tr>
					</thead>
					<tbody>
					<%if(list.isEmpty()) {%>
						<tr>
							<td colspan="4">아직 작성한 글이 없습니다:(</td>
						</tr>
					<%}else {
						for(WroteList q : list) {%>
	                    <tr>
	                    	
	                        <%if(q.getTitle().contains("REVIEW")){%>
	                        <td onclick="location.replace('<%=request.getContextPath()%>/review/mypageFriends.do?id=<%=q.getPkNo()%>');">
	                        	<%=q.getTitle() %>
	                        </td>
	                        <%}else if(q.getTitle().contains("QNA")){%>
	                         <td onclick="location.replace('<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=q.getPkNo()%>');">
	                        	<%=q.getTitle() %>
	                        </td>
	                        <%}else{ %>
	                        <td onclick="location.replace('<%=request.getContextPath()%>/friends/friendsInfo.do?friendsNo=<%=q.getPkNo()%>');">
	                        	<%=q.getTitle() %>
	                        </td>
	                        <%} 
	                        
	                       %>
	                        <td><%=q.getDate()%></td>
	                    </tr>
	                	<%}
	                	}%>
					
                    </tbody>
                </table>
                <br>
               	<div id="pageBar">
					<%=request.getAttribute("pageBar") %>
				</div>
            </div>
        </div>

    </section>
    <style>
        .texts{
            width: 85%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
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
            cursor: pointer;
        }
        #list td:nth-child(1){
            font-weight: bold;
        }

        .sidemenu>div:nth-child(2){
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
    </script>
<%@ include file="/views/common/footer.jsp" %>