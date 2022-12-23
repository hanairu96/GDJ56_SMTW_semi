<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.WroteList, java.util.List" %>
<%
	List<WroteList> list=(List<WroteList>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css"/>

    <section>
        <div class="sidemenu2">
           	<div><h4 style="text-align: center;">마이 페이지</h4></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNation.do?id=<%=logInMember.getMemberId()%>');">찜한 나라</p></div>
           
           
        </div>

        <div class="menuDiv">
        </div>

       <div class="texts">
        <div id="listmenu">
        <p style="background-color: lavender;"  onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">전체글</p>
        <p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWroteQna.do?id=<%=logInMember.getMemberId()%>');">질문 글</p>
        <p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWroteFriends.do?id=<%=logInMember.getMemberId()%>');">프렌즈 구하기 글</p>
        <p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWroteReview.do?id=<%=logInMember.getMemberId()%>');">리뷰 글</p>
        </div>
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
	                        <td onclick="location.assign('<%=request.getContextPath()%>/community/readReview.do?ReviewNo=<%=q.getPkNo()%>');">
	                        	<%=q.getTitle() %>
	                        </td>
	                        <%}else if(q.getTitle().contains("QNA")){%>
	                         <td onclick="location.assign('<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=q.getPkNo()%>');">
	                        	<%=q.getTitle() %>
	                        </td>
	                        <%}else{ %>
	                        <td onclick="location.assign('<%=request.getContextPath()%>/friends/friendsInfo.do?friendsNo=<%=q.getPkNo()%>');">
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
    	#listmenu>p{
    		margin-right: 0 auto;
    		cursor:pointer;
    	}
    	#listmenu{
    	position: fixed;
    	margin-left : 5%;
    	}
        .texts{
            width: 85%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
            text-align: center;
            border:2px solid;
            border-radius:10px;
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
            width: 15%;	
            height: 100px;
            font-size: 20px;
            font-weight: bold;
            position: absolute;
            }
            
        .menuDiv{
                width: 25%;
            }
        .sidemenu2>*:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu2>*:not(div:nth-child(1)){
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu2 p{
            text-align: center;
            padding-top: 6%;
             color: black;
        }
        .sidemenu2 p:hover{
            text-align: center;
            padding-top: 6%;
             color: purple;
        }
        .sidemenu2>div:first-child{
            color: purple;
        }

        .sidemenu2>div{
            height: 70px;
            
        }
        a{
            text-decoration: none;
        }
        section{
            
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
            height: 900px; 
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            /* 섹션 안의 div테두리 */
            
        }
    </style>
        <script>
      $(document).ready(function() {
          var floatPosition = parseInt($(".sidemenu2").css('top')); //사이드메뉴바의 top위치 가져옴

          $(window).scroll(function() {
              var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
              console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
                                      //사이드메뉴바가 딱 정지하는 위치값 확인할것

              var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치

              if(scrollTop<=400){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                  $(".sidemenu2").stop().animate({
                      "top" : newPosition
                  }, 500);}
          }).scroll();
      });
    </script> 
    
<%@ include file="/views/common/footer.jsp" %>