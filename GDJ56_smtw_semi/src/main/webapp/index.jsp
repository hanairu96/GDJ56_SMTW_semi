<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member,java.util.List,com.smtw.notice.model.vo.Notice" %>
<%
	Member logInMember=(Member)session.getAttribute("logInMember");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Me The Way</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css"/>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<!-- 카카오 공유하기 버튼 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
	      integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>
	<script>Kakao.init('e746f3ea1bb3e8aa8d89a08b85a3f035'); // 사용하려는 앱의 JavaScript 키 입력</script>
</head>
<body>
<header>
        <div class="showme">
            <div class="logo">
                <a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/images/ShowMeTheWay45.jpg" alt=""></a>            
                <!--카카오톡 공유하기 아이콘 -->
                <a id="kakaotalk-sharing-btn" href="javascript:window.scrollTo(0.750);">
                    <img src="https://w7.pngwing.com/pngs/978/183/png-transparent-computer-icons-share-icon-share-button-monochrome-share-icon-icon-download.png"
                      alt="카카오톡 공유 보내기 버튼" />
                </a>
                <!-- 인스타그램 링크 로고 아이콘 -->
                <a href="https://www.instagram.com/" id="instarLogoAddress">
                    <img src="https://t1.daumcdn.net/cfile/tistory/99D8D7485D09F21432" alt="">
                </a>  
            </div>
        </div>
        <div class="bar">
        <div class="menuTotal">
            <ul class="menu">
                <li id="menuli">
                    <div class="hoversection">
                        <div class="holidayhover">
                            <a href="<%=request.getContextPath()%>/holiday/holiday.do"><img src="<%=request.getContextPath()%>/images/워킹홀리데이란.png" alt="" width="60px" height="60px" class="holiday1"></a>
                       		<a href="<%=request.getContextPath()%>/holiday/holiday.do"><img src="<%=request.getContextPath()%>/images/보라워킹홀리데이란.png" alt="" width="60px" height="60px" class="holiday2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/holiday/holiday.do">워킹홀리데이란?</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/holiday/holiday.do">워킹홀리데이란?</a></li>
                            <li><a href="<%=request.getContextPath()%>/holiday/holidayRoad.do">찾아오시는길</a></li>
                            <li><a href="<%=request.getContextPath()%>/holiday/holidaySMTW.do">Show me the way</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hovercountry">
                            <a href="<%=request.getContextPath()%>/country/countryMain.do"><img src="<%=request.getContextPath()%>/images/국가정보.png" alt="" width="60px" height="60px" class="country1"></a>
                        	 <a href="<%=request.getContextPath()%>/country/countryMain.do"><img src="<%=request.getContextPath()%>/images/보라국가정보.png" alt="" width="60px" height="60px" class="country2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/country/countryMain.do">국가정보</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="">국가 및 지역별 정보</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hoverdiary">
                            <a href="<%=request.getContextPath()%>/diary/firstDiary.do"><img src="<%=request.getContextPath()%>/images/참여하기.png" alt="" width="60px" height="60px" class="diary1"></a>
                        	<a href="<%=request.getContextPath()%>/diary/firstDiary.do"><img src="<%=request.getContextPath()%>/images/보라참여하기.png" alt="" width="60px" height="60px" class="diary2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/diary/firstDiary.do">참여하기</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                             <li><a href="<%=request.getContextPath() %>/diary/firstDiary.do">나의 출국일지</a></li>																	
                             <li><a href="<%=request.getContextPath() %>/mycountry/myCountry.do">나에게 맞는 나라찾기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hoverfirends">
                            <a href="<%=request.getContextPath()%>/friends/friendsList.do"><img src="<%=request.getContextPath()%>/images/커뮤니티.png" alt="" width="60px" height="60px" class="friends1"></a>
                        	<a href="<%=request.getContextPath()%>/friends/friendsList.do"><img src="<%=request.getContextPath()%>/images/보라커뮤니티.png" alt="" width="60px" height="60px" class="friends2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/friends/friendsList.do">커뮤니티</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/friends/friendsList.do">워홀 프렌즈 구하기</a></li>
                            <li><a href="<%=request.getContextPath()%>/community/reviewBasic.do">생생후기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <div class="hovernotice">
                            <a href="<%=request.getContextPath()%>/notice/noticeList.do"><img src="<%=request.getContextPath()%>/images/게시판.png" alt="" width="60px" height="60px" class="notice1"></a>
                        	<a href="<%=request.getContextPath()%>/notice/noticeList.do"><img src="<%=request.getContextPath()%>/images/보라게시판.png" alt="" width="60px" height="60px" class="notice2"></a>
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>/notice/noticeList.do">게시판</a>
                        </div>
                    </div>
                    <!-- 서브메뉴영역 -->
                    <div class="sub">
                        <ul class="submenu">
                            <li><a href="<%=request.getContextPath()%>/notice/noticeList.do">공지사항</a></li>
                            <li><a href="<%=request.getContextPath()%>/qna/qnaList.do">질문하기</a></li>
                        </ul>
                    </div>
                </li>
                <li id="menuli">
                    <div class="hoversection">
                        <!-- 로그인 유무에 따라 메뉴 다르게 보임 -->
                        <%if(logInMember==null){ %>
                        <div class="hoverlogIn">
                            <a href="<%=request.getContextPath()%>/logIn/logIn.do"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
                        	<a href="<%=request.getContextPath()%>/logIn/logIn.do"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
                        </div>
                        	<div>
                            	<a href="<%=request.getContextPath()%>/logIn/logIn.do">로그인</a>
                        	</div>
                        </div>
                        <%}else{ %>
                        	<%if(logInMember.getMemberId().equals("ADMIN")) {%>
		                        <div class="hoverlogIn">
		                       		<a href="<%=request.getContextPath()%>/admin/memberList.do"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
		                        	<a href="<%=request.getContextPath()%>/admin/memberList.do"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
                        	    </div>
		                        <div> 
		                         	<a href="<%=request.getContextPath()%>/admin/memberList.do">관리자페이지</a>
		                        </div>
                        	<%}else{%>
		                        <div class="hoverlogIn">
		                         	<a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>"><img src="<%=request.getContextPath()%>/images/로그인.png" alt="" width="60px" height="60px" class="logIn1"></a>
		                        	<a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>"><img src="<%=request.getContextPath()%>/images/보라로그인.png" alt="" width="60px" height="60px" class="logIn2"></a>
		                        </div>
		                        <div> 
		                            <a href="<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>">마이페이지</a>
		                        </div>
                        	<%} %>
	                    </div>
	                    <!-- 서브메뉴영역 -->
	                    <div class="sub">
	                        <ul class="submenu">
	                            <li><a href="">쪽지함</a></li>
	                            <li><a href="<%=request.getContextPath()%>/logIn/logOut.do">로그아웃</a></li>
	                        </ul>
	                    </div>
                        <%} %>
                </li>
            </ul>
        </div>
    </div>
    <!-- 배너 -->
        <div id="banner" style="top: 350px;">
            <a onclick="insurance();"><div id="insurance" style="background-color: rgb(224, 185, 247);">
                <h5 class="txt-label">INSURANCE</h5>
                <span class="txt-label" style="font-size: 11px">여행자(워홀) 보험</span>
            </div></a>
            
            <a onclick="mobile();"><div id="mobile" style="background-color: rgb(247, 236, 186);">
                <h5 class="txt-label">MOBILE</h5>
                <span class="txt-label" style="font-size: 11px;">여행자 유심칩 공동구매</span>
            </div></a>
            
             <a href="<%=request.getContextPath() %>/diary/firstDiary.do"><div id="myfly" style="background-color: rgb(181, 247, 211);">
                <h5 class="txt-label">나의 출국일지</h5>
            </div></a>
        </div>
    </header>
    
    <script>
        // 기본 위치(top)값
        $(document).ready(function() {
            // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
            var floatPosition = parseInt($("#banner").css('top'));
            // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

            $(window).scroll(function() {
                // 현재 스크롤 위치를 가져온다.
                var scrollTop = $(window).scrollTop();
                var newPosition = scrollTop + floatPosition + "px";
                /* 애니메이션 없이 바로 따라감
                $("#floatMenu").css('top', newPosition);
                */
                $("#banner").stop().animate({
                    "top" : newPosition
                }, 500);
            }).scroll();
        });
        
        const insurance=()=>{ //배너 연결
        	open("https://b2b.travelover.co.kr/insu/18572/b97e9f8e-925d-4ef7-89f7-afe6b54e92ac","_blank","width=500 height=500");
        }
        
        const mobile=()=>{ //배너 연결
        	open("https://www.usimstore.com/shop/","_blank","width=500 height=500");
        }
        
       //팝업창 로직
       //쿠키가 있는지 찾음(보지않음 체크시)
        function getCookie( name ){
			var nameOfCookie = name + "=";
			var x = 0;
			while ( x <= document.cookie.length )
			{
					var y = (x+nameOfCookie.length);
					if ( document.cookie.substring( x, y ) == nameOfCookie ) {
							if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
									endOfCookie = document.cookie.length;
							return unescape( document.cookie.substring( y, endOfCookie ) );
					}
					x = document.cookie.indexOf( " ", x ) + 1;
					if ( x == 0 )
							break;
			}
			return "";
		}
       
     	// 팝업창에서 만들어진 쿠키 popclose의 값이 done이 아니면(즉, 체크하지 않으면,) 
    	// 팝업창을 띄웁니다
		
        if ( getCookie("popclose") !="done") {
			popUpWindow=window.open("<%=request.getContextPath()%>/main/popup.do","_blank","resizable=no,width=320,height=350,top=200,left=250");
			popUpWindow.opener = self;
		}
       
        
        //-->
    </script>
    <div id="wrap">
        <section>
            <div class="container">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" onclick="location.assign('<%=request.getContextPath()%>/logIn/enrollAgree.do')">
                           <!--  <div class="textcontainer">
                                <h3>회원가입</h3>
                            </div> -->
                            <img src="images/회원가입사진.jpg" class="d-block w-100" alt="...">
                        
                        </div>
                        <div class="carousel-item" onclick="location.assign('<%=request.getContextPath()%>/holiday/holiday.do')">
                          <!--   <div class="textcontainer">
                                <h3>워킹홀리데이란</h3>
                            </div>  -->
                            <img src="https://img.freepik.com/premium-vector/illustration-map-of-the-world-with-flags-of-all-countries_37674-7.jpg?w=1380" class="d-block w-100" alt="...">
                        
                        </div>
                        <div class="carousel-item" onclick="location.assign('<%=request.getContextPath()%>/country/countryMain.do')">
                           <!--  <div class="textcontainer">
                                <h3>국가정보</h3>
                            </div> -->
                            <img src="https://img.freepik.com/free-vector/global-travelling-abstract-concept-vector-illustration-global-insurance-world-trip-international-tourism-travel-agency-working-holiday-luxury-vacation-resort-chain-abstract-metaphor_335657-2953.jpg?w=826&t=st=1668756054~exp=1668756654~hmac=e2c0a85010a8ffb2c9d72fbe22c4eec5b55e28218e7bd4547aac02a7bf66e63c" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item" onclick="location.assign('<%=request.getContextPath()%>/friends/friendsList.do')">
                            <!-- <div class="textcontainer">
                                <h3>워홀프렌즈찾기</h3>
                            </div> -->
                            <img src="https://post-phinf.pstatic.net/MjAyMDA3MjFfMTY1/MDAxNTk1MzIxODI2NTA2.5wzgcsDonhkKgJa43_pny5_f9mDAsAboVqoxT18P6BMg.oAYho8D61Kx2Tx8-5n_14DzOVTU_dy95xwNH9DEJDHYg.JPEG/tid354t000040.jpg?type=w1200" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
           
        </section>
        <!-- 공지사항/자료실 -->
        <section>
            <div class="container2">
                <div class="notice">
                    <h5 style="margin: 10px;"><b>공지사항</b></h5>
                    <ul id="noticeListUl" style="font-size: 14px">
