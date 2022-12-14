  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
  <%@include file="/views/common/header.jsp" %>
  <%
  	Member m = (Member)request.getAttribute("member");
  %>
  
   <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypagePwdCk.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p>쪽지함</p></div>
            <div><p>내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
            <div id="menutitle"><h2 style="background-color: cornflowerblue;">계정 관리</h2></div>
        
        <div id="mypsc">
                <img src="./사진/tomcat.png" alt="" width="200" height="200" style="border">
                <br>
                
                <button onclick="location.replace('<%=request.getContextPath()%>/mypage/mypagePwdCk.do?id=<%=logInMember.getMemberId()%>');"; style="box-shadow: 3px 3px;background-color: lavender;">수정하기</button>
                <button onclick="window.open('mypage-pwcheck.html')" style="box-shadow: 3px 3px;background-color: lavender;">탈퇴하기</button>
        </div>
        <div id="myimpo">
            <div>아이디 : <%=m.getMemberId() %></div>
            <div>이름 : <%=m.getMemberName() %></div>
            <div>성별 :<%=m.getGender() %></div>
            <div>생년월일 : <%=m.getBirth() %></div>
            <div>주소 : <%=m.getAddress() %></div>
            <div>전화번호 : <%=m.getPhone() %></div>
            <div>이메일 : <%=m.getEmail() %></div>
            <div>비밀번호 : <button onclick="location.replace('<%=request.getContextPath()%>/mypage/mypagePwdCk.do?id=<%=logInMember.getMemberId()%>');">수정하기</button></div>
        </div>


           
          
        </div>

      

    </section>
    <style>
    #myimpo{
       
        position: absolute;
        top: 500px;
        left: 800px;
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

            position: absolute;
            top: 500px;
            left: 500px;
         
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

       
        section{
            display: flex;
        }

        .contentList{
            width: 85%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
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
        .sidemenu{
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

        .sidemenu p:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu>*:not(div:nth-child(1)){
            width: 200px;
            height: 50px;
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu p{
            text-align: center;
            padding: 13px;
            cursor:pointer
        }
        .sidemenu>div:nth-child(3){
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
            height: 900px; 
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
    <%@include file="/views/common/footer.jsp" %>