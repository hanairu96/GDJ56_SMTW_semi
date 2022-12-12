<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myCountry.css"/>

<section>
 <div class="sector">
      <div class="sidemenu">
          <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>참여하기</p></a></div>
          <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>나의 출국일지</p></a></div>
          <div><a href="<%=request.getContextPath()%>/mycountry/myCountry.do"><p>나에게 맞는 나라찾기</p></a></div>
      </div>

      <div class="menuDiv"></div>

      <div id="myCountry">
          <h1>나에게 맞는 나라 찾기</h1>
          <div id="selectCountry">
              <table width="800px" height="1000px" id="countryTable" align="center">
                  <tr>
                      <td colspan="2" id="td1">1. 언어</td>
                      <!-- <td></td> -->
                  </tr>
                  <tr id="selectSection">
                      <td>
                          <img src="<%=request.getContextPath()%>/images/영어권.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText" id="select1" value="영어">
                              <label id="selectLabel" for="select1">영어</label>
                          </div>
                      </td>
                      <td>
                          <img src="<%=request.getContextPath()%>/images/비영어권.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText" id="select2" value="비영어">
                              <label id="selectLabel" for="select2">비영어</label>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" id="td1">2. 좋아하는 여행지</td>
                      <!-- <td></td> -->
                  </tr>
                  <tr id="selectSection">
                      <td>
                          <img src="<%=request.getContextPath()%>/images/대륙.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText1" id="select3" value="대륙">
                              <label id="selectLabel" for="select3">대륙</label>
                          </div>
                      </td>
                      <td>
                          <img src="<%=request.getContextPath()%>/images/섬.jpg" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText1" id="select4" value="섬">
                              <label id="selectLabel" for="select4">섬</label>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" id="td1">3. 좋아하는 날씨</td>
                      <!-- <td></td> -->
                  </tr>
                  <tr id="selectSection">
                      <td>
                          <img src="<%=request.getContextPath()%>/images/온난.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText2" id="select5" value="온난">
                              <label id="selectLabel" for="select5">온난</label>
                          </div>
                      </td>
                      <td>
                          <img src="<%=request.getContextPath()%>/images/한랭.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText2" id="select6" value="한랭">
                              <label id="selectLabel" for="select6">한랭</label>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" id="td1">4. 자신의 성향</td>
                      <!-- <td></td> -->
                  </tr>
                  <tr id="selectSection">
                      <td>
                          <img src="<%=request.getContextPath()%>/images/열정.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText3" id="select7" value="열정">
                              <label id="selectLabel" for="select7">열정</label>
                          </div>
                      </td>
                      <td>
                          <img src="<%=request.getContextPath()%>/images/온순.JPG" alt="" width="400" height="400">
                          <div>
                              <input type="radio" class="selectRadio" name="selectText3" id="select8" value="온순">
                              <label id="selectLabel" for="select8">온순</label>
                          </div>
                      </td>
                  </tr>
              
              </table>
          </div>
	       <div id="myCountryResultBtn">
	           <button class="customBtn btnStyle" id="myCountrysubmitBtn" onclick="myCountryResult();">결과보러가기!!</button>
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

            if(scrollTop<=2500){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                $(".sidemenu").stop().animate({
                    "top" : newPosition
                }, 500);}
        }).scroll();
    });

     const myCountryResult=()=>{
         const radioValue=document.querySelectorAll(".selectRadio");
         let text="";
         let count=0;

         for(let i=0;i<radioValue.length;i++){
             if(radioValue[i].checked){
                 text+=radioValue[i].name+"="+radioValue[i].value;
                  if(count<3){
                     text+="&";
                  }
                 count++;
             }
         }
        console.log(count);
        console.log(text);
        if(count<4){
            alert("모든 값을 선택해주세요!");
        }else{
            location.assign("<%=request.getContextPath()%>/mycountry/myCountryResult.do?"+text);
        } 
    }
     // selectText=영어&selectText1=대륙&selectText2=한랭selectText3=온순

     //  기본 위치(top)값
     $(document).ready(function() {
         // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
         var floatPosition = parseInt($("#sideMenu").css('top'));
         // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

         $(window).scroll(function() {
             // 현재 스크롤 위치를 가져온다.
             var scrollTop = $(window).scrollTop();
             var newPosition = scrollTop + floatPosition + "px";
             /* 애니메이션 없이 바로 따라감
             $("#floatMenu").css('top', newPosition);
             */
             $("#sideMenu").stop().animate({
                 "top" : newPosition
             }, 500);
         }).scroll();
     });
</script> 


<%@include file="/views/common/footer.jsp" %>