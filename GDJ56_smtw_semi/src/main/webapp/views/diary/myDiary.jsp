<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.smtw.diary.model.vo.Diary,com.smtw.diary.model.vo.CheckList" %>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myDiary.css"/>

<%
	Diary diary=(Diary)request.getAttribute("diary");
	int ddayResult=(int)(request.getAttribute("diaryDday"));
	CheckList checklist=(CheckList)request.getAttribute("checklist");
%>
<section>
	<div class="sector">
            <div class="sidemenu">
                <div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>참여하기</p></a></div>
             	<div><a href="<%=request.getContextPath()%>/diary/firstDiary.do"><p>나의 출국일지</p></a></div>
             	<div><a href="<%=request.getContextPath()%>/mycountry/myCountry.do"><p>나에게 맞는 나라찾기</p></a></div>
            </div>

            <div class="menuDiv"></div>

            <div id="leavingDiary">
            	<div class="DiaryTitle">
	                <h1 id="memberName"><%=diary.getMemberId() %></h1><h1> 님의 출국일지
	                <%if(ddayResult<0){ %>
	                <button class="customdeleteBtn deletebtnStyle" id="deleteBtn" onclick="deleteBtn();">삭제</button>
	                <%} %>
	                </h1>
                </div>
                <div class ="leavingInfo">
                    <div class="speech-bubble"><p id="speechText">안녕</p></div>
                </div>
                <div class="leavingService">
                    <div class="dday">
                        	<h2>출국일 : <%=diary.getDDay()%></h2>
                        
                        <div class="dday2">
                        <%if(ddayResult==0){ %>
                      	 	<h2 id="ddayfont">D-DAY!!! 가즈아-!!</h2>
                      	<%}else if(ddayResult>0){ %>
                        	<h2 id="ddayfont">D-<%=ddayResult %></h2>
                        <%}else{ %>
                      	 	<h2 id="ddayfont">D+<%=Math.abs(ddayResult) %></h2>
                      	 <%} %>
                        	<img src="<%=request.getContextPath()%>/images/plane.jpg" id="plane" alt="" width="80" height="80">
                   		</div>
                    </div>
                </div>
                <div id="progressBar">
                    <p id="progressText">출국일 <button class="customBtn btnStyle" id="updateBtn" onclick=" location.assign('<%=request.getContextPath()%>/diary/updateDiary.do?memberId=<%=diary.getMemberId()%>');">수정</button></p>
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
                                <td><input type="checkbox" class="checkList" value="passport" <%=checklist.getPassport()=='Y'?"checked":""%>>여권</td>
                                <td><input type="checkbox" class="checkList" value="surplus" <%=checklist.getSurplus()=='Y'?"checked":""%>>증명사진여분</td>
                                <td><input type="checkbox" class="checkList" value="vCertificate" <%=checklist.getVCertificate()=='Y'?"checked":""%>>비자증명서</td>
                                <td><input type="checkbox" class="checkList" value="ticket" <%=checklist.getTicket()=='Y'?"checked":""%>>비행기티켓</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="doller" <%=checklist.getDoller()=='Y'?"checked":""%>>환전</td>
                                <td><input type="checkbox" class="checkList" value="insurance" <%=checklist.getInsurance()=='Y'?"checked":""%>>워홀보험</td>
                                <td><input type="checkbox" class="checkList" value="multitab" <%=checklist.getMultitab()=='Y'?"checked":""%>>멀티탭</td>
                                <td><input type="checkbox" class="checkList" value="em" <%=checklist.getEm()=='Y'?"checked":""%>>비상약</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="resume" <%=checklist.getResume()=='Y'?"checked":""%>>이력서</td>
                                <td><input type="checkbox" class="checkList" value="hCheckup" <%=checklist.getHCheckup()=='Y'?"checked":""%>>건강검진</td>
                                <td><input type="checkbox" class="checkList" value="roaming" <%=checklist.getRoaming()=='Y'?"checked":""%>>핸드폰 해지 및 로밍</td>
                                <td><input type="checkbox" class="checkList" value="aCertificate" <%=checklist.getACertificate()=='Y'?"checked":""%>>공인인증서갱신</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="sim" <%=checklist.getSim()=='Y'?"checked":""%>>유심칩</td>
                                <td><input type="checkbox" class="checkList" value="clothing" <%=checklist.getClothing()=='Y'?"checked":""%>>의류</td>
                                <td><input type="checkbox" class="checkList" value="creditCard" <%=checklist.getCreditCard()=='Y'?"checked":""%>>해외사용 가능 카드 개설</td>
                                <td><input type="checkbox" class="checkList" value="iLicense" <%=checklist.getILicense()=='Y'?"checked":""%>>국제면허증</td>
                                <!-- <td></td> -->
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="checkList" value="certificate" <%=checklist.getCertificate()=='Y'?"checked":""%>>각종증명서<br>(토익,토플 등 필요시)</td>
                                <td><input type="checkbox" class="checkList" value="reservation" <%=checklist.getReservation()=='Y'?"checked":""%>>숙소예약</td>
                                <td><input type="checkbox" class="checkList" value="eContact" <%=checklist.getEContact()=='Y'?"checked":""%>>비상연락망</td>
                                <td><input type="checkbox" class="checkList" value="dailyNecessity" <%=checklist.getDailyNecessity()=='Y'?"checked":""%>>생필품</td>
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
		 <%-- if(<%=ddayResult%><0){
			 $.ajax({
					url:"<%=request.getContextPath()%>/diary/deleteCheckList.do",
					type:"get",
					data:{
							memberId:<%=diary.getMemberId()%>
						 },
					success:data=>{
						alert(data);
					}
				}); 
		 } --%>
 
 
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
            function randomText(){ //말풍선 문구 무한반복 출력
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
                if(target.value<100){ //프로그래스바 무한반복
                    target.value+=(Number)(Math.random()*20);
                }else{
                    target.value=0;
                }
        }

        if(leavingDiaryArr.length>0){  //말풍선 문구 무한반복 출력
            randomText();
		    var resultPrint = window.setInterval(randomText, 2000);
		}
    });        

     let count=0; //진행도 계산할 변수
     let checkListCheck=[]; //체크리스트 체크된것들 저장할 배열
     const checkList=document.getElementsByClassName("checkList");
     
     for(let i=0;i<checkList.length;i++){
         if(checkList[i].checked==true){ 
             count++;
         }
     }
     const title3=document.querySelector("#title3");
     var countResult=count*5;
     title3.innerHTML=countResult;
     count=0;
     
     
     const checkListBtn=()=>{ //체크리스트 버튼 클릭시
         for(let i=0;i<checkList.length;i++){
             if(checkList[i].checked==true){ 
            	 count++;
                 checkListCheck.push(checkList[i].value);
             }
         }
     
         const title3=document.querySelector("#title3");
         var countResult=count*5;
         title3.innerHTML=countResult;
         count=0;
         console.log(checkListCheck);
         
         const set = new Set(checkListCheck);
         const newCheckList = [...set];
         
		 $.ajax({
			url:"<%=request.getContextPath()%>/diary/saveCheckList.do",
			type:"get",
			data:{
					checkList:JSON.stringify(newCheckList)	
				 },
			success:data=>{
				alert(data);
			}
		}); 
		 
		checkListCheck=[];
     }
     
     const deleteBtn=()=>{
    	 var deleteConfirm=confirm("복구 할 수 없습니다. 정말 삭제 하시겠습니까?");
         if(deleteConfirm==true){
        	 $.ajax({
     			url:"<%=request.getContextPath()%>/diary/deleteDiary.do",
     			type:"get",
     			data:{memberId:"<%=diary.getMemberId()%>"},
     			success:data=>{
     				alert(data);
     				location.replace("<%=request.getContextPath()%>/diary/firstDiary.do");
     			}
     		}); 
        	 
         }else{
        	 alert("삭제취소");
         }  
     }
   
     
     
 </script>
    
<%@include file="/views/common/footer.jsp" %>