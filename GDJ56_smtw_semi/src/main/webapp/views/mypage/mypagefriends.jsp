<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<%@ page import="com.smtw.mypage.model.vo.Applyfriends" %>
<%@ page import="com.smtw.mypage.model.vo.MemberInfo" %>
<%@ page import="com.smtw.mypage.model.vo.MemberInfo2" %>
<%@ page import="java.util.List" %>

<%
List<Applyfriends> list =  (List<Applyfriends>)request.getAttribute("list");
%>
<%
List<MemberInfo> infolist =  (List<MemberInfo>)request.getAttribute("infolist");
%>
<%
List<MemberInfo> friendslist =  (List<MemberInfo>)request.getAttribute("friendslist");
%>
<%
List<MemberInfo2> acceptedlist =  (List<MemberInfo2>)request.getAttribute("acceptedlist");
%>





    <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
             <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
            <div id="menutitle"><h2 style="background-color: cornflowerblue;">워홀 프렌즈</h2></div>
            <div id="mypsc">
                <p><%=logInMember.getMemberName()%>님 어서 오세요!</p>
                <img src="<%=request.getContextPath()%>/upload/account/<%=logInMember.getMyImg() %>" alt="" width="200" height="200">
            </div>
            
            <div id="flist" style="overflow:scroll">
                <p><b>친구 목록</b></p>
                <!-- 크롬은 팝업창 최대화 금지가 안됨 -->
                <%if(friendslist.isEmpty()&&acceptedlist==null){ %>
                	아직 수락한 친구가 없습니다 :(
                <%} else{ 
                	if(friendslist!=null){
                	for(int i=0;i<friendslist.size();i++){
                %>
                <div id="fname">
                <form id="" action="" method="post">
                 	<input type="hidden" name="friendId" value="<%=friendslist.get(i).getMemberId()%>"> 
                	<input type="hidden" name="friendName" value="<%=friendslist.get(i).getMemberName()%>"> 
               		<input type="hidden" name="friendAge" value="<%=friendslist.get(i).getAge()%>"> 
                	<input type="hidden" name="friendGender" value="<%=friendslist.get(i).getGender()%>"> 
                	<input type="hidden" name="userId" value="<%=logInMember.getMemberId()%>"> 
				
               	</form>
                	<input type="image" name="submit" id="fname" src="<%=request.getContextPath()%>/images/mypage/prfile_pics.png" style="width: 100px; height: 100px;cursor:pointer;"
               		onclick="goPopup(event)">
                	<p><<%=friendslist.get(i).getMemberName()%>><p>
                
                </div>
                <%}
                }if(acceptedlist!=null){
               
                	for(int j=0;j<acceptedlist.size();j++){
                %>
                <div id="fname">
                <form id="" action="" method="post">
                 	<input type="hidden" name="friendId" value="<%=acceptedlist.get(j).getMemberId()%>"> 
                	<input type="hidden" name="friendName" value="<%=acceptedlist.get(j).getMemberName()%>"> 
               		<input type="hidden" name="friendAge" value="<%=acceptedlist.get(j).getAge()%>"> 
               	    <input type="hidden" name="friendGender" value="<%=acceptedlist.get(j).getGender()%>"> 
                	<input type="hidden" name="userId" value="<%=logInMember.getMemberId()%>"> 
                </form>
                <input type="image" name="submit" id="fname" src="<%=request.getContextPath()%>/images/mypage/prfile_pics.png" style="width: 100px; height: 100px;cursor:pointer"
                onclick="goPopup2(event)">
                <p><<%=acceptedlist.get(j).getMemberName()%>><p>
                <%}
                }
                }%>
                
              </div>
            </div>
            
            
                <script>
            	function goPopup(e){
            		var gsWin=window.open("","winName","width=380,height=380"); //open("주소",띄우는방식,크기)
            		var frm=$(e.target).prev()[0];
            		
            		frm.action="<%=request.getContextPath()%>/mypage/mypagePopUp.do";
            		frm.target="winName";
            		frm.submit();
            	}
            	
            	function goPopup2(e){
            		var gsWin=window.open("","winName","width=380,height=380"); //open("주소",띄우는방식,크기)
            		var frm=$(e.target).prev()[0];
            		frm.action="<%=request.getContextPath()%>/mypage/mypagePopUp.do";
            		frm.target="winName";
            		frm.submit();
            	}
            	</script>
            
        
         

            <div id="recievelist"" style="overflow:scroll">

                <p><b>친구신청 받은 목록</b><p>


                <%if(list.isEmpty()){ %>
                	아직 친구 신청을 보낸 회원이 없습니다 :(
                <%} else{
                	for(int i=0;i<list.size();i++){
                %>
                <div style="width:800; height:100;border: 1px solid;">
                    <p style="color: gray; float: right;">친구신청일 : <%=list.get(i).getFEnroll()%></p>
                    <p style="text-align: center; float: left;">
                    <%=infolist.get(i).getMemberName()%>(<%=infolist.get(i).getAge()%>/<%=infolist.get(i).getGender()%>)</p>
                    
                    
                    <p style="text-align: center;"><%=list.get(i).getPropose()%>
                        <button name="수락" value="수락" type="submit" onclick="window.open('<%=request.getContextPath()%>/mypage/acceptFriends.do?id=<%=logInMember.getMemberId()%>&&memberfrom=<%=list.get(i).getMemberId()%>','_blank','scrollbars=yes,width=417,height=385,top=100,left=100');">수락</button>
                        <button name="거절" value="거절" type="submit" onclick="window.open('<%=request.getContextPath()%>/mypage/rejectFriends.do?id=<%=logInMember.getMemberId()%>&&memberfrom=<%=list.get(i).getMemberId()%>','_blank','scrollbars=yes,width=417,height=385,top=100,left=100');">거절</button>
                    </p>
                </div>
                <br>
                <%}
                }%>
                 
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

                if(scrollTop<=300){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
                    $(".sidemenu").stop().animate({
                        "top" : newPosition
                    }, 50);}
            }).scroll();
        });
    </script> 
      <style>

        #menutitle{
            /* border: 1px solid;
            border-bottom: 3px solid; */

            position: absolute;
            top: 350px;
            left: 800px;
            width: 300px;
            height: 100px;
        }

        #mypsc{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 500px;
         
            width: 300px;
            height: 300px;
        }
        #flist{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 900px;
            
            width: 600px;
            height: 300px;
        }
        /* #fname>img{
            
            margin: 5px;
            height:50%;
            width:;
            float: left;
        } */
       #fname{
            float: left;
             margin: 3px;
        } 
        #recievelist{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 850px;
            left: 500px;
            
            width: 1000px;
            height: 300px;
            
            -ms-overflow-style: none; /* IE and Edge */
    		scrollbar-width: none; /* Firefox */
        }
        
        #recievelist::-webkit-scrollbar {
   		 display: none; /* Chrome, Safari, Opera*/
		}

        section{
            display: flex;
        }
        .contentList{
       		height: 1000px;
            width: 85%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
            text-align: center;
        }

        #list{
            margin: 0 auto;
            width: 700px;
            border-collapse: collapse;
        }
        #list th{
            border: 1px solid;
            border-bottom: 3px solid;
        }
        #list td{
            border: 1px solid;
        }
        .sidemenu{
            padding: 10px;
            /* margin-top: 1000px; */
            /* margin: 0 auto; */
            /* border: 1px solid; */
            font-size: 18px;
            font-weight: bold;
            position: fixed;
        }
        
        .menuDiv{
            width: 15%;
        }

        .sidemenu p:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu>*:not(div:nth-child(1)){
            width: 200px;
            height: 50px;
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu p{
            text-align: center;
            padding: 13px;
            cursor:pointer
        }
        .sidemenu>div:nth-child(2){
            color: purple;
            
        }
        section{
            border: 1px solid tomato;
            
            margin-left: 50px;
            margin-right: 50px;
            /* ★수정한 부분 */
            /* padding-left: 100px;
            padding-right: 100px; */
            /* ★수정한부분 */
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
        section>div{
            border: 1px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>
<%@include file="/views/common/footer.jsp" %>