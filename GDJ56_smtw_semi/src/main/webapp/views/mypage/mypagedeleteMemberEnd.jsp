<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<%
	String userId = (String)request.getParameter("id");
%>
 <section>
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
                <div id="menutitle"><h2 style="background-color: cornflowerblue;">계정 관리</h2></div>
            <div id="pwck">
            <meta http-equiv="refresh" content="2; url=<%=request.getContextPath()%>"> 
            <p >message : 그동안 Show Me The Way를 찾아주셔서 감사합니다</p>
            </div>
            </div>
            
</section>
<script>
()=()=>{
	setTimeout(() => <%=request.getContextPath()%>, 2000);
	
}
</script>
        <style>
        #pwck{
           
            position: absolute;
            top: 500px;
            left: 650px;
            width: 600px;
            height: 300px;
            
           
            
        }
        #pwck>*{
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