<!--                         <li><a href="">워홀러들 자주 하는 질문</a></li> -->

                    </ul>
                </div>
                <script>
                	$(()=>{
                		//공지사항
                		$.ajax({
                			url:"<%=request.getContextPath()%>/main/mainNoticeList.do",
                			success:data=>{
                				if(data!=null){
                					console.log(data);
                					console.log(data[0].noticeNo);
                					const ul=$("#noticeListUl");
                					
                					for(let i=0;i<data.length;i++){
                						
	                					const li=$("<li>");
	                					const a=$("<a href='<%=request.getContextPath()%>/notice/noticeView.do?noticeNo=<%=12%>'>").text(data[i].noticeTitle);
                						li.append(a);/* li태그에 a태그 넣기 */
                					ul.append(li); 
                					}
                				}else{
                					const ul=$("#noticeListUl");
                					const li=$("<li>");
                					const a=$("<a>").text("데이터가 없습니다.");
                					
                					li.append(a); /* li태그에 a태그 넣기 */
                					ul.append(li);
                				}
                			}
                		});
                		//질문하기 
                		$.ajax({
                			url:"<%=request.getContextPath()%>/main/mainQnaList.do",
                			success:data=>{
                				if(data!=null){
                					const ul=$("#qnaListUl");
                					
                					for(i=0;i<data.length;i++){
	                					const li=$("<li>");
	                					const a=$("<a href='<%=request.getContextPath()%>/qna/qnaList.do'>").text(data[i].reviewTitle);
                						li.append(a);/* li태그에 a태그 넣기 */
                					ul.append(li); 
                					}
                				}else{
                					const ul=$("#qnaListUl");
                					const li=$("<li>");
                					const a=$("<a>").text("데이터가 없습니다.");
                					
                					li.append(a); /* li태그에 a태그 넣기 */
                					ul.append(li);
                				}
                			}
                		});
                		
                	});
                </script>
                
                <div class="notice">
                    <h5 style="margin: 10px;"><b>질문하기</b></h5>
                    <ul id="qnaListUl" style="font-size: 14px">
                    
                    </ul>
                </div>
            </div>
        </section>
        <!-- 베스트후기 영역 -->
        <section id="reviewWrap">
            <div id="reviewContainer">
                <div id="reviewTextContainer">
                        베스트후기
                </div>
                <div id="reviewImageContainer">
                    <div class="reviewImage">
                        <div class="profileImageContainer">
                            <img src="data:image/png;base64,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" alt="" width="40px" height="40px">
                        </div>
                        <div>
                            <img src="https://cdn.imweb.me/upload/S20200412578d219059cbb/f5d2607a642d7.jpg" alt="" width="200px" height="300px">
                        </div>
                    </div>
                    <div class="reviewImage">
                        <div class="profileImageContainer">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAilBMVEX///8AAADIyMjX19eampp+fn78/PwEBAT4+Pju7u7z8/Po6Oj5+fnU1NTi4uLr6+tJSUmxsbGDg4Nubm6JiYm5ubmioqI5OTlaWlo0NDRDQ0MgICDAwMAoKCjc3NycnJxWVlZgYGBxcXEUFBSsrKwsLCyRkZESEhJOTk42NjZ4eHhGRkZnZ2cbGxuZlGCJAAAKQ0lEQVR4nO1diXbiOgxNAjhhp+wtlLIUylD4/997ScCyAqQEY8l55/iemW6A5etFlmVZ8TxPXOBlv6Tf41c9cfknPHih2JvlL14C0Wh2Fu1KpdLp1C9/EdolF36zx4J68N2ffvoIP9tV/7vS4BFPjPqo9u7n4aMf/I9ZJmNlUf3IZSexH3c8j204GUV3PHlIL0y/9r4j25V9Ekl/tAcP6QHDGLWO7UoXRzrc5o9H5zWWbds1L4qYYfB4eF73ZdKZ+/8Dx0RhVJZ4+F1+DO8zwyTj/4OmbQIPIbxGLY/C58dycOgP+7XB8mOW96Yd3yqtifnpTn+FveGo3cAVb9Urb8PbuRp/ctL2ysxQHNCIDM8/THbtvLWgEfS3ahrKj+688nJcfKIOTH/YVh+tAovd5rrXf7sstdXA9/WgGyTKUfzVI+lLwTQzUmO6AVONn0CiHbCKSTqlXy/88c4aD9UYXyUcqa1MR8RGSvGhlnDpXJlANbqaaiL6yEym6eI5Yzp+azurWldl6sO4Lt1/eICGI61yxhmVsywTRa++xc1/1NrzxYSaPaxvykNReNEEN/6b3m4v/UhVqqnky950TbXR+kUduF28VFaAR+qxFAo1rsMKEdw3XqxVE3weMdOhoUq+BOENUZXW3ssLWbREDfZtpI4v4g1VqG+iQHFEi38Jtowd4wQ976iM95NlX1xcm/dLbeJm75tRDJeZfdGoKxNFvlKZvhxRoT8wWPCv0qhjuwo1UAbz3lxFhNf4lEPD9+15NmJGLWnLGJ8waHrv7XWi8HaqHhXD9RipovWsXCNoKgNkbHhDl8xwiY0tj7iItbpUo1OC8tWBzo6g9EJYqIFE4VmpKGVT3FtgFtK8CpPtBAF2UL6NHX+yKYce7BHJ2ICEphV1CrYVkfEokD41Yg8+C7VimTRmEOJug511aMM8Vdqc7uhvDjK++Zf9xoa4C1OA/+2dUEgO1Bx5zW3xUEoobSZugAOY1F8kpAUe65oWpaBb1KELKa1G4X1JMRtCMXclg+/ih9Zo7EJLcvszYDGsESs58Esx+91ayFVEyxCO7Ji16cViC/0ZtSQ1TDnPTcXZ+54wXJOvxOBQnxMLygLWCvr9N/gReCciTEN6N1EgRS3JRSE0pdQtvbXYkhMi5FzyoV2PDMI++MaLwliuhhwelINkyBmhATsnDv0GhtuYQZjESgrlsPjncsBwKlOIruRYhaXPjXQjeg25WGw4Nt5g1SwZhElImRMOYUJK++CQdoGU+csq7R+LtBQR77iR0j75nFENKZPiuOIWctbP+IwaWwz5zqCYGfr8fdiSMnnisqQ0BjP/RiaP/mZdm65kbjmEgebmWZvOgOsSHHMfjoB4Zv0ZEAfKsWWDc8oDgzAJCMrmcNO+cW5GJcA7RHO8jYFiH+mFKYBPn+OAfaWOn/iWi4pkuCQXJZRfj/McGIwahtNn8OvxuvUv0Twhg6oZSVEcfj2FgxT7RS5qLUVxOqJQHAhRKA2SNeMbLhgwOcjXfBWXxByMsZUqnDqaHlZD7nBoWPOJh6mAdBqc630yEWFFJIwXShBAlDX3xVLVtrSe6KMU88seFAXzw6f0LSiNxn97Rg5TquDSM1Q7RvyBbT3JkHCjX4dm5DyzkHiTwgk7UXWhjftP0UwuiZ9UM1GFlnEeWUigkDO/SiRhDZGJvJEmEnILRXZxpw0EJ5aygahYepKNjZhA+Xa6ELm+k8Ah841ctToLz0CJMMzf+aioK0eBvRwS6pb6r+lKROqKP+/mPgvYvIXGzdMj5fh4Apd8Jon9bzaGT01C3x/YvEQaoaxe5mJp8W2ZdAo0uMPYFepwghEmO0VTFIMMwdB/t3ZTtnNS1Qj9jal6VK4I+v7JXOs9hY6fxckMRWXLIFih2PGvqxKacGmg++G4G7kTKybZZDb+bT2CVxJ1ph8cyaJwhrMYP03mdV+orDuZFn/lklnSNkOU781PEmhC4VvmG3qtXk4yxJq+YhdeNMWlBl4mcUqPccmIG3ug7iH7X2NMcbLQHk7tGSJ0tiHQlf/EfOMapyjXQJjG7iITJDxnW3u6KgJf2jw7R9IyxmhCMp5zq8udCcGW8Ma4bv5EJ3Y4mGXG/TxtJeGpoo2bhn+giYReXBiJYwqpnEMzTdddqLT0bZ1VdjqjsPUqKplnzRBwQSBNSnPB9TI2LLwliAl2Dll+p8yZ/VCp13eeqYgU3EDNuA5K2pZyrRU1cRbrLD//F699IjklhTQ/LOHsyC7+xQ0aHa+tkdU8VfA5w/WcFbPxts+wC+9FeKhUdRy3LiKVP/7n6kBofLNGhofgr1WsMRpcWCGMbkdiXdlPn/SRZn1VoeyWMJlP2SzQ5zdOx5V7LBvtarb3zph2vRuGQnltGJJkVFT174UpqLyAGbwfd6Ng0ex26/Vupx1871a3yZLTEZ53RDDG7UqLHoha3r6YdOPxpuq5uGmJQz1XVU7hM8Rxpm+qcnmnssHHbeXvmLDhzW/TvwyFeghqjDTuJDpBjd7yV6bRP/9arT7uzN4Dt+hIlUi5y9jhMZpTn+TPTyfWn6ZZlfMZogyUpItiSw2uzgPrYpGbnD3beelmd1jEOGjCZ/xXM2zmAcV6FjHzxWh6lxXml2AQFKyuOs8jy3MAMYn+LCokoj4/bG94YUz6QfQg57dCS5VFFXuiztOeONnujvr70x1ys/1u/qTDXm3aiGZiBLbTs7GeUbM9qg7X02Wv19uvBv3qqK2V3Ar0F1FgK8SUG9qJPv+kB2n0U8ViQgt+khRfBBM1igh0jfJF/7HYk0KoiGGSXdQBnLMWj7tmkiFBDFHjR46QqsW0sMovZf7gVJ3p2cwKq6KIzIdirWTRnDesbnEkq4ayZyzmhPXwqm96mELJP3ZTbLcgeN9sSwuvJjXp2mjBz0NGRxi+rSc80KS2H3Oj7ieYLRdOtK0k2sRogRlvNrMKRHhZTgPvoWx4Zm1Tmfe5BA9kgA2A2cYG9yZlMs9igAlzMlkqnKexpKT5GwJa26RxBacxdg2aM8C6MhlZC04ga/nREeBM3eTtxzVFs+kCzCuTxgfkZyzDM19BKZgMj4ZV1vZ6nwAyZfwQlPmvFA+Zmphvb1iC7Fs0CUCZmlucA660wcUARyLmdgHgwaC5APQsIAWuuXsekAiD9zZuHqA65oxk8HCVYTlEC+KXsT6EQD3b298zwIY0Z2HBuWE5nrgM23xzR1A1xbAMAIbmYmuAIf9DGO6h4hg+D8eQGY6hBhxDZjiGGnAMmeEYasAxZIZjqAHHkBmOoQYcQ2Y4hhpwDJnhGGrAMWSGY6gBx5AZjqEGHENmOIYacAyZ4RhqwDFkhmOoAceQGY6hBhxDZjiGGnAMmeEYasAxZIZjqAHHkBmOoQYcQ2Y4hhpwDJnhGGrAMWSGY6gBx5AZlAztZ6dJsCBkWPuq2sdXn5BhyeAYOoaY4RMJ1hlhiiHO410uDIke11ceGEzxcO9ZG/axN0cwfYZM6XA0+0CWTlA2PHp2gcR/o8dzSeg47YwAAAAASUVORK5CYII=" alt="" width="40px" height="40px">
                        </div>
                        <div>
                            <img src="https://cdn.imweb.me/upload/S20200412578d219059cbb/f5d2607a642d7.jpg" alt="" width="200px" height="300px">
                        </div>
                    </div>
                    <div class="reviewImage">
                        <div class="profileImageContainer">
                            <img src="data:image/png;base64,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" alt="" width="40px" height="40px">
                        </div>
                        <div>
                            <img src="https://cdn.imweb.me/upload/S20200412578d219059cbb/f5d2607a642d7.jpg" alt="" width="200px" height="300px">
                        </div>
                    </div>
                    <div class="reviewImage">
                        <div class="profileImageContainer">
                            <img src="data:image/png;base64,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" alt="" width="40px" height="40px">
                        </div>
                        <div>
                            <img src="https://cdn.imweb.me/upload/S20200412578d219059cbb/f5d2607a642d7.jpg" alt="" width="200px" height="300px">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 하단 로고 영역 -->
        <section>
            <div id="mainlogo">
                <img src="images/logo.png" alt="" width="1350" height="230px">
            </div>
        </section>

        <!-- 하단 주소 -->
        <footer>
            <p>
                <span id="footmain">SHOW ME THE WAY</span><br>
                <span id="foot">상호명 : SHOW ME THE WAY</span><br>
                <span id="foot">전화: 02-2108-5900</span><br>
                <span id="foot">운영시간 항시대기 언제든 전화주세요</span><br>
                <span id="foot">본관 : (08505) 서울특별시 금천구 가산디지털2로 115 (가산동. 대륭테크노타운3차) 811호</span>
            </p>
        </footer>
    </div>
    
    <script>
    $(".carousel-item").mouseenter(e=>{
        $("h3").show(300);
    });
    $(".carousel-item").mouseleave(e=>{
        $("h3").hide();
    });
  </script>
  
  <!-- 카카오톡 공유하기 아이콘 스크립트 구문 -->
    <script>
        Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: 'Show Me The Way',
      description: '워키홀리데이,일탈, 여행',
      //처음 이미지 워킹 홀리데이 사진으로 로고로 수정하기
      imageUrl:
        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBQOFBcOExAPGBcQEBEdGhAQERAaHBAdGxkYIxwcFxwcISwjISEoIxwcJTUlKC0vMjIyGiI4PTgxPCwxMi8BCwsLDw4PHBERGzEiIyMxLzEvMzExMS8xMTExMzExMS8xMTExMTExMTExMTExMTEyMi8xLzExMS8xMTwxMTExMf/AABEIAOoA2AMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABAUDBgcCAQj/xABBEAACAQIEBAMFBAkDAwUBAAABAgMAEQQSITEFE0FRImFxBjJSgZEHI0KhFGJygpKxwdHwM+HxJEOiU3OywsMV/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAECAwQFBv/EACoRAAICAQQCAQMDBQAAAAAAAAABAhEDEiExQQRRYRMicQWBsRSRocHw/9oADAMBAAIRAxEAPwDs1KUoBSlRIsWkjyRKbtDlDjK2hYXAvax0IOnegJdKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFKUoCJjonkQpHK0bHLaRVRitiCdGBGoBG3WtY4XipYYxjfu3jmKZ+bpI7SN4WDqAoUGQAjJoFPbXbZFDAqdiCD00PnVbNwlWjihViqRSZiCL8wWcMp2tfOTfoQNKA+rxdFvzUeKyZ/vRYZdAde4uNPP1tKwePjxC8yKVHX4lPfaoXHopiqcnMQsl5ER8jOmVtFaxt4spsBra1UeKwzQoXMT3kkDESvbO6xzlQXfQHSNcxsMx03oDdaxswFrnfQeZrUGxs0AXNK+aazu2R3yKSbCNDfLpnbbRIlFszFq94bFvjZ4kcXWF3kBaNkL/8ApSZTt7kq386A26sRkF8txc6gX1sOtqTKxtla3fS9QYMKcxJLizqT+uQu9+ouT5eV6q27pItGKabbLS9fL1EbBqWZ7yXdbEcyW1vJc1gdNwL0OCXwjx+A3H3kve+uvi22N6bkUvZLvSon6J72V5FL/izlsuv4Q9wPS1qLHICv3ilQLNnTxMe4ZSAOmmWlv0KXTJlKgDGZFzSry/Ha5YFdt8w2HS7W1+VTxUpphqj7SlKkgUpSgFKUoBSlKAUpSgFKUoBSlKAUpSgFeSL716pQEHHcOjxICyJe2x6j/LD6CsOC4WkMhkU6ZFRU+EDpe+o00HS7d7C0pQClKUApSlAea8PIFtcgXNhc2uewr2a5Z9pXDIeKSROmMCnDZ1coM4TMQejAB9NrjpVZSSVstCEpukjqZqC8LRZnjF2YgmN3Nj3y9FJ+mnzrHwzi0OJukcqu0YGZfxL08Q71ZU2khTi6ZjilV75SDZiDboRuD51lqHNEVYOgQFmGe41dQLbjW4vcelutxnilV1DqQQwBBGxB2NSn0yGu0ZqUpUkClKUApSlAKUpQClKUApSlAKUpQCvDC4r3SgKrh3F4sS0kSODJh5CskYzeBgSN7ajS/lcXtVpWn8VwycNxS8TQNkxDcuYXJC5rEOB01W5A3Pm1bajXFxsdqCjJSlKAUpXygNf9qMY0apGhILk3K72FtPmSK1/CcFiEjShM0iKucczJGhI2IUElrNva2vQ1M9rsekUilz4YUQtbfxPa3roPrUnhuWSJZB/3YlZ/DYvm1N+u7N9a4sjuTf4R6EXpxRitm92V0eEXAMkkcYjXNmyo7sGGzC7AG9ht29K3q1alx08vDPJa4iiZlX9jUi/mLj51f8GxPOhjk+KNb+oFj+daYG9/kwzvUl8bft0TzUKEGNzHZAh1W2hzEksLdfiuO57VOqJjUuucLmZPEq3y3YAgC/S9yPnW7OdPol0oKwyuVKgC+Y6+Q6mrEMz0pSgFK85h3FfFYHY3oD3SlKAUpSgFKUoBSlKA8ilVnGuMw8PRZZ3Kq7hQQpbUgnYa20NZOHcVgxS54Z4pB1yOpI9RuPnU6XV1sRaujLxHCLiI3hf3ZFIPl2PqDY/KqL2S4ixz4GQEPhtAzXGZQbDQ66W+lq2itX9okMDpjU0K6NbqNL+ug2sToe1Ue25db7G00qJg8SsyB1PqNNDvr23B+dS6sVPNR8XiFhVpGNgov/sPM1IrFKqkWaxHW9rfnUO62JVXvwcp9qnaeOSU781CfQW0+QP5VGX2laOMQrI8XIwsSx5Ap5sg5dzJfTLlDWG3ztXRsTwvDOcpy5SjholvlYtls1hpcBSL261r0/BUjZgAlgVAbkre2gXbytWCxyjGmr3s68mXFlap6dq4s0zEe0Ek0TI7yGR31lUooeMpYxlFFtwDt3rp/sRIXwqvawY3C72BVevretc//k8xyiQYaQoqErijy1s+cAiyPmsUJscvTWtw4IxCGFljDQFFPLN1e8aNmXwjfMRt0NaRTbTar9zCbhFOMZXddUXFK+V9rQyPFVsWLLudBbxDN8Kqd/nWfGzCNDvdtAF3/wAHetS9pZo0w7K/OCu2UrCVvcjQOdgDbrp0o3UWyIRc8kYLtm34nFLChkchVQEl20AArFg8WmJQSxvmU3sy6A9/Py+VaHiHxfEMDDyiHCrkli8GdmVgFYFhbs24toamex3AMRExxM5dcqZUizKwYEXzaEge8wA3uWvvrkpttJLY9J+HCGJynJKSdUaVxLGySSSZ5pXHNeyvI5FsxsLE22rrXsnBy8HAtrfcqT6sLn8zXFme4LfErGu78KW0MY7RIP8AxFY+PvJs9L9aioYscYqkTqUpXWfOClKUApSlAKUpQHLPtcxN3gw3QJLIfUkKv8n+tc8ikaNg6OVYbOhZWX0I1Fbl9qrXxyjtg4rfxzVpbmwJr2fGjWFI4sj+9nbfYKTESYNJp5ndpXcrzALqgOVRcAE3sWub+9Vtxe5hkAXxqt1GpDN0GmtjsRvYmvfBcMIcPFEP+3DEv0UVqn2l8RKJHhgbc1izfspaw+bEH92vGzSS1M9LxcLzTjBPnsrOH8QkwB5h5xii/wBRYs5yoDoMpuEUHMLnKet7G9dAw/EY5Y1lRgyuLqR18rdCDoQdq0r2UxXIMsOIygSwpIwcrYkqM176ahgTfyqow+JbBzOuHlP6Pzc3JYdOouwuvUX0Ngu9qxjkSqy+TDLU0uu+jo82MZvd8I/OozMTqTf9qqU+0MbxiWO759swZctu9/6XrNguMJJZG8LM1h8Plr3NdkUqtHlzcrqRNxM+QBQMzvoqbZu+vQCouNJzC41ypdV75ATa/pX3E4yNHDmXVc6lLMRoddALg3Frn+t6xSS8xklHuuqkfuh1P8hUT4LYeWVOM4jkkZUAZZYcjtvlIJI69mbvWPhHEWhmeR5JCjxIosW95c4ubnQAFdfI1r/A8cXacOA7xYqUDPeyqWNtBvqCBfTTarNpieifKOIfyFefLypJ06/se7j/AE3HJalbv5NwPtJy3ETRufFZi1gU7bXuP6d6tYuKxyR81TfW2S4JzdtPTfa2taLN94iS/uN+qUAy69QVIt+yRra9Y4JmjYOhsf8AND3Fd8FGcVJHi5XLFOUH0bbNiGkbxGzdEbLbX4CP6322qTDw+PEQPE63WW4IO9htY+R1B71UYSVcSL+6+7puG2Fx8hbyvWz4HDiJAt2118RvbyqJramRhclPUuV2Unsp7PPw8SBpg4ke4UJbLbS9ydyMt9OlbDydLZjb0X+1Zq+VlGKSpHXkyyyScpPdmg4z7Oo3vyp5F8pArD8sprdMDEYo0jYglUUEjYkAA2rDiuIxwnIbswXMUS11GvicsQqLobFiAbG21Y8HxJJiBZlz3KNniZZbe8A0bMLjsTfqL2NoUIxdpGmXycuWKjOV1wW1KUq5gKUpQClKUApSlAch+1qDLiopekuHy/ON3J/KQVojjQ/s11v7V8BzcNHiRvh5bH9mTwn/AMglc99n/ZyfiTkRLZB70z5gieV/xN5D52r1fHypYbb4OTJB69jumAmEkUcg2eJCPQqDXN/tJRmxKAKxvB4bC+uZr6fSt/4TgDhYI8O0hfkxKme2XNlFhpft59KwzvnYkbdPSvJnDXaT2PQ8byv6aanVv0aBiAJZwED55uQfvQwKl8gyknUWZ9ugvva1X8cMccbiOJJWRVs7DMJQxtdFGigEHQdtSTrWvcRkkm4k6Rxlmglw5CqGbOF5TNewsq2FiT3FXOKxyRu3KjKt4kLPsoGlgoNhtTDjTbtdmXk55OtLpUY+H4MkSuLB4V0VsmW5ve9+wBI6X16VHSVoSckguVtnTXTyJFwdNxXt8dJIvKvdfD4ERfFlAsdB0CjXyrDcJtZiV95k0Q+V9z5keneum+kcaj2+P5PMiMPe3Ou+uvUjpfzq6wX+nF+y/wD83/vVFUKTGSYeQyxRxvI7QqWmd7JGCSwQA2ubn/ek06EJLV6MZ4euGxU2S+WbxEMb+IMSx175xUqvuOkzy821gyv4d/gP/wBawwzF1V+XKqPmyu6FQ+UgNlv2JF/puDbw8qbnL4Pr/HnFY4q+UjNg5H5kkF7pJEsir8LxaMR2GRtu9Zq98NT7zmn3YoZwWb9dLKvqTbTyPasa3JyKCzZb5VDHKAQCzHZVBYXYkAXuTavT8OT+nueB+qQSz/b2j7HK6SRcvQl7ZrX1ynKtrj3mCp6uK6C2Kjnj5fPCHERsqMjqrtmX3o79bEEb20rnmJB5bBJfE6qMyI4CkMCrAuBfKwVtVX3dOlXnCGGdMa+qTZTkALfoyRXLRsALraZ3Ob3QIEBINbT3OTFsWOG4umGVoY0LMuK5d5ckMeYsqEqEDFVztGvu6mVW1DXrzicZiY0jxXOGSSVFPgUCISG0bOuX3MxUMt8ygnxkio3HMMvNkcOBFjYs/NQg5XjUJI4I7R8uQeeGWrLhqjGwS4WUZS6tzFW/3LyA8xQfiWQOw8mQ9RWRuQMDiE5zyyj8bSOrJmZAdInIGpEagxkgHKXF9iRJOKTEys0OTWFXjckqcRJGSQUU6lcpKMw1IYA6ZbyI+HJFEZscMOxw+eTnBWPK8A5robBlzNncgX98i5qIuKu8cseFaKMPnvImWbGNy3VUjjJzj37lntYXvYXIA2eCYSIsi+66Kw9CLis9RMBCYo44za6IoOXa9tbeV6l0ApSlAKUpQClKUBC4jgkxMT4eQXSVCrWNjY9QehG4PlX3A4SPDxrDGioka2VF/CP869al0pbqgRcbJlQ+en96q6l8RbVV/wCWJ6AdTpUbDQPLdieWt2AXKCxsbXJ2Av0HrerqSijGUJTk2uF2VXF4HKDli13zPlKqWOgFzcXqPBho4UsxhaVmUvzXS0QOtrG+tt7Am56DWsXHGfPkfOEGYJlQqJiNGPiOljbob9N71Uu5e17eHZVCgL6AaDvVovWvt2RSS0P7t36NgxPCvCVTOMzRLvcsl7HOLgELoRsdNe9U2LwbRswCPlVvftow73Gg9OlZl4vKFtnv4r521b0JPSspx0mJBivGCy6KoYF7alQb6E2262rRLSZSlqdsqXNgWAJ8Puru3kL1hTByzQvjgIwkTWdFdmkRdy7iwAABB32JJtYipUYBIzGw+K18vY27VIwRk4fKMQicyKVskoiYOpBPlpe7XF7at0zsQndbEwSbplAk683msCWRVv8A6uVRcC5A8FyWA1GuYDtV3HM78OgZCwaLFSxkrobMrsdvPLV5wfga4WebEoA+FmwhKL4ToxUtGQdxZdL9DY7XOOfBYdMA82FJMc2IjlCH/tFmjR1AOq21upvY3G1gMNr4Om5qNN9f9RS8Fhiw8EmMaFJZXxjR/feJIvDcNlOlzYi+hJYC9fJHRlhx6xCOGZcTHNHEfBy78uV4+yFSJbDbk+Zv64fiXw0jOgjdJRaSCUeGW3ukHXKw9CCCdOtZuJcQbFMpeONUiUqsCjMig2zBrgB75QLWAtpbU3vod0U+oqtsk8L4VzC6yHWF1VlUr4yCQ3mAcpsfOpC8LSWaVmAZBNKy+8jRNIsZcRldbF0D5rggs4sb3qbiUjw6aZ0z5Vzfes1rF+5IsATvoBbyqXh8MsIyoLDr+se9W55MrceDLwzhEORlZOZme559pNQDlPiG4DEX389qvarOHPYsPK/0/wCa84LjUc6xMM6nErmRHXW1gdcpI2I69aykqZ0wdxLGRAwKkAgixB1BB3BFYcNgo4f9OONNLeBFGg2GnQdqzyNlUt2BNVnAMU80eeQqWBXULl96ONyLXOxYj0Aqpct6UpQClKUApSlAfK8MwAudAK9Vr+M42pRSEc8zOpR/CUtvca62II8qrKSirZaEHOVI1LiPttiGxTRYcw8pGsCyZuaF95swI3NwLeRresDxAYiNHTVnUEjbL3zb29NfnvXNYOCcmXPGssqPqYghGma9roSTpcXsN63HhYJxCpyzGBFKSgYiwJjK6A2v3tXNjyzc36PT8jx8agtKppX1/lGxpAAc51bbNbYdh2H+G9R8HAskKIwByBQR0zJob97MD9Kgl5ElkTmvlHKKr4TlDA31IJNyp3r0kjoS6yavuHRSpPey5Te2m/SulRclaXs8tyjFtN77Mi+2hGSMfizvb0tr+eWtRrbcXgBO4kkd2O2VSFW3YC1wL+d/Oqzi3D0hQuo3ZAE3CnXXMdR9frXRjtL5OXJJSlzsilr6jkEEGxVrhvhI2NerKdvD+1qL/IXA+Rr4UNg1rj4l118+3zrTUu9jPQ+t/wAE+HBjEsXV0QbsrZvAx3sNst9tdNqusDgI44yg8YlXxM2UhxYi1tsup7771Q8O4c2IN9kG8v8ARO5/w1tYAACqLKq2VfhA2FVY4KiSSfBJIiGN4nbTmZyyZr3NtAb3Fzm1a7bsaw8D4FGkYZs7CRLiEs3LToHyXy5soBDWFgRbYWvGUEZSAQd1baiCw3J/WbU1WkNbZqWPwTQsVOo3VvK/Xzq84bgIgFnUZszXRnN8ttNtrgg/0rNiWzSLEU0fwtmtZ0JGa2vvKQp9L18xWOSDLCoUt4QsS/hBPl6nzJqzbZXgxY5gUjzAqFnUFV3ytnS9j1Ia9vOvGI4i0ay9WiiVsrhRqw8BupsQbNcaEZDqb3rLiYhiF+7kJ8aWze4pjcMelzfLa+u9fZeHB5C7G6vCkbpb3ggmGhvpcTH+EVRp2aJrTTMuExRhkWMyu7+PMXSFUcKyLJywvjXKW0zXvlI6g1X8IxLxDDIrkILqyaHOQMIgGovoHfbvVvgcGS4zMhyhM0nKUSzhCMglkB1FwCbKL26C4OePgSrl+8f7ufOuVVGl0ORtDcXRdRbas5Xe50QqtiJw1ZMfHznnkUlVISJ2ULnjRwpsbEAOBqCTa99bCHFLeBY1aZGmePKIGsXIjsfE2YhfDcnXpuL1aN7NQliwMqhvwK4yrckm2l7XJIBJAvoBXtuAQPHyXUuuYMM+TwEX2ygD8TXuDfMb3FQXKd0kiiljaRyPE1i92RY2hYqxAUXIdr2FiuW+t6mcIxSzYsur5v8AosOC3wteQlT57G3nVnhuExQLlSNNAwCnbxbgC1lBJ1sNbm96ruDYWXnGV4EiXkopRHzLmBckjQanMNriyjWgNlpSlAKUpQEXFYhYlMjbD6+grQGlM06/h/SHePJfwxvq6Fe17EH9ryrY/aTGGwhAceK5bYNa1gOpFyNfI9q1Kablss/SDE4eQ+gazbdcp2rgzZryKHR2YcbjB5O1uixw7NG4I0ZH1Xsb6/Le49fnYYvFWxPPTVUXKbbPe2bX0Fv3b18xcaS4oAG6yFCCh94MF1B+d6nPwsQDMxzKXQHpYHw3PyZh+8K0gnul0zqyZINqT5a492YpJw+LaxuHwkRHyZz/ACYVLqPw/hzxu+YElEsr9xfSx9Bt0qRXZhvTv7Z43mKKmtO+yFYsUFMb57ZcjXzVlrxLGHUo2zLY/OtjjNKoDY3G9e5o8jMnwsw+hqbwXCc6QEoGRNXzbbHKLdbkbetaNhFzgmHIjlYlcquxZSwzWYgkge9cAbg7VOVrgMNjqPnVfxHCtNJElvuk1Zly/S3yG3erECskkuC0pOXJ4lmVPeNvCx+S7n0G9ecNio5lzxyRyL8UTqw+oNUXGZpP0lFii5jJF7gx0EZbXMbxt4rgBSHFiL6Ea1TSWhkKiKfDF0lkaRVEgV3EahxyhYL4XO1sz6DpVJZIxdP+Gd+LwJZIKSa4bq038bXZuuKwqzDKbgjVXXQoe4NeBhRn5rCMtl0ZQwN7W11NU0XtFHAIkmnEnN0GKRDy283YKE0OhtqL6gb1Mx3GOS5RUDeFfFn0ufStUm0muGcM4ShJxlyiyw8IjUIAAF2yj6mslafNjZJL5pG13W9hp5CrHh3FDeKAjTPlLXYlg1wNPIsP4RUuJVG2cNTVm+X+flVhWDCR5FAO+5qRXPJ2zrgqij7SlKguKUpQClKUApSlAa17S4QkCYahAAV7a7+epF/StdRBc6e9/T8tLit/niEish2YEH0Isa1HE8GlicBVzqTZWQdOgcdN99tK83ysL1aoqzqxZft0tlQJf0LmzX8ESNIvXJbVlA6i9jbzPao6faCkthLPByybOArBsp3sLk3t2F6qvtUz4NsNCDfOkzt2YiyBfQK7fxVzgKbFraKVBbpcgkD1IVv4T2rbFhlpWptP4/2T9dJVpT+X1+D9S4Fs0aOGzBkBD/GpF1Pra1Q8XFkbyOo/tVH9lfFDi+Hxqxu2FdoT6IAU/wDBkHyNbbPEJFsf+DXbF0cOWOpFPSvciFDY714rY5Csx3CedJzc+UZVBypcta+u46WqdhsMsKcpBYblm1LHuTWWlCBSlUHtnxL9Gwr2Nnn8Cd/EPEfkt/narRi5NJA0vintUXaXkRJGZn8U4OZ5VXRDqNNALbhdLAN4jGh9oJIBHkV1dOQWLSE85MsjMH0v94ZixN7+7bXWoHBMTHDPFNKHKQur5UfKWKaqBprqALab6kC9SfajjCY/ENLGAka+BEDLZlUkKwWwy5hYka+vbu+hDUo1tzfyaLPNJ1Kuq+DL7QYoY2VeSM+dM2VY8r5iPErBRZiAt81up1IANfeD8SSFI1kmJUysrJkYmBRbK4P4lNz4dxl03qowk7xSK8ZdZBorJvci2nre3zqVwvCSSu2HSDmyyI6LE2VeURqXzEgKy5bWOmp9Ks4RjGukVlOU3b5Z0KfhREYmjkEqMt8yC2hFwRqbirD2T4dzH/SGHhT3f1m7/L+ZHarDgWEGAgjwvwL4v1mOrH5sSasoMUqWQABeyiwW+ptavLnPlI1hj4bLSlYXlAA63/lXtHDC4rI6D3SlKAUpSgFKUoBSlKAUpSgOR/bigvg36/8AUj5HlH+lU3CuAiXgGIxAF3GK5ytb8MICN9FMv1q1+2otJNg8OgZmKTZUGpdneJVA8yQRW/8As5wIYXARcPcKbQlZANQzSXMlu4zMw9KEmm/YfP8AdYqL4Zon/iQr/wDmK6nXIPsTUwzY2BjcosAPqjzKx+tdfoQYJ4A4136HtVXLEyGx+R6GrqvDoCLEXFWjKjOeNSKSlT5cD8Jt5H+9RWgdd0P7uv8AKtFJM55Y5LkxVU8U9n4sZIss2dxEtkiz5UW5uxNtSTYdegq2pVlJp2ipCwvB8PD/AKeHgX9ZY0v/ABEXNSHwsbizRRkfCyIR+Yr3nHcfX/O4rIiX2t9VG+29HJ8thK+Clf2Uwcjo/J5TI6sHgPL1U3Gg03G9r1Kg4HhsJI2IijcSSK4aV5ZXL5iCx8ROpO5qj417QTRTNFC2EZEVgz5Xds1trhgAQ3SxvbeoE3tlPHGHkgjkmz5QkT8tGQE+IF72bUXX6aVlPM3tqOzHgko20bbNLc5e1I2rU8J7WRzI07xSxnbkkMzNbqhAsb1k4T7aHxZ8BiF8LlXQq2a2ykMFsxHYkX62qmpGmiXo3lHYCzD0/qKq+P8AH04bC+IkYgLosQNjK591R69+gBPStcb29LsIjgZo0zWMrzRZk/cW9/rVnL7a4PlPiHidzA55cTpE0krjRTGgJZOviYKQDtVbGl9ovOBcWLYWGfE3RpIeY7upVEu2iktsfEABvp9dhr87y+0WJ4tj8PJi+YkKYqJxh44pWWJVa9siqWdyBbNYnU2sNK/RFWRDR9pSlCBSlKAVGlxCp72n5/lUitc/RxHKyD47jRz71iM59cvyHrQhui3OPj6yKPdOugsb2Nz08Lfwms8ciuAykEEXBU3BB2It0qibDqfCsiDI1sm+YA3FrXynUg6HrpVTj+ZCIoEkZUSBQroNxqLFjrtYdNr1NCys9oF5ntHgIzqqYXP8wMWb/VF+ldLris/EWTjOGlWzFIkQMxb3WMge9+oVnt6iunPxUswEboRkZmDjxaEDQAi4F9d6q3Stkrd0aJ9m0Zh4txGI75pj8hOSPycV1euQcOxb4fjskoCH9LRwyDNZ1EOe6nUg5oex/EPOupRcRjcjKSbrfMBcW9RpRO9yWqJ1KiLjoySvMW46HTpfr5a1IVgRcaipIPdfK+0oDGyA7gGvnJX4V/hFZKUIpFRjMOA4dQoDjXW2oHT5E/zquxUjZnTLDbNdObGzEEjXXMAtza3k/ka2ZtqpsSgzCXPEofIFLPluxIXTz0UDzPkKsglTNSHsU0wEqYjUswzctQVsba+I3BIub330rLi/Yy6Feel0zNniw/je24F5LHp07DWtm4a+joHByG5SzBj0N7nTUE238WttqztYbE+H3W6r5G/QX09betNETR5Z+zSE9h80emPfwC5KwR5n3trmA18rbEVR4ThfMlWA4udM8rIGZISbg21VRYC5tvtXUXwJkUqoy3a5vte/iFux39exFZMLwWKNmkygu7XZyFux7/7beVWiopboOcvZpsHsG5OYYwkozDK8DAXt/wC5qP8AevmL+zQzEFsba3wQuv1tIL/Pzro9KppQ+pKqs5vgfsxMDiVeIThl2K89TfvcS1tTcNxtgq8RjFh7xwasW9byVfUqaK2z4Nta9UpUkClKUAqFJh1z8zW5QLvpoSR89TU2q3iiMYyU0ZCCDb69NP8AbtUoFXiIwHdjsC4Cju1z3HQ776+dSI8PHNEsThXZAw8PcXA18xrY73vWaBZJRnZ8gKuGVBYt0uLjMpB1Bv8AIVjwccq3jdb5H0lGRRbvYDXp9Tc6ay2Qc49oMGYeI4eYmwlZEDMPCljl26e/qL6a1tz4R0QMMhfZVb3lPUfLqb9j1qz477OJxGIxSNlcapKF/wBNrb9Lg9Rp9daukiUW0BI/Ed79fSlkOKaOF8Y47Lh8fh8dMjF4FS68vJnjDSKwAO5yO2vnXX+Dzw42NZoZ0ljaxOQ3KtbW595W8jYjavfF/Z7C49lfEQJIUDAFsw0PQ2IvvcX2OoqNwb2PwWAk58GHySZSM3NmbQ+TMR/aobbZelRbrgIw3N5YL5QM51Ngbjfz1qZSlQQKUpQClKUAqlMSQyNmzHOyMqKHOYljfwi5OU2PZdDpvVzX2iYKjGcM5rhwcpYMH/XBFtup6a9PSp0OHVAOp08TanTb+dSaUApSlAKUpQClKUApSlAKUpQCsUihgQdiLH0NZaUBhijVBZRYf31rNSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAKUpQClKUApSlAf//Z',
      //추후에 사이트 주소로 수정하기
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: 'https://developers.kakao.com',
      },
    },
    itemContent: {
      profileText: 'Show Me The Way',
      //show me the way 로고로 수정하기
      profileImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
      titleImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
      titleImageText: 'Show Me The Way',
      titleImageCategory: 'Working Holiday',
    },
    social: {
      likeCount: 10,
      commentCount: 20,
      sharedCount: 30,
    },
    buttons: [
      {
        title: 'ShowMeTheWay 웹으로 이동',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      {
        title: 'ShowMeTheWay 앱으로 이동',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
    ],
  });
      
    </script>
        <!-- 카카오톡 공유하기 아이콘 스크립트 구문 여기까지 입니다.-->
	<!-- addThis 공유하기 버튼 확인 필요 -->
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-637a9827f610c0eb"></script>

</body>
</html>