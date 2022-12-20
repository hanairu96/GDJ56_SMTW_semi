<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.WroteList, java.util.List" %>
<%@ page import="com.smtw.qna.model.vo.Qna, java.util.List" %>
<%@ page import="com.smtw.review.model.vo.Review" %>
<%@ page import="com.smtw.friends.model.vo.Friends" %>

<%
	List<Qna> qlist=(List<Qna>)request.getAttribute("qlist");
	List<Review> rlist=(List<Review>)request.getAttribute("rlist");
	List<Friends> flist=(List<Friends>)request.getAttribute("flist");
%>

<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu2">
           	<div><h4 style="text-align: center;">마이 페이지</h4></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>

        <div class="menuDiv"></div>
        
         <div id="listmenu">
        <p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">전체글</p>
        <p style="background-color: lavender;" onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWroteQna.do?id=<%=logInMember.getMemberId()%>');">질문 글</p>
        <p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWroteFriends.do?id=<%=logInMember.getMemberId()%>');">프렌즈 구하기 글</p>
        <p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWroteReview.do?id=<%=logInMember.getMemberId()%>');">리뷰 글</p>
        </div>

        <div class="texts">
            <h1>내가 쓴 글</h1>
            <br>
			
			<!-- 내가 쓴 질문글 -->
            <div>
                <table id="list">
                	<thead>
	                    <tr>
	                        <th>제목</th>
	                        <th>작성일</th>
	                    </tr>
					</thead>
					<tbody>
					<%if(qlist.isEmpty()) {%>
						<tr>
							<td colspan="4">아직 작성한 친구구하기 글이 없습니다:(</td>
						</tr>
					<%}else {
						for(Qna q : qlist) {%>
	                    <tr>
	                        <td onclick="location.replace('<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=q.getQnaNo()%>');">
	                        	<%=q.getReviewTitle() %>
	                        </td>
	                        <td><%=q.getEnrollDate()%></td>
	                        
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
         .sidemenu2{
                padding: 10px;
                /* margin-top: 1000px; */
                /* margin: 0 auto; */
                /* border: 1px solid; */
                font-size: 18px;
                font-weight: bold;
                position: fixed;
            }
            
            .menuDiv{
                width: 15%;
            }
    
            .sidemenu2 p:hover{
                transform: scale(1.1);
                transition-property: transform;
                transition-duration: 1s;
            }
           .sidemenu2>*:not(div:nth-child(1)){
                width: 200px;
                height: 50px;
                background-color: lavender;
                border-radius: 50px;
                box-shadow: 5px 2px 8px lavender;
            }
            .sidemenu2 p{
                text-align: center;
                padding: 13px;
                cursor:pointer
            }
            .sidemenu2>div:nth-child(5){
                color: purple;
                
            }
            section{
                border: 1px solid tomato;
                
                margin-left: 50px;
                margin-right: 50px;
                /* ★수정한 부분 */
                /* padding-left: 100px;
                padding-right: 100px; */
                /* ★수정한부분 */
                /* 
                    만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
                    좌우 간격을 조정하세요
                    왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
                 */
                margin-top: 100px;
                height: auto; 
                /*
                    ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                    높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
                */
                
            }
            section>div{
                border: 1px solid blue;
                /* 섹션 안의 div테두리 */
                
            }
    </style>
    
<%@ include file="/views/common/footer.jsp" %>