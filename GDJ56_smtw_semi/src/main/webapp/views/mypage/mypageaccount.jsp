<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
 <%
  	Member m = (Member)request.getAttribute("member");
 
 %>
  
   <section>
   	<div class="sector">
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
      		<div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNation.do?id=<%=logInMember.getMemberId()%>');">찜한 나라</p></div>
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
        <h1>계정관리</h1>
        <div id="mypsc">
                <img src="<%=request.getContextPath()%>/upload/account/<%=m.getMyImg() %>" alt="" width="200" height="200" style="border">
                <br>
                
                <button onclick="location.assign('<%=request.getContextPath()%>/mypage/mypagePwdCk.do?id=<%=m.getMemberId()%>');"; style="box-shadow: 3px 3px;background-color: lavender;">수정하기</button>
                <button onclick="location.assign('<%=request.getContextPath()%>/mypage/mypagePwdCk2.do?id=<%=m.getMemberId()%>');" style="box-shadow: 3px 3px;background-color: lavender;">탈퇴하기</button>
        </div>
        <div id="myimpo">
            <div>아이디 : <%=m.getMemberId() %></div>
            <div>이름 : <%=m.getMemberName() %></div>
            <div>성별 :<%=m.getGender() %></div>
            <div>생년월일 : <%=m.getBirth() %></div>
            <div>주소 : <%=m.getAddress() %></div>
            <div>전화번호 : <%=m.getPhone() %></div>
            <div>이메일 : <%=m.getEmail() %></div>
            <div>비밀번호 : <button onclick="location.assign('<%=request.getContextPath()%>/mypage/mypagePwdCk3.do?id=<%=m.getMemberId()%>');">수정하기</button></div>
        </div>
          
        </div>

      </div>

    </section>
    
      <script>
      $(document).ready(function() {
          var floatPosition = parseInt($(".sidemenu").css('top')); //사이드메뉴바의 top위치 가져옴

          $(window).scroll(function() {
              var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
              console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
                                      //사이드메뉴바가 딱 정지하는 위치값 확인할것

              var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치

              if(scrollTop<=430){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                  $(".sidemenu").stop().animate({
                      "top" : newPosition
                  }, 500);}
          }).scroll();
      });
    </script> 
    
    <style>
    #myimpo{
        width: 600px;
        height: 300px;
    }
    #myimpo>*{
        border: 1px solid;
        padding: 2%;
    }
       
    #mypsc{
            border: 1px solid;
            border-bottom: 3px solid;
            width: 300px;
            height: 390px;
        }

        #menutitle{
            /* border: 1px solid;
            border-bottom: 3px solid; */
            position: absolute;
            top: 350px;
            left: 800px;
            width: 300px;
            height: 100px;
        }
        .contentList{
            width:80%;
            height:890px;
       		margin-left:0 auto;
       		margin-left: 0 auto;
       		text-alian : center;
       		border : 2px solid;
       		border-radius : 10px;
       		padding 20px;
       		margin-right : 150px;
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
       
       /* ##### 여기부터 사이드메뉴 스타일 #####  */
        .sector{
            display: flex;
        }
        .sidemenu{
            width: 15%;
            height: 100px;
            font-size: 20px;
            font-weight: bold;
            position: absolute;
        }
        
        .menuDiv{
            width: 25%;
        }

        .sidemenu>*:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu>*:not(div:nth-child(1)){
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu p{
            text-align: center;
            padding-top: 6%;
             color: black;
        }
        .sidemenu p:hover{
            text-align: center;
            padding-top: 6%;
             color: purple;
        }
        .sidemenu>div:first-child{
            color: purple;
        }

        .sidemenu>div{
            height: 70px;
        }
        a{
            text-decoration: none;
        }
        /* ##### 여기까지 사이드메뉴 스타일 #####  */
       
       
       
       
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
    <%@include file="/views/common/footer.jsp" %>