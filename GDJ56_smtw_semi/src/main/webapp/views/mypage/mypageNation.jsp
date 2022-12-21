 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smtw.country.model.vo.Country" %>

<%
	List<Country> n = (List<Country>)request.getAttribute("likeNation");
%>
  <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
            <div><p>워홀 프렌즈</p></div>
            <div><p>계정 관리</p></div>
            <div><p>쪽지함</p></div>
            <div><p>내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>
        
        <div class="menuDiv"></div>
        
        <div class="contentList">
            <div id="menutitle"><h2 style="background-color: cornflowerblue;">내가 찜한 나라</h2></div>
            <div style="margin-top: 5%;"><h2 >지금 전 세계가 <%=logInMember.getMemberName() %>님을 기다리고 있어요!</h2></div>
            
            <%if(n.isEmpty()){ %>
             <div class="npicdiv">
            	<div class="nPic" style="width:500; height:500;border: 1px solid;">
           			<b>아직 찜한 나라가 없습니다 :(</b> <br>
         			<b>아직 워킹홀리데이 나라를 못정하셨나요?</b>
           		</div>
           	 </div>
            	<div style="width:500; height:500;border: 1px solid;">
           		<button onclick="location.assign('<%=request.getContextPath()%>/mycountry/myCountry.do');">나에게 맞는 나라 찾기 테스트 하러 가기</button><br>
         		<button onclick="location.assign('<%=request.getContextPath()%>/community/reviewBasic.do');">생생후기 보러 가기</botton>
           		</div>
           	<%}else if(n.size()<3){%>
     			<div class="npicdiv">
	     			<%for(int i=0;i<n.size();i++){%>
	            	<div class="nPic" style="width:500; height:500;border: 1px solid;">
	          			<p><%=n.get(i).getNName() %></p>
	         		 	<img src="<%=request.getContextPath()%>/upload/<%=n.get(i).getNImg() %>" 
	         		 	onclick="location.assign('<%=request.getContextPath()%>/countryinfo/searchAll.do?nName=<%=n.get(i).getNName() %>');" alt="" width="200" height="200">
	           		</div>
           		<%} %>
           		</div>
            	<div id="nBt" style="width:500; height:500;border: 1px solid;">
           			<button onclick="location.assign('<%=request.getContextPath()%>/country/countryMain.do');">더 많은 나라 보러가기</botton>
           		</div>
            <%}else{ %>
         	<div class="npicdiv">
         		<%for(int i=0;i<n.size();i++){%>
         		<div class="nPic" style="width:500; height:500;border: 1px solid;">
          			<p><%=n.get(i).getNName() %></p>
         		 	<img src="<%=request.getContextPath()%>/upload/<%=n.get(i).getNImg() %>" 
         		 	onclick="location.assign('<%=request.getContextPath()%>/countryinfo/searchAll.do?nName=<%=n.get(i).getNName() %>');" alt="" width="200" height="200">
           		</div>
           		<%}%>
           	</div>
           		<div id="nBt" style="width:500; height:500;border: 1px solid;">
           			<button onclick="location.assign('<%=request.getContextPath()%>/diary/firstDiary.do');">나의 출국일지로 이동하기</button>
           		</div>
           	<%}%>
        </div>
   </section>

    
    
    <style>
      .npicdiv{
		display:flex;
      	justify-content: center;
      	
      }
     .nPic{
     	float: left;
         margin: 20px;
         
     }
     
     #nBt{
     	clear:both
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
        .sidemenu>div:nth-child(6){
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