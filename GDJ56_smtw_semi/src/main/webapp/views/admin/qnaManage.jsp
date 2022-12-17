<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.qna.model.vo.Qna, java.util.List" %>
<%
	List<Qna> qnas=(List<Qna>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu">
            <div><p>회원 관리</p></div>
            <div><p>Q&A 관리</p></div>
        </div>

        <div class="menuDiv"></div>

        <div class="texts">
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