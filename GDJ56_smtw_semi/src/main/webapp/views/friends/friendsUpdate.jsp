<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.friends.model.vo.Friends" %>
<%
	Friends f=(Friends)request.getAttribute("friends");
%>
<%@ include file="/views/common/header.jsp" %>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <section>
        <form id="updateForm" action="<%=request.getContextPath()%>/friends/friendsUpdateEnd.do"
            onsubmit="return updateFriend();">
            <div id="contents" style="width:85%;display:flex;border:1px solid;">
                <div style="border:1px solid black;width:900px;height:1070px;border-radius:30px;">
			        <div id="friendTitle" style="text-align: center;">
			            <br>
			            <h1>워홀프렌즈 등록</h1>
			        </div><br>
                    <div style="border:0px solid pink;width:810px;height:200px;display:flex;">
                        <div  style="border:0px solid rgb(210, 243, 21);width:300px;">
                            <img src="<%=request.getContextPath() %>/images/lupy.jpg" style="width:65%;height:90%;margin-left:30px;display:block;border-radius:120px;">
                        </div>
                        <div style="border:0px solid rgb(210, 243, 21);width:300px;">
                        	<br><br>
                                <b>제목</b> : <input type="text" name="title" placeholder="제목을 입력하세요." value="<%=f.getFriendsTitle()%>"><br>
                                <b>이름</b> : <%=logInMember.getMemberName() %><br>
                           		<b>성별</b> : <%=(logInMember.getGender()=='M')?"남자":"여자" %>
                        </div>
                    </div>
                    <div style="border:0px solid pink;width:810px;height:690px;text-align: center; ">
                        <div style="border:0px solid blueviolet;width:800px;height:30px;text-align:left ">
                            <b>MBTI</b> :
                            <select name="mbti">
                            	<option name="mbti" value="ENFJ">ENFJ</option>
                            	<option name="mbti" value="ENFP">ENFP</option>
                            	<option name="mbti" value="ENTJ">ENTJ</option>
                            	<option name="mbti" value="ENTP">ENTP</option>
                            	<option name="mbti" value="ESFJ">ESFJ</option>
                            	<option name="mbti" value="ESFP">ESFP</option>
                            	<option name="mbti" value="ESTJ">ESTJ</option>
                            	<option name="mbti" value="ESTP">ESTP</option>
                            	<option name="mbti" value="INFJ">INFJ</option>
                            	<option name="mbti" value="INFP">INFP</option>
                            	<option name="mbti" value="INTJ">INTJ</option>
                            	<option name="mbti" value="INTP">INTP</option>
                            	<option name="mbti" value="ISFJ">ISFJ</option>
                            	<option name="mbti" value="ISFP">ISFP</option>
                            	<option name="mbti" value="ISTJ">ISTJ</option>
                            	<option name="mbti" value="ISTP">ISTP</option>
                            </select>
                       </div><br>
                       <div style="border:0px solid blueviolet;width:800px;height:150x;text-align:left">
                            <label><b>희망국가</b></label>
                                <table>
                                    <tr>
                                        <td><input type="radio" name="nation" value="네덜란드">네덜란드</td>
                                        <td><input type="radio" name="nation" value="뉴질랜드">뉴질랜드</td>
                                        <td><input type="radio" name="nation" value="대만">대만</td>
                                        <td><input type="radio" name="nation" value="덴마크">덴마크</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="nation" value="독일">독일</td>
                                        <td><input type="radio" name="nation" value="벨기에">벨기에</td>
                                        <td><input type="radio" name="nation" value="스웨덴">스웨덴</td>
                                        <td><input type="radio" name="nation" value="스페인">스페인</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="nation" value="아르헨티나">아르헨티나</td>
                                        <td><input type="radio" name="nation" value="아일랜드">아일랜드</td>
                                        <td><input type="radio" name="nation" value="영국">영국</td>
                                        <td><input type="radio" name="nation" value="오스트리아">오스트리아</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="nation" value="이스라엘">이스라엘</td>
                                        <td><input type="radio" name="nation" value="이탈리아">이탈리아</td>
                                        <td><input type="radio" name="nation" value="일본">일본</td>
                                        <td><input type="radio" name="nation" value="체코">체코</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="nation" value="칠레">칠레</td>
                                        <td><input type="radio" name="nation" value="캐나다">캐나다</td>
                                        <td><input type="radio" name="nation" value="포르투갈">포르투갈</td>
                                        <td><input type="radio" name="nation" value="폴란드">폴란드</td>
                                    </tr>
                                    <tr>
                                        <td><input type="radio" name="nation" value="프랑스">프랑스</td>
                                        <td><input type="radio" name="nation" value="헝가리">헝가리</td>
                                        <td><input type="radio" name="nation" value="호주">호주</td>
                                        <td><input type="radio" name="nation" value="홍콩">홍콩</td>
                                    </tr>
                                </table>
                        </div><br>
                        <div style="border:0px solid blueviolet;width:800px;height:30px;text-align:left ">
                            <b>취향</b> : <input type="radio" name="type" value="집순이">집순이&nbsp 
                            <input type="radio" name="type" value="밖돌이">밖돌이
                       </div><br>
                       <div style="border:0px solid blueviolet;width:800px;height:30px;text-align:left ">
                           	<b>워홀경험자</b> : <input type="radio" name="expYn" value="Y">경험자&nbsp
                           	<input type="radio" name="expYn" value="N">비경험자
                        </div><br>
                        <div style="border:0px solid blueviolet;width:800px;height:30px;text-align:left ">
                            <b>목적</b> : <input type="checkbox" value="스터디">스터디&nbsp
                            <input type="checkbox" name="purpose" value="여행">여행&nbsp
                            <input type="checkbox" name="purpose" value="워홀준비">워홀준비&nbsp
                            <input type="checkbox" name="purpose" value="기타">기타
                        </div><br>
                        <div style="border:0px solid blueviolet;width:452px;height:25px;text-align:left">
                            <b>자기소개글</b>
                        </div>
                        <div style="border:0px solid blueviolet;width:800px;height:215px;text-align:left">
                            <textarea name="friendsContents" cols="85" rows="8" style="margin-top:10px;resize:none;" placeholder="내용을 입력해주세요."></textarea>
			               	<p>친구 요청을 수락하면 서로 쪽지 보내기가 가능합니다. 친구를 맺어 대화를 나누세요!</p>
                        </div>
                        <input type="hidden" name="memberId" value="<%=logInMember.getMemberId() %>">
                        <input type="submit" style="display: none"><br>
           			 	<div style="border:0px solid yellow;width:810px;height:60px;display: inline-flex;align-items:center; ">
                			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		                        <input type="submit" class="customBtn btnStyle btn btn-primary" style="margin-left:690px;background-color: rgba(221, 160, 221, 0.508) !important;" value=" 수정 "></button>
        		                <button onclick="cancelFriend();" class="customBtn btnStyle btn btn-primary" type="button" style=" background-color: rgba(221, 160, 221, 0.508) !important;" value="취소">&nbsp취소&nbsp</button>
                			</div>
          		      </div>
                   </div>
	            </div>
            </div>
        </form>
	</section>

    <style>
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
            background: #d27ec8b9;
            background: linear-gradient(0deg, #d27ec8b9 0%, #d27ec8b9 100%);
        }
        .btnStyle:hover {
            color: #d27ec8b9;
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
            background: #d27ec8b9;
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
		const updateFriend=()=>{
			if($("[name=title]").val().length==0||
				!$("[name=nation]").is(':checked')||!$("[name=type]").is(':checked')||
				!$("[name=expYn]").is(':checked')||!$("[name=purpose]").is(':checked')||
				$("[name=friendsContents]")[0].value==''){
					alert("값을 모두 입력해주세요.");
					return false;
			}else{
				let answer;
				answer=confirm("수정을 완료 하시겠습니까?");
				if(answer){
					return true;
				}
			}
		}
        
		function cancelFriend(url){
			location.assign(document.referrer); //이전 페이지 주소로 이동
		}
		
		
		//저장된 값을 불러와서 체크박스에 체크
	    for(let i=0;i<$("[name=mbti]").length;i++){
	        if($("[name=mbti]")[i].value=="<%=f.getMbti()%>"){
	            $("[name=mbti]")[i].setAttribute('selected', true);
	            break;
	        }
	    }
		for(let i=0;i<$("[name=nation]").length;i++){
	        if($("[name=nation]")[i].value=="<%=f.getNName()%>"){
	            $("[name=nation]")[i].setAttribute('checked', true);
	            break;
	        }
	    }
		for(let i=0;i<$("[name=type]").length;i++){
			if($("[name=type]")[i].value=="<%=f.getType()%>"){
				$("[name=type]")[i].setAttribute('checked', true);
				break;
			}
		}
		for(let i=0;i<$("[name=expYn]").length;i++){
			if($("[name=expYn]")[i].value=="<%=f.getExpYn()%>"){
				$("[name=expYn]")[i].setAttribute('checked', true);
				break;
			}
		}
		for(let i=0;i<$("[name=purpose]").length;i++){
			for(let s of ("<%=f.getPurpose()%>".split(", "))){
				if($("[name=purpose]")[i].value==s){
					$("[name=purpose]")[i].setAttribute('checked', true);
				}
			}
		}
		
		//저장된 자기소개글을 불러와서 textarea에 출력
		$("[name=friendsContents]").val("<%=f.getFriendsContents()%>");
		
	</script>
	
	<style>
        section{
            border: 0px solid tomato;
            font-family: "Hahmlet";
            margin-left: 50px;
            margin-right: 50px;
            /* padding-left: 100px; */
            /* padding-right: 100px; */
            /* 
                만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
                좌우 간격을 조정하세요
                왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
             */
            margin-top: 100px;
            /* height: 900px; */
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            border: 0px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
        #contents>*{
        	margin:0 auto;
        }
        #contents>*>*{
        	margin:0 auto;
        }
    </style>

<%@ include file="/views/common/footer.jsp" %>
