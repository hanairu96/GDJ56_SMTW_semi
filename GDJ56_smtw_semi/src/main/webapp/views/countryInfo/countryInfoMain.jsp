<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smtw.country.model.vo.CountryPageInfo" %>
<%@ page import="com.smtw.country.model.vo.CountryPage" %>
<%
	List<CountryPageInfo> info=(List<CountryPageInfo>)request.getAttribute("coinfo");
	String name=(String)request.getAttribute("name");
	List<CountryPage> coinfo=(List<CountryPage>)request.getAttribute("info");
%>
<%@ include file="/views/common/header.jsp" %>
<section>
  <style>
        #wrapper{
            /* position: absolute;
            width: 100%;
            height: 100%; */
            justify-content: space-around;
            list-style-type: none;
            align-items: center;
            display: flex;
            margin-left: 100px;
            margin-right: 100px;
            padding-left: 100px;
            padding-right: 100px;
        }
        #buttoncollect{
            max-width: 1050px;
            margin: 0 auto;
            /* border: 5px solid blue; */
    
        }
        #buttoncollect>input{
            width: 200px;
            height: 50px; 
            position: relative;
            left: 15px;
        }
        div#explain{
            /* height: 1000px; */
            /* border: 5px solid blue; */
            padding-left: 5%;
        }
        #titlecountryinfo{
            /* border: 5px solid red; */
            padding: 50px;
        }
        #countrymap{
            /* border: 5px solid green; */
            padding: 50px;
        }
        #weatherclock{
            /* border: 5px solid purple; */
            padding: 50px;
        }
        #weather{
            position: relative;
            left: 30px;
        }
        #twobu>*{
            position: relative;
            left: 80%;
        }
        #countrymap{
        	width : 600px;
        	height : 450px;
        }
    
    
    
		section{
          /*   border: 1px solid tomato; */
            
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
            height: 900px; 
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
 
    </style>  
    <body>
    <h1 style="text-align: center;">국가 및 지역 정보</h1>
    <%for(CountryPageInfo c : info) { 
    
    	if(c.getNName().equals(name)){
    	
    		 if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) {%>
    	    <div id="twobu">
        		<button class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/countryinfo/updatego.do?nName=<%=c.getNName()%>')"><span>국가정보 수정</span></button>
   			</div>
   			<%} %>
    	<p style="font-size: 13px; text-align: center;"></p>
    
    	
    <div id="wrapper">
        <div id="titlecountryinfo">
            <div>
                <h2 style="text-align: center;"><%=c.getNName() %></h2>
                <%if(c.getCPic()==null){%>
                <img src="<%=request.getContextPath()%>/images/country/noimage_view.png" alt=""
                width="200" height="130">
				<%}else{%>
				<img src="<%=request.getContextPath()%>" width="200" height="130">
				<%} %>
            </div>
            <p style="font-size: 13px;">
                - 언어 : <%=c.getCLanguage() %><br>
                - 수도 : <%=c.getUrban() %><br>
                - 화폐단위 : <%=c.getMoney() %> <br>
                - 전기 : <%=c.getElect() %>  
            </p>
        </div>
        <div id="countrymap">
            <%=c.getMapAddress() %>
        </div>
        <div id="weatherclock">
            <div id="weather">
                <div class="CurrIcon"></div>
                <div class="CurrTemp" style="font-size: 25px;"></div>
                <div class="City"></div>
            </div>
            <div id="time" style="text-align: center;">
                <!-- 해당 국가의 도시명, 나라명 순서로 변경해주세요 -->
                <h5><%=c.getUrban() %>,<%=c.getNName() %></h5>
                <span id="countryname" style="font-size: 25px;"></span>
                <!-- 한국시간 -->
                <h5>서울,대한민국</h5>
                <span id="korea" style="font-size: 25px;"></span>
            </div>
        </div>
    </div>
    
    
  <%if(coinfo==null){ %>
      <div id="buttoncollect">
        <input type="button" name="button" value="국가/지역소개">
        <input type="button" name="button" value="워홀비자">
        <input type="button" name="button" value="안전정보">
        <input type="button" name="button" value="초기정착">
        <input type="button" name="button" value="취업정보">      
      <div id="explain">
	      <pre>
	  		내용없음
          </pre>
        </div>
    </div>
  <%}else{%>
  
   	<% for(CountryPage cc : coinfo){%>
    <div id="buttoncollect">
        <input type="button" name="button" value="국가/지역소개">
        <input type="button" name="button" value="워홀비자">
        <input type="button" name="button" value="안전정보">
        <input type="button" name="button" value="초기정착">
        <input type="button" name="button" value="취업정보">      
        <div id="explain">
            <pre>
  				<%=cc.getNInfo() %>	
  			</pre>
        </div>
    </div>
	<%}
  }%>
    
	<%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) {%>
		    <div id="twobu">
		        <button class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/countryinfo/goInsertContext.do?nName=<%=c.getNName()%>')"><span>추가</span></button>
		        <button class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/countryinfo/goUpdateContent.do?nName=<%=c.getNName()%>')"><span>수정</span></button>
	   		</div>
	    <%}%>
	    
	<style>
		#twobu>button{
    		width:110px;
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
	</style>
	

    <script>
        // 우리나라 시계에 대한 스크립트
        setInterval(()=>{
            let today=new Date();    
            const $t=document.querySelector("#time>span#korea");
            $t.innerHTML=today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate()+"<br>"+today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
            // today.toLocaleTimeString()+'<br>'+today.toLocaleDateString();
        },1000);
        
    </script>
    <!-- 날씨에 대한 api 스크립트-->
    <script type="text/javascript">
        $(document).ready(function() {
        let weatherIcon = {
            '01' : 'fas fa-sun',
            '02' : 'fas fa-cloud-sun',
            '03' : 'fas fa-cloud',
            '04' : 'fas fa-cloud-meatball',
            '09' : 'fas fa-cloud-sun-rain',
            '10' : 'fas fa-cloud-showers-heavy',
            '11' : 'fas fa-poo-storm',
            '13' : 'far fa-snowflake',
            '50' : 'fas fa-smog'
        };
        $.ajax({
        url:'http://api.openweathermap.org/data/2.5/weather?q=<%=c.getEnglishName()%>&APPID=c31c0d10b1ec01d97120f16587305b9c&units=metric',
    //                                                           ㄴ도시명만 변경해주세요
        dataType:'json',
        type:'GET',
        success:function(data){
        var $Icon = (data.weather[0].icon).substr(0,2);
        var $Temp = Math.floor(data.main.temp) + 'º';
        var $city = data.name;

        $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
        $('.CurrTemp').prepend($Temp);
        $('.City').append($city);
        }
        })
        });
    </script>

     <!-- 해외 시간에 대한 스크립트 -->
    <script>
        setInterval(()=>{
            function getWorldTime(tzOffset) { // 24시간제
                var now = new Date();
                var tz = now.getTime() + (now.getTimezoneOffset() * 60000) + (tzOffset * 3600000);
                now.setTime(tz);
                var s = 
                        leadingZeros(now.getFullYear(), 4) +
                    '.' + leadingZeros(now.getMonth() + 1, 2) +
                    '.' + leadingZeros(now.getDate(), 2) +
                    '<br>' + leadingZeros(now.getHours(), 2) +
                    ':' + leadingZeros(now.getMinutes(), 2) +
                    ':' + leadingZeros(now.getSeconds(), 2);
                return s;
            }
            function leadingZeros(n, digits) {
                var zero = '';
                n = n.toString();
                if (n.length < digits) {
                    for (i = 0; i < digits - n.length; i++) zero += '0';
                }
                return zero + n;
            }
            
            const con=document.getElementById("countryname");
            con.innerHTML=getWorldTime(<%=c.getClock()%>);
            //                          ㄴ영국기준으로 시차 변경해주세요
        },1000);
    </script>
    <%}
    }%>
</section>
<%@ include file="/views/common/footer.jsp" %>