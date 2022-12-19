<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
  <%
  	Member m = (Member)request.getAttribute("member");
  	String postcode = (String)request.getAttribute("postcode");
  	String address = (String)request.getAttribute("address");
  	String detialadd = (String)request.getAttribute("detialadd");
  	String bYear = (String)request.getAttribute("bYear");
  	String bMonth = (String)request.getAttribute("bMonth");
  	String bDay = (String)request.getAttribute("bDay");
  	char gender = (char)request.getAttribute("gender");
  	String phone = (String)request.getAttribute("phone");
  	String name = (String)request.getAttribute("name");
  	String email = (String)request.getAttribute("email");
  	
out.print(bYear);
  %>
 <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
             <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p>찜한 나라</p></div>
           
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
            <div id="menutitle"><h2 style="background-color: cornflowerblue;">계정 관리</h2></div>
        
        <form action="<%=request.getContextPath()%>/mypageAccountUpdateEnd.do" method="post">
        <div id="mypsc">
                <img src="<%=m.getMyImg()%>" alt="" width="200" height="200" >
                <br>
                수정할 사진을 불러오세요 <br>
                <input type="file" name="mypcs">
                <!-- <button onclick="window.open('mypage-pwcheck.html')">수정하기</button>
                <button onclick="window.open('mypage-pwcheck.html')">탈퇴하기</button> -->
        </div>
        <div id="myimpo">
            <div>아이디 : <input type="text" name="id" value="<%=m.getMemberId()%>" readonly></div>
            <div>이름 : <input type="text" name="name" value="<%=name %>" required ></div>
            
            <div>성별 : 
                <input type="radio" name="gender" id="gender0" value="M" <%=gender=='M'? "checked":"" %>>
                <label for="gender0">남</label>
                <input type="radio" name="gender" id="gender1" value="F" <%=gender=='F'? "checked":"" %>>
                <label for="gender1">여</label>
            </div>
            
            <div>
            

            
            <label class="form-label mt-4">생년월일<span class="obli">(필수)</span></label><br>
        	년 <input type="text" class="form-control" name="bYear" value="<%=bYear %>" placeholder="년(4자)" maxlength="4" required>

               월 <select name="bMonth" id="bMonth" placeholder="월" value="<%=bMonth %>"> 
                    <option value="01">1
                    </option>
                    <option value="02">2
                    </option>
                    <option value="03">3
                    </option>
                    <option value="04">4
                    </option>
                    <option value="05">5
                    </option>
                    <option value="06">6
                    </option>
                    <option value="07">7
                    </option>
                    <option value="08">8
                    </option>
                    <option value="09">9
                    </option>
                    <option value="10">10
                    </option>
                    <option value="11">11
                    </option>
                    <option value="12">12
                    </option>
                </select>
     
            일 <select name="bDay" id="bDay" class="custom-select"> 
                <option value="01" selected="selected">1
                </option>
                <option value="02">2
                </option>
                <option value="03">3
                </option>
                <option value="04">4
                </option>
                <option value="05">5
                </option>
                <option value="06">6
                </option>
                <option value="07">7
                </option>
                <option value="08">8
                </option>
                <option value="09">9
                </option>
                <option value="10">10
                </option>
                <option value="11">11
                </option>
                <option value="12">12
                </option>
                <option value="13">13
                </option>
                <option value="14">14
                </option>
                <option value="15">15
                </option>
                <option value="16">16
                </option>
                <option value="17">17
                </option>
                <option value="18">18
                </option>
                <option value="19">19
                </option>
                <option value="20">20
                </option>
                <option value="21">21
                </option>
                <option value="22">22
                </option>
                <option value="23">23
                </option>
                <option value="24">24
                </option>
                <option value="25">25
                </option>
                <option value="26">26
                </option>
                <option value="27">27
                </option>
                <option value="28">28
                </option>
                <option value="29">29
                </option>
                <option value="30">30
                </option>
                <option value="31">31
                </option>   
           </select>
           </div>
           
           <div>
            <div class ="adddressContainer">
        <label class="form-label mt-4">주소</label>
        <%if(!address.equals("주소를 입력해주세요")) {%>
        <div class="bir_yy address">
                <input type="text" class="form-control inputAddr" value=<%=postcode %>
                   name="inputAddress_postcode" id="inputAddress_postcode" placeholder="우편번호" readonly>
        
            <input id="searchAddr" type="button" value="주소 검색" onclick="sample6_execDaumPostcode()">
        </div>
    </div> <div class ="adddressContainer">
   
        <div class="bir_yy address">
                <input type="text" class="form-control inputAddr" value=" <%=address %>"
                   name="inputAddress_address" id="inputAddress_address" placeholder="주소" readonly>
        
        
                <input type="text" class="form-control inputAddr"  value="<%=detialadd %>"
                   name="inputAddress_detailAddress"id="inputAddress_detailAddress" placeholder="상세주소" required>
        </div>
    </div>
    <%}else{%>
		<div class ="adddressContainer">
                    
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr"
                               name="inputAddress_postcode" id="inputAddress_postcode" placeholder="우편번호" readonly>
                    </div>
                    <div class="bir_yy address">
                        <input id="searchAddr" type="button" value="주소 검색" onclick="sample6_execDaumPostcode()">
                    </div>
                </div>
                <div class ="adddressContainer">
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr"
                               name="inputAddress_address" id="inputAddress_address" placeholder="주소" readonly>
                    </div>
                    <div class="bir_yy address">
                            <input type="text" class="form-control inputAddr" 
                               name="inputAddress_detailAddress"id="inputAddress_detailAddress" placeholder="상세주소" required>
                    </div>
                </div>
	<%}%>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
//                 var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('inputAddress_postcode').value = data.zonecode;
                document.getElementById("inputAddress_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("inputAddress_detailAddress").focus();
            }
        }).open();
    }
</script>
           </div>
           
            
            
            <div>전화번호 : <input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" value="<%=phone%>" maxlength="11" required ></div>
            <div>이메일 : <input type="email" placeholder="abc@xyz.com" name="email" id="email"  value="<%=email%>" required ></div>
			<%-- <div>비밀번호 : <button onclick="windows.open('<%=request.getContextPath()%>/mypage/mypagePwdCk3.do?id=<%=m.getMemberId()%>');">수정하기</button></div>            --%>
            <input type="submit" name="저장하기" value="저장하기" style="float: right;" onclick="">
		</form>
        </div>


           
          
        </div>
        

    </section>
    <script>
        
    </script>
    <style>
    #myimpo{
       
        position: absolute;
        top: 500px;
        left: 800px;
        width: 600px;
        height: 300px;
       
        
    }
    #myimpo>*:not(div:nth-child(9)){
        border: 1px solid;
        padding: 2%;
    }
       

    #mypsc{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 500px;
         
            width: 300px;
            height: 443px;
        }

        #menutitle{
            /* border: 1px solid;
            border-bottom: 3px solid; */

            position: absolute;
            top: 350px;
            left: 800px;
            width: 300px;
            height: 100px;
        }

       
        section{
            display: flex;
        }

        .contentList{
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
        .sidemenu>div:nth-child(3){
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
        .bir_wrap>*{
            float: left;
            margin: 0.5%;          
        }
        .form-control>input{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
          
            border-color: cornflowerblue;
        }
        #bMonth{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
          
            border-color: cornflowerblue;
        }
        #bDay{
            border-width: 1px;
            border-style: solid;
            border-radius: 5px;
            
            border-color: cornflowerblue;
        }
        
    </style>
<%@include file="/views/common/footer.jsp" %>