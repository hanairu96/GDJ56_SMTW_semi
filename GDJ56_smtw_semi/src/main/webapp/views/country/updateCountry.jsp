<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.country.model.vo.Country" %>
<%
	Country c=(Country)request.getAttribute("country");
%>
<%@ include file="/views/common/header.jsp" %>
<section>
    <div id="updatetpage">
        <fieldset>
            <legend><h1 style="text-align: centers;">국가정보 수정페이지</h1></legend>
            <form name="countryinfo" action="<%=request.getContextPath()%>/country/updateFirstCountry.do" method="post">
                <div>
                	나라명
                   	<input type="text" name="nName" value="<%=c.getNName()%>" readonly>
                </div>
                <br>
                <div>
                    나라언어 
                    <br><label><input type="radio" name="langEn" value="영어권" <%=c.getNLanguage().equals("영어권")?"checked":""%>>영어권</label>
                    <label><input type="radio" name="langEn" value="비영어권" <%=c.getNLanguage().equals("비영어권")?"checked":""%>>비영어권</label>
                </div>  
                <br>

                <div>
                    나라성향 
                    <br><label><input type="radio" name="tend2" value="온화" <%=c.getNTend().equals("온화")?"checked":""%>>온화</label>
                    <label><input type="radio" name="tend2" value="열정" <%=c.getNTend().equals("열정")?"checked":""%>>열정</label>
                </div> 
                <br>
                <div>
                    나라장소(대륙/섬) 
                    <br><label><input type="radio" name="land" value="대륙" <%=c.getNPlace().equals("대륙")?"checked":"" %>>대륙</label>
                    <label><input type="radio" name="land" value="섬" <%=c.getNPlace().equals("섬")?"checked":"" %>>섬</label>
                </div>
                <br>
                <div>
                    대표적인 계절
                    <br><label><input type="radio" name="weather" value="온난" <%=c.getNSeason().equals("온난")?"checked":"" %>>온난</label>
                    <label><input type="radio" name="weather" value="한랭" <%=c.getNSeason().equals("한랭")?"checked":"" %>>한랭</label>
                </div>
                <br>
                <div>
                    나라사진
                    <br><input type="file" name="picpic" value="<%=c.getNImg()%>"></input>
                </div>
                <br>
                <div>
                    한줄글 
                    <br><inpuT type="text" name="ontext" size="100" value="<%=c.getNpharse() %>" placeholder="예시)풍차와 나막신, 튤립과 치즈의 나라"></inpuT>
                </div>
                <br>    

        </fieldset>
        <div id="twobu">
            <button class="customBtn btnStyle"><span>수정</span></button>
        </div>
        </form>
    </div>
    <style>
    	#updatetpage{
	    	padding-left:25%;
	    	padding-right:25%;
    	}
    	
    
       	#twobu{
    		padding-left:75%
    	}
    	#twobu>button{
    		width:100px;
    	}
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
        
        
      	section{
/*          border: 1px solid tomato; */
         
         margin-left: 50px;
         margin-right: 50px;
         padding-left: 100px;
         padding-right: 100px;
         /* 
             만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
             좌우 간격을 조정하세요
             왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
          */
         margin-top: 100px;
         height: 500px; 
         /*
             ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
             높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
         */
            
        }
      /*   section>div{
            border: 1px solid blue;
            /* 섹션 안의 div테두리 */
            
        } */
    </style>
</section>
<%@ include file="/views/common/footer.jsp" %>