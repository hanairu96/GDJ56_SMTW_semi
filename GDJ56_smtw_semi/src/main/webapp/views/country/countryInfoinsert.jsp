<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smtw.country.model.vo.Country" %>
<%
	String id=(String)request.getAttribute("id");
	List<Country> co=(List<Country>)request.getAttribute("allcountry");
	String cty="";
	for(Country cc : co){
		cty+=cc.getNName()+"/";
	}
%>
<%@ page import="com.smtw.country.model.vo.Country" %>
<%@ include file="/views/common/header.jsp" %>
<section>
	<form name="countryinfo" action="<%=request.getContextPath()%>/country/insertCountryFirst.do" 
	enctype="multipart/form-data" method="post">
		<div id="insertpage">
	        <fieldset id="wrap2">
	            <legend><h1 style="text-align: centers;">국가정보 입력페이지</h1></legend>
	                <div>
	                    나라이름 <br>
	                    <select name="selectco" id="selectco" style="width:150px;height:30px;">
	                    	<option disabled>--선택하세요--</option>
	                    	<option value="self">나라직접입력</option>
	                    	<option disabled>--24개국중선택--</option>
	                        <option value="네덜란드" selected <%=cty.contains("네덜란드")?"disabled":""%>>네덜란드</option>
	                        <option value="뉴질랜드" <%=cty.contains("뉴질랜드")?"disabled":""%>>뉴질랜드</option>
	                        <option value="대만" <%=cty.contains("대만")?"disabled":""%>>대만</option>
	                        <option value="덴마크" <%=cty.contains("덴마크")?"disabled":""%>>덴마크</option>
	                        <option value="독일" <%=cty.contains("독일")?"disabled":""%>>독일</option>
	                        <option value="벨기에" <%=cty.contains("벨기에")?"disabled":""%>>벨기에</option>
	                        <option value="스웨덴" <%=cty.contains("스웨덴")?"disabled":""%>>스웨덴</option>
	                        <option value="아르헨티나" <%=cty.contains("아르헨티나")?"disabled":""%>>아르헨티나</option>
	                        <option value="아일랜드" <%=cty.contains("아일랜드")?"disabled":""%>>아일랜드</option>
	                        <option value="영국" <%=cty.contains("영국")?"disabled":""%>>영국</option>
	                        <option value="오스트리아" <%=cty.contains("오스트리아")?"disabled":""%>>오스트리아</option>
	                        <option value="이스라엘" <%=cty.contains("이스라엘")?"disabled":""%>>이스라엘</option>
	                        <option value="이탈리아" <%=cty.contains("이탈리아")?"disabled":""%>>이탈리아</option>
	                        <option value="일본" <%=cty.contains("일본")?"disabled":""%>>일본</option>
	                        <option value="체코" <%=cty.contains("체코")?"disabled":""%>>체코</option>
	                        <option value="칠레" <%=cty.contains("칠레")?"disabled":""%>>칠레</option>
	                        <option value="캐나다" <%=cty.contains("캐나다")?"disabled":""%>>캐나다</option>
	                        <option value="포르투갈" <%=cty.contains("포르투갈")?"disabled":""%>>포르투갈</option>
	                        <option value="폴란드" <%=cty.contains("폴란드")?"disabled":""%>>폴란드</option>
	                        <option value="프랑스" <%=cty.contains("프랑스")?"disabled":""%>>프랑스</option>
	                        <option value="헝가리" <%=cty.contains("헝가리")?"disabled":""%>>헝가리</option>
	                        <option value="호주" <%=cty.contains("호주")?"disabled":""%>>호주</option>
	                        <option value="홍콩" <%=cty.contains("홍콩")?"disabled":""%>>홍콩</option>
	                    </select>   
						<input type="text" name="selfname" style="width:150px;height:30px;" id="writeoption">
						<input type="hidden" name="id" value="<%=id%>"> 
                   	<script>
                   		$(function(){
                   			console.log($("#writeoption"));
                   			$("#writeoption").hide();
                   			$("#selectco").change(function(){
                   				if($("#selectco").val()=="self"){
                   					$("#writeoption").show();
                   				}else{
                   					$("#writeoption").hide();
                   				}
               				});
               			})
                   	
                   	</script>
	                </div>
	                <br>
	                <div>
	                    나라언어 
	                    <br><label><input type="radio" name="langEn" value="영어권" checked>영어권</label>
	                    <label><input type="radio" name="langEn" value="비영어권">비영어권</label>
	                </div>  
	                <br>
	
	                <div>
	                    나라성향 
	                    <br><label><input type="radio" name="tend2" value="온순" checked>온순</label>
	                    <label><input type="radio" name="tend2" value="열정">열정</label>
	                </div> 
	                <br>
	                <div>
	                    나라장소(대륙/섬) 
	                    <br><label><input type="radio" name="land" value="대륙" checked>대륙</label>
	                    <label><input type="radio" name="land" value="섬">섬</label>
	                </div>
	                <br>
	                <div>
	                    대표적인 계절
	                    <br><label><input type="radio" name="weather" value="온난" checked>온난</label>
	                    <label><input type="radio" name="weather" value="한랭">한랭</label>
	                </div>
	                <br>
	                <div>
	                    나라사진
	                    <br><input type="file" name="piccountry"></input>
	                </div>

	                <br>
	                <div>
	                    한줄글 
	                    <br><inpuT type="text" name="ontext" size="100" placeholder="예시)풍차와 나막신, 튤립과 치즈의 나라" required></inpuT>
	                </div>
	                <br>    
			        <div id="twobu">
			            <button class="customBtn btnStyle" ><span>저장</span></button>
			        </div>
	        </fieldset>
	    </div>
      </form>
    <style>
    	#twobu{
    		padding-left:65%
    	}
    	#twobu>button{
    		width:100px;
    	}
    	
    	#insertpage{
    	padding-left:25%;
    	padding-right:25%;
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
         height: auto; 
         /*
             ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
             높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
         */
            
        }
 /*        section>div{
            border: 1px solid blue;
            /* 섹션 안의 div테두리 */
            
        } */
        
    </style>
</section>
<%@ include file="/views/common/footer.jsp" %>