<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.friends.model.vo.Friends, java.util.List, com.smtw.admin.model.service.MemberService, 
				com.smtw.mypage.model.service.MypageService" %>
<%
	List<Friends> fs=(List<Friends>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/friendsList.css"/>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <section>
     <!-- ##### 여기 왼쪽 사이드메뉴 div ##### -->
	<div class="sector">
	    <div class="sidemenu">
	        <div><a href="<%=request.getContextPath()%>/friends/friendsList.do"><p>커뮤니티</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/friends/friendsList.do"><p id="purple">워홀프렌즈 구하기</p></a></div>
	        <div><a href="<%=request.getContextPath()%>/community/reviewBasic.do"><p>생생후기</p></a></div>
	    </div>
	<!-- ##### 사이드메뉴랑 본내용 구분하는 div ##### -->
	    <div class="menuDiv"></div>
    
    
    <div id="friendsList">
        <div id="friendTitle" style="text-align: center;">
            <br>
            <h1>워홀프렌즈 구하기</h1>
            <p>친구를 맺으면 서로 쪽지 보내기가 가능합니다. 친구를 맺어 대화를 나누세요!</p>
        </div>

        <div style="height:25px;">
            <div style="display:flex;float: right;">
                <select class="form-select" aria-label="Default select example" style="box-shadow: 0 4px 2px -2px rgba(221, 160, 221, 0.304) !important;">
                    <option value="전체">전체</option>
                    <option value="네덜란드">네덜란드</option>
                    <option value="뉴질랜드">뉴질랜드</option>
                    <option value="대만">대만</option>
                    <option value="덴마크">덴마크</option>
                    <option value="독일">독일</option>
                    <option value="벨기에">벨기에</option>
                    <option value="스웨덴">스웨덴</option>
                    <option value="스페인">스페인</option>
                    <option value="아르헨티나">아르헨티나</option>
                    <option value="아일랜드">아일랜드</option>
                    <option value="영국">영국</option>
                    <option value="오스트리아">오스트리아</option>
                    <option value="이스라엘">이스라엘</option>
                    <option value="이탈리아">이탈리아</option>
                    <option value="일본">일본</option>
                    <option value="체코">체코</option>
                    <option value="칠레">칠레</option>
                    <option value="캐나다">캐나다</option>
                    <option value="포르투갈">포르투갈</option>
                    <option value="폴란드">폴란드</option>
                    <option value="프랑스">프랑스</option>
                    <option value="헝가리">헝가리</option>
                    <option value="호주">호주</option>
                    <option value="홍콩">홍콩</option>
                </select>
            </div>
        </div>

        <div style="height:700px">
            <div style="display:flex">


            <div id="lists" style="border:0px solid red;width:800px;height:695px">
                <div style="display:flex">
                      
                <%if(fs==null||fs.isEmpty()) {%>
                       <div id="box" style="border:0px solid green;width:300px;height:300px">
                           <div style="border:0px solid magenta;width:220px;height:270px; margin-left :25px; margin-top :5px;background-color:rgba(128, 128, 128, 0.342);border-radius:20px;" >
                               <div style="border:0px solid blue;width:100%;height:110px;display:flex;justify-content: center;">
                               </div>        
								<p>조회된 회원이 없습니다.</p>
                               <div style="border:0px solid blue;width:100%;height:30px;margin-top:30px;display:flex;">
                               </div>
                           </div>
                       </div>
				<%}else {
					int count=0;
					for(Friends f : fs) {%>
                       <div id="box" style="border:0px solid green;width:300px;height:320px">
						<button onclick="location.assign('<%=request.getContextPath() %>/friends/friendsInfo.do?friendsNo=<%=f.getFriendsNo() %>')"
						style="border:0px;background-color: white;">
                            <div style="border:0px solid magenta;width:210px;height:290px;margin-left:0px;margin-top:5px;background-color:rgba(128, 128, 128, 0.342);border-radius:20px;">
                                <div style="border:0px solid blue;width:100%;height:110px;display:flex;justify-content:center;">
    								<%String myImg=new MypageService().getImg(f.getMemberId()); %>
                                    <%if(myImg==null) {%>
                                    	<img src="<%=request.getContextPath() %>/images/lupy.jpg" alt="" style="width:50%;height:80%;margin:auto;border-radius:120px;">
									<%}else {%>
                                    	<img src="<%=request.getContextPath() %>/upload/account/<%=myImg %>" alt="" style="width:50%;height:80%;margin:auto;border-radius:120px;">
									<%} %>
                                </div>
                                <div style="border:0px solid blue;width:100%;height:30px;margin-top:10px;display:flex;">
                                    <div>&nbsp<strong><%=f.getFriendsTitle() %></strong></div>
                                </div>
                                <div style="border:0px solid blue;width:100%;height:30px;margin-top:10px;display:flex;">
                                    <div>
	                                    &nbsp이름:
	                                    <%
	                                    	//아이디로 이름 찾기
	                                    	String name=new MemberService().selectMemberId(f.getMemberId()).getMemberName();
	                                    %>
	                                    <%=name %>
                                    </div>
                                </div>
                                <div style="border:0px solid blue;width:100%;height:30px;margin-top:10px;display:flex;">
                                    <div>&nbsp희망국가: <%=f.getNName() %></div>
                                </div>
                                <div style="border:0px solid blue;width:100%;height:30px;margin-top:10px;display:flex;">
                                    <div>&nbsp목적: <%=f.getPurpose() %></div>
                                </div>
                            </div>
                        </button>
                       </div>
                       <%count++;
                        if(count==3){
                       		count=0;%>
                       	</div>
                       	<div style="display:flex">
                      <%} %>
                    <%} %>
                 <%} %>
                 </div>
                  
                 <div style="border:0px solid blue;width:100%;height:80px;text-align: center;">
                     <!-- 페이지 바 -->
                     <nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
                         <ul class="pagination justify-content-center" style="color:rgba(221, 160, 221, 0.508) !important;">
							<%=request.getAttribute("pageBar") %>
                         </ul>
                     </nav>
                 </div>
              </div>
            </div>

        </div>
        <div style="display:flex; border:0px solid rgb(15, 231, 231);width:100%;height:75px">
            <div style="border:0px solid yellow;width:400px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                     <%if(logInMember!=null) {%>
	                    <button onclick="enroll();" class="customBtn btnStyle btn btn-primary" type="button" style=" margin-left :300px; margin-top :15px;background-color: rgba(221, 160, 221, 0.508) !important;" value="등록">등록하기</button>
					 <%} %>
                </div>
            </div>
        </div>  
        </div>
    </div>
    </section>

    <style>
        .sidemenu>div{
        	margin-top:20px;
        }
	</style>
    
    <!-- ##### 사이드바 스크롤 위치 따라 움직이는 스크립트문 ##### -->
    <!-- ##### 개별적으로 설정해줘야 하는 부분 있음 (각자 페이지 푸터위까지만 움직이게) ##### -->
    <!-- ##### 크롬 비율 80프로기준으로 설정했음 ##### -->
	<script>
		//select 박스 값을 변경하면 선택한 나라가 희망국가인 것만 리스트로 나옴
		$(".form-select").change(function(){
			if($(".form-select").val()=="전체"){
				location.assign("<%=request.getContextPath()%>/friends/friendsList.do");
			}else{
				location.assign("<%=request.getContextPath()%>/friends/friendsNationList.do?nation="+$(".form-select").val());
			}
		});
		
		//select 박스 값이 선택한 나라대로 나오게 함
		<%if(request.getParameter("nation")!=null){%>
			$(".form-select").val("<%=request.getParameter("nation")%>").prop("selected",true);
		<%}%>
		
		const enroll=()=>{
			location.assign("<%=request.getContextPath()%>/friends/friendsEnroll.do");
		}
	
	    $(document).ready(function() {
	        var floatPosition = parseInt($(".sidemenu").css("top")); //사이드메뉴바의 top위치 가져옴
	
	        $(window).scroll(function() {
	            var scrollTop = $(window).scrollTop(); // 현재 스크롤 위치를 가져온다.
	            //console.log(scrollTop); //스크롤위치 콘솔창에 출력해보면서 본인 페이지의 푸터위에 
	                                    //사이드메뉴바가 딱 정지하는 위치값 확인할것
	
	            var newPosition=scrollTop +floatPosition + "px"; //사이드메뉴바의 처음위치+ 현재스크롤위치
	
	            if(scrollTop<=620){ //해당 페이지의 푸터위 스크롤값이 620이여서 scrollTop이 620까지만 이동하게 설정했음
	                $(".sidemenu").stop().animate({
	                    "top" : newPosition
	                }, 500);}
	        }).scroll();
	    });
	</script> 
    <!-- ##### 여기까지 스크립트 구문 ##### -->
<%@ include file="/views/common/footer.jsp" %>