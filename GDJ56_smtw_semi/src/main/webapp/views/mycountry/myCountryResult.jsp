<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smtw.mycountry.model.vo.MyCountry,java.util.List" %>
<%
	List<MyCountry> mycountry=(List<MyCountry>)request.getAttribute("mycountry");
	int count=0,checkCount=1;
	boolean check=true;
	String[] countryResult=(String[])request.getAttribute("countryResult");
%>

<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myCountryResult.css"/>

<section>
 	<div class="sector">
         <div class="sidemenu">
             <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>참여하기</p></a></div>
             <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>나의 출국일지</p></a></div>
             <div><a href="<%=request.getContextPath()%>/mycountry/myCountry.do"><p>나에게 맞는 나라찾기</p></a></div>
         </div>

         <div class="menuDiv"></div>

          <div id="myCountryResult">
             <fieldset>
                 <legend id="sectiontitle">나에게 맞는 나라 찾기 결과!!!</legend>
                 
		          <table id="countryResultDiv" align="center">
		            <tbody>
			    	<% if(mycountry.isEmpty()){ %>
			    		<tr>
			    			<td id="noResult">
			    			<h1 id="radioValue">'<%=countryResult[0] %>','<%=countryResult[1] %>','<%=countryResult[2] %>','<%=countryResult[3] %>'</h1>
			    				적합한 나라가 없네요!!<br>↓↓ 어떤 나라가 있는지 보고 싶다면 ↓↓<br>
			    				<button class="customBtn btnStyle" id="detailCountryALL"> >> 워홀나라 알아보기 << </button>
			    			</td>
			    		</tr>
			    		<% } else{%>
			    			<% System.out.println(mycountry.size());%>
			    			
			    		<tr>
			    			<td colspan="4">
			    				<h1 id="radioValue">'<%=countryResult[0] %>','<%=countryResult[1] %>','<%=countryResult[2] %>','<%=countryResult[3] %>'에 적합한 나라 ↓↓</h1>
			    			<td>
			    		</tr>
						    	<tr class="countryTr"> 
						    	<%for(MyCountry mc : mycountry){ %>
					    			<%if(count<4){ %>
							    		<td>
							    			<img src="" width="200" height="200"><%-- <%=mc.getNImg() %> --%>
							    			<h1 id="resultName">" <%=mc.getNName() %> "</h1>
							    		</td>
					    		 <% count++;
					    		    checkCount++;
					    			} else{ %>
					    		 		</tr>
					    		 		
					    			<% count=0; 
					    			   checkCount++; }%>  
			    				<% }
						    	if(checkCount==mycountry.size()){
			    					check=false;
			    				}%>
			    				<tr>
			    			  <td colspan="4">
			    			  	<button class="customBtn btnStyle" id="detailCountry"> >> 더 알아보기 << </button>
			    			  </td></tr>
			    			<% }%>
				    	<%--  <% }%> --%>
		            </tbody>
		        </table>
                 
             </fieldset>
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

            if(scrollTop<=715){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                $(".sidemenu").stop().animate({
                    "top" : newPosition
                }, 500);}
        }).scroll();
    });
 </script>
        


<%@include file="/views/common/footer.jsp" %>