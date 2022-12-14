<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smtw.country.model.vo.Country" %>
<%
	List<Country> con=(List<Country>)request.getAttribute("country");
%>
<%@ include file="/views/common/header.jsp" %>
<section>
    <style>
        #countrymenu{
            display: flex;
            font-size:15px;
            width: 250px;
            float: left; 
            height: 1100px;
            border:1px solid black;
        }
        #collectmain{
        	flex-wrap: wrap;
            padding: 30px;
            border: 3px solid brown;
            width:410px;
            height: 450px;
        }
        #maininfo{
            line-height: 50px;
            text-align: center;
            border: 1px solid black;
            height: 50px;
            font-size:10px; 
        }
        #likename{
        	display: flex;
        }
        #like{
        	width:80px;
        	height:80px;
        }
        #comaincontainer{
        	flex-wrap: wrap;
        	display:flex;
        	position: absolute;
        	left:260px;
         	border: 5px solid green;
        	width:1500px;
        	height:1050px;
        }
        #pageBar{
        	position: absolute;
        	top:1150px;
        	left:850PX;
        	margin: 0 auto;
        }
        #btncollect{
       		position: absolute;
       		top:1150px;
        	left:1500px
        }
        div#btncollect>button{
            width:100px;
        }
/*         #maininfo{
        	font-size:50px;
        } */

    </style>


    <section>
        <h1 style="text-align: center;">국가 및 지역 정보</h1>
	            <div id="countrymenu">
	                <ul>
	                    <li><a href="<%=request.getContextPath()%>">네덜란드</a></li>
	                    <li><a href="">뉴질랜드</a></li>
	                    <li><a href="">대만</a></li>
	                    <li><a href="">덴마크</a></li>
	                    <li><a href="">독일</a></li>
	                    <li><a href="">벨기에</a></li>
	                    <li><a href="">스웨덴</a></li>
	                    <li><a href="">스페인</a></li>
	                    <li><a href="">아르헨티나</a></li>
	                    <li><a href="">아일랜드</a></li>
	                    <li><a href="">영국</a></li>
	                    <li><a href="">오스트리아</a></li>
	                </ul>
	                <ul>
	                    <li><a href="">이스라엘</a></li>
	                    <li><a href="">이탈리아</a></li>
	                    <li><a href="">일본</a></li>
	                    <li><a href="">체코</a></li>
	                    <li><a href="">칠레</a></li>
	                    <li><a href="">캐나다</a></li>
	                    <li><a href="">포르투칼</a></li>
	                    <li><a href="">폴란드</a></li>
	                    <li><a href="">프랑스</a></li>
	                    <li><a href="">헝가리</a></li>
	                    <li><a href="">호주</a></li>
	                    <li><a href="">홍콩</a></li>
	                </ul>
	            </div>
	      
        <div id="comaincontainer"> 
	        <%if(con.isEmpty()) {%>
	        	<div>
	        		<h2>조회된 나라가 없습니다.</h2>
	        	</div>
	        <%}else{
	        	for(int i=0;i<con.size();i++) {%>
           		 		
           		 		
       				 <div id="collectmain">
	                    <img src="" alt="" style="width: 400px; height:300px;" >
	                    <div id="likenameinfo">
	                        <div id="likename">
	                            <button id="like">좋아요</button>
	                         
	                            <%-- <p style="font-size:30px; border: 1px solid red; "><a href="<%=request.getContextPath()%>/countryInfo/insergo.do?nName=<%=con.get(i).getNName()%>"><%=con.get(i).getNName() %></a></p> --%>
	                            <p style="font-size:30px; border: 1px solid red; "><a href="<%=request.getContextPath()%>/countryinfo/searchAll.do?nName=<%=con.get(i).getNName()%>"><%=con.get(i).getNName() %></a></p>
	                            
	                            
	                            <button id="update" onclick="location.assign('<%=request.getContextPath()%>/country/updateCountry.do?nName=<%=con.get(i).getNName()%>')">수정</button>
	                            <button id="delete" onclick="location.assign('<%=request.getContextPath()%>/country/deleteCountry.do?nName=<%=con.get(i).getNName()%>')">삭제</button>
	                        </div>
	                        <p id="maininfo"><%=con.get(i).getNpharse() %></p>
	                    </div>
	                 </div>
				 <%} 
			 	}%>  
   		</div>
    <div id="btncollect">
    	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
		</div>
        <button class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/country/insertgo.do')"><span>추가</span></button>
    </div>

	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>
    <STYLE>
         .customBtn {
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            }
        .btnStyle {
            line-height: 42px;
            padding: 0;
            border: none;
            background: #7e8cd2;
            background: linear-gradient(0deg, #7e8cd2 0%, #7e8cd2 100%);
        }
        .btnStyle:hover {
            color: #7e8cd2;
            background: transparent;
            box-shadow:none;
        }
        .btnStyle:before,.btnStyle:after{
            content:'';
            position:absolute;
            top:0;
            right:0;
            height:2px;
            width:0;
            background: #7e8cd2;
            box-shadow:
            -1px -1px 5px 0px #fff,
            7px 7px 20px 0px #0003,
            4px 4px 5px 0px #0002;
            transition:400ms ease all;
        }
        .btnStyle:after{
            right:inherit;
            top:inherit;
            left:0;
            bottom:0;
        }
        .btnStyle:hover:before,.btnStyle:hover:after{
            width:100%;
            transition:800ms ease all;
        }
    </STYLE>
