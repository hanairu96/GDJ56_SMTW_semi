<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                 <div id="countryResultDiv">
                     <img src="" alt="" width="400" height="400">
                     <h1 id="radioValue"></h1>
                     <h1 id="resultName">" 대만 "</h1>
                     <button class="customBtn btnStyle" id="detailCountry"> >> 더 알아보기 << </button>
                 </div>
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

    const radioValue=document.querySelector("#radioValue");
    const urlParams = new URL(location.href).searchParams;

    //console.log(urlParams);
     const select = urlParams.get('selectText');
     const select1 = urlParams.get('selectText1');
     const select2 = urlParams.get('selectText2');
     const select3 = urlParams.get('selectText3');
     // console.log(select+select1+select2+select3);
    let text=select+", "+select1+", "+select2+", "+select3+" 을 고른 당신!!!";
     radioValue.innerHTML=text;

 
 </script>
        


<%@include file="/views/common/footer.jsp" %>