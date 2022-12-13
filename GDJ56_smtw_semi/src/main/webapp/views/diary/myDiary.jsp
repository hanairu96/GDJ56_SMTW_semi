<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myDiary.css"/>

<section>
	<div class="sector">
            <div class="sidemenu">
                <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>참여하기</p></a></div>
             	<div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>나의 출국일지</p></a></div>
             	<div><a href="<%=request.getContextPath()%>/mycountry/myCountry.do"><p>나에게 맞는 나라찾기</p></a></div>
            </div>

            <div class="menuDiv"></div>

            <div id="leavingDiary">
                <h1>나의 출국일지</h1>
                <div class ="leavingInfo">
                    <div class="speech-bubble"><p id="speechText">안녕</p></div>
                </div>
                <div class="leavingService">
                    <div class="dday">
                        <h2>D-50</h2>
                        <!-- <i id="plane" class="bi bi-airplane-fill"></i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-airplane-fill" viewBox="0 0 16 16">
                            <path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Z"/>
                          </svg> -->
                          <img src="<%=request.getContextPath()%>/images/plane.jpg" id="plane" alt="" width="80" height="80">
                    </div>
                    <!-- <div class="leavingAlarm">
                        <input type="checkbox" id="alarm" value="alarm">출국 10일전 알람서비스
                    </div> -->
                </div>
                <div id="progressBar">
                    <p id="progressText">출국일 <button class="customBtn btnStyle" id="updateBtn" onclick=" location.assign('<%=request.getContextPath()%>/diary/firstDiary.do?');">수정</button></p>
                    <progress id="progress" value="0" max="100" width="500"></progress>
                </div>
                <div id="leavingCheckList">
                    <div id="leavingCLTitle">
                        <p id="title1">출국 전 체크리스트</p>
                        <p id="title2">진행도 :  </p><p id="title3"></p><p> %</p>
                    </div>
                    <div id="leavingCLContent">
                        <table id="leavingCLTable" align="center">
                            <tr>
                                <td><input type="checkbox" class="checkList" value="여권">여권</td>
                                <td><input type="checkbox" class="checkList" value="증명사진여분">증명사진여분</td>
                                <td><input type="checkbox" class="checkList" value="비자증명서">비자증명서</td>
                                <td><input type="checkbox" class="checkList" value="비행기티켓">비행기티켓</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="환전">환전</td>
                                <td><input type="checkbox" class="checkList" value="워홀보험">워홀보험</td>
                                <td><input type="checkbox" class="checkList" value="멀티탭">멀티탭</td>
                                <td><input type="checkbox" class="checkList" value="비상약">비상약</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="이력서">이력서</td>
                                <td><input type="checkbox" class="checkList" value="건강검진">건강검진</td>
                                <td><input type="checkbox" class="checkList" value="핸드폰">핸드폰 해지 및 로밍</td>
                                <td><input type="checkbox" class="checkList" value="공인인증서">공인인증서갱신</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="유심칩">유심칩</td>
                                <td><input type="checkbox" class="checkList" value="의류">의류</td>
                                <td><input type="checkbox" class="checkList" value="카드">해외사용 가능 카드 개설</td>
                                <td><input type="checkbox" class="checkList" value="국제면허증">국제면허증</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="증명서">각종증명서<br>(토익,토플 등 필요시)</td>
                                <td><input type="checkbox" class="checkList" value="숙소">숙소예약</td>
                                <td><input type="checkbox" class="checkList" value="비상연락망">비상연락망</td>
                                <td><input type="checkbox" class="checkList" value="생필품">생필품</td>
                                <td colspan="5">
                                    <button class="customBtn btnStyle" id="leavingCLSave" onclick="checkListBtn();">저장</button></td>
                            </tr>
                        </table>
                    </div>
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

                if(scrollTop<=650){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                    $(".sidemenu").stop().animate({
                        "top" : newPosition
                    }, 500);}
            }).scroll();
        });

        let leavingDiaryArr=["여권 챙기셨나요?","항공권 예약은 하셨나요?","환전은 하셨나요?","비상약은 챙기셨나요?","숙소는 구하셨나요?",
                    "비자신청은 확인 했나요?","해외 보험은 들었나요?"];
        var countNum=0;
        var resultHtml="";

        $(function() {
            function randomText(){
                var newLeavingDiaryText =leavingDiaryArr;
                var diarylength = newLeavingDiaryText.length;		
                if(newLeavingDiaryText != null && newLeavingDiaryText.length > 0) {
                    if(countNum<7){
                        resultHtml=newLeavingDiaryText[countNum];
                    }else{
                        countNum=0;
                        resultHtml=newLeavingDiaryText[countNum];
                    }
                    console.log(countNum);
                    document.querySelector("#speechText").innerHTML=resultHtml;
                    countNum++;
                    
                }
                const target=document.getElementById("progress");
                if(target.value<100){
                    target.value+=(Number)(Math.random()*20);
                }else{
                    target.value=0;
                }
        }

        if(leavingDiaryArr.length>0){
            randomText();
		    var resultPrint = window.setInterval(randomText, 2000);
		}
    });        

     let count=0;
     const checkListBtn=()=>{
         const checkList=document.getElementsByClassName("checkList");
         for(let i=0;i<checkList.length;i++){
             if(checkList[i].checked==true){
                 count++;
             }
         }
         const title3=document.querySelector("#title3");
         var result=count*5;
         title3.innerHTML=result;
         count=0;
     }
 </script>
    
<%@include file="/views/common/footer.jsp" %>