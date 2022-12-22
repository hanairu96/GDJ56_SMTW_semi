<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/review.css"/>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/readReview.css"/>

	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
    

    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    

<script src="http://code.jquery.com/jquery-3.6.1.min.js"> </script> 
	
<%@ page import="com.smtw.review.model.vo.Review" %>   
<%@ page import="com.smtw.review.model.vo. ReviewComments" %>   
<%@ page import = "java.util.List" %>


<%
	Review  r=(Review)request.getAttribute("readReview");
	Member m=(Member)request.getAttribute("member");
	int readReviewNo=(int)request.getAttribute("readReviewNo");
	List<ReviewComments> rcList=(List<ReviewComments>)request.getAttribute("rcList");
	
	
	
%>

<%@include file="/views/common/header.jsp" %>

    <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section style=height:auto;>
        <div style="border:1px solid;width:100%;height:150px;text-align: center;font-size: x-large;justify-content: center;display: flex;">
            <div style="margin-top:50px"> <%=r.getReviewTitle() %> </div> 
        </div>
        <div style="background-color:rgba(128, 0, 128, 0.4);width:100%;height:3px;"></div>
        <div style="width:100%;height:7px;"></div>
        <div style="display:flex; border:0px solid rgb(15, 231, 231);width:100%;height:75px">
            <div style="border:0px solid yellow;width:500px;height:60px;display:inline-flex;align-items:center;">
                <div>
                    <table border="1" style="border-radius:20px;">
                        <tr>
                            <td>작성자:</td>
                            <td><%=r.getMemberId() %></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table border="1" style="border-radius:20px;">
                        <tr>
                            <td>날짜:</td>
                            <td><%=r.getEnrollDate() %></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="border:0px solid yellow;width:500px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px;margin-left: 50px;">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                   <%if(logInMember!=null&&(logInMember.getMemberId().equals("ADMIN")||logInMember.getMemberId().equals(r.getMemberId()))){%>
                    <button onclick="update_check('<%=r.getReviewNo()%>','<%=r.getReviewFileName()%>');"   class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.508) !important;" value="수정">수정하기</button>
                    <button onclick="delete_check('<%=r.getReviewNo()%>','<%=r.getReviewFileName()%>');" class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.479) !important;" value="삭제">삭제하기</button>
               		<%} %>
                </div>
            </div>
        </div>       
        </div>
        <script>
           function update_check(reviewNo,orifileName){
           var answer;
            answer = confirm("후기를 수정하시겠습니까?");
            if(answer == true){
			
			location.assign("<%=request.getContextPath()%>/community/reviewUpdate.do?reviewNo="+reviewNo+"&orifileName="+orifileName);
	
            	
		       }
         }
           
            
           function delete_check(reviewNo,fileName){
           var answer;
            answer = confirm("후기를 삭제하시겠습니까?");
            if(answer == true){
				location.assign("<%=request.getContextPath()%>/community/reviewDelete.do?reviewNo="+reviewNo+"&fileName="+fileName);

		       }
         }
        </script>



        <div style="height:700px">
            <div style="display:flex;border: 1px;">
                <div style="border:0px solid red;width:100%;height:695px;display:flex; ">
                    <div style="display:flex">
                        <div style="border:0px solid green;width:1390px;;height:690px;">
                            <div style="border:0px solid pink;width:950px;height:110px;margin-left:270px;">
                                <table class="table table-bordered">
                                    <tr>
                                        <td style="background-color: rgba(231, 123, 231, 0.534);">나라</td>
                                        <td><%=r.getNationName() %></td>
                                    </tr>
                                    <tr>
                                        <td style="background-color: rgba(231, 123, 231, 0.534);">도시</td>
                                        <td><%=r.getReviewCity() %></td>
                                    </tr>
                                    <tr>    
                                        <td style="background-color: rgba(231, 123, 231, 0.534);">만족도</td>
                                        <td>별<%=r.getReviewSat()%>점</td>
                                    </tr>
                                  </table>
                              
                            </div>
                            <div style="border:0px solid pink;width:950px;height:550px;text-align:center;margin-left:270px;margin-top: 30px; ">
                               <div style="border:1px solid rgba(137, 43, 226, 0.247);width:950px;height:800x;text-align:left;border-radius:20px;">
                                
                                 <img src="<%=request.getContextPath() %>/upload/review/<%=r.getReviewFileName() %>" alt="" style="width: 50%;height:50%;margin:auto; display:block;border-radius:20px;">
                                </div>
                                <div  class="product-title" style="border:1px solid rgba(137, 43, 226, 0.301);width:950px;height:auto;text-align:center;border-radius:20px;;">
                                    <div class="product-img-div"  style="width:100%;"  style="height:auto;">
                                     <p>
                                        <%=r.getReviewContnet() %>
                                     </p>
                                     </div>
                                     
                                </div> 
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
       
       
       <style>
		  .product-title {
		    text-align:center;
		    display:table;
		    border:1px solid #cecece;
		    width:280px;
		    height:250px;
		}
		
		.product-img-div {
		    display:table-cell;
		    vertical-align:middle;
		}
       
       .product-img-div img {
		    max-width:100%;
   			 max-height:100%;
		}
       
       
       
       </style>
       
       
        
        
        <div style="display:flex; border:0px solid rgb(15, 231, 231);width:100%;height:75px">
            <div style="border:0px solid yellow;width:500px;height:60px"></div>
            <div style="border:0px solid yellow;width:500px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px;margin-left: 50px;">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <!-- <button onclick="enroll_review('주소값');" class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.508) !important;" value="등록">등록하기</button>
                    <button onclick="cancel_review('주소값');"    class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.479) !important;" value="취소">취소하기</button> -->
                </div>
            </div>
        </div>
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
            background: #7e8cd2;
            background: linear-gradient(0deg, #7e8cd2 0%, #7e8cd2 100%);
        }
        .btnStyle:hover {
            color: #7e8cd2;
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
            background: #7e8cd2;
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
            function enroll_review(url){
            var answer;
             answer = confirm("후기를 등록하시겠습니까?");
             if(answer == true){
             location = url;
                }
          }
            
             
            function cancel_review(url){
            var answer;
             answer = confirm("취소시 목록화면으로 돌아갑니다 취소하시겠습니까?");
             if(answer == true){
             location = url;
                }
          }
         </script>



       <!-- 댓글 등록하기폼 -->
        <!-- div로 form을 감아줌 -->
       
        <div  class="comment-editor"  style="margin-top:300px" class="comment-editor"> 
            <form class="form comment-form" 
            action="<%=request.getContextPath()%>/community/insertRC.do"
            onsubmit="return insertComment();">
            
           <textarea id="comment_1" onclick="logInCheck();" name="comment_1" class="commentText" placeholder="댓글을 남겨보세요" style="width:100%;"></textarea>
           <input type="hidden" name="qnaNo" value="<%=r.getReviewNo()%>">
           <input type="hidden" name="qcLevel" value="1"/> <!-- 댓글레벨  -->
           <input type="hidden" name="qnaQcRef" value="0"/>	<!-- 답글이 아니라 그냥 댓글이라서 0 -->
           <input type="hidden" id="commentWriter" name="commentWriter" value="<%=logInMember!=null?logInMember.getMemberId():""%>"><!-- 댓글작성자 아이디 넘기기  -->   				
           <div style="width:100%;">
               <button type="submit" class="submit customBtn btnStyle" id="btn-insert" style="width:80px;height:47px;float:right;"
               		>댓글등록</button>
           </div>
                
            </form>
            <!-- <div>
            비밀댓글<input type="checkbox" style="margin-left: 800px;">
            </div> -->
        </div>


        <!-- 등록된 댓글 -->
          <%if(!rcList.isEmpty()) {%>
    	<%for(ReviewComments rc : rcList) {%>
    	<%if(rc.getReviewCommentLevel()==1) {%>
        <div class="comments level1">
            <div class="comment replies">
              <div class="content">
                <header class="top">
                  <div class="username"><%=rc.getMemberId()%></div>
                  <div class="utility">
                    <!-- 현재버튼의 위치 -->
                    <button class="menu btn-reply customBtn btnStyle" onclick="btnReply(event);" >답글등록</button>  
                    <!-- 관리자와 해당 작성자만 보이게 -->
                    <%if(logInMember!=null&&(logInMember.getMemberId().equals("ADMIN")||logInMember.getMemberId().equals(rc.getMemberId()))) {%>
                    <button class="menu customBtn btnStyle" onclick="deleteComment('<%=rc.getRcNo()%>');">댓글삭제</button>    
                <%} %>
                </div>
                </header>
                <p><%=rc.getRcContents()%></p>
                <ul class="bottom">
                  <li class="menu time"><%=rc.getEnrollDate()%></li>
                  <li class="divider"></li>
                     <%if(rc.getQcCount()!=0) {%>
                   <li class="menu show-reply" onclick="showReply(event);" style="cursor: pointer;" >
                   	답글(<%=rc.getQcCount()%>)
                   </li> 
                   <%} %>
                </ul>
              </div>
            </div>
           
        </div>
          <!-- 이위치에 태그를 추가해줘야함 -->
       <!-- 답글  -->
        <form class="form reply-form" style="display:none;flex-direction:column;align-items:center;" 
         action="<%=request.getContextPath()%>/community/insertRC.do"  onsubmit="return checkReply(event);">
            <textarea id="replyText" name="comment_1" class="commentText" onclick="logInCheck();" placeholder="답글을 남겨보세요"style="width:100%;"></textarea>
	              	<input type="hidden" name="qnaNo" value="<%=r.getReviewNo()%>">
           			<input type="hidden" name="qcLevel" value="2"/> <!-- 댓글레벨 2 -->
           			<input type="hidden" name="qnaQcRef" value="<%=rc.getRcNo()%>"/>	<!-- 답글이라서 해당 댓글번호 -->
           			<input type="hidden" id="commentWriter" name="commentWriter" value="<%=logInMember!=null?logInMember.getMemberId():""%>"><!-- 댓글작성자 아이디 넘기기  -->
	              	<div style="width:100%;">
	                	<button type="submit" class="submit customBtn btnStyle" id="btn-ReplyInsert" style="width:80px;height:47px;float:right;"
	                		>댓글등록</button>
	             	</div>
           
            </form>       
        </div>
        
        
        
      <%}else {%>      
         
           
         
          <!--등록된 답글  -->
        <div class="replies level2" style="border-left:5px solid #ddd;border-right:5px solid #ddd;
        	border-bottom:5px solid #ddd;width:850px;height:auto;margin: 0 auto;display:none;">
        	
            <div class="reply">
              <div class="content">
                <header class="top">
                  <div class="username"><%=rc.getMemberId()%></div>
                  <div class="utility">
                    <%if(logInMember!=null&&(logInMember.getMemberId().equals("ADMIN")||logInMember.getMemberId().equals(rc.getMemberId()))) {%>
						<button class="menu customBtn btnStyle" onclick="deleteQC('<%=rc.getRcNo()%>');">답글삭제</button>    
					<%} %>
                  
                  </div>
                </header>
                <p><%=rc.getRcContents()%></p>
                <ul class="bottom">
                  <li class="menu time"><%=rc.getEnrollDate()%></li>
                </ul>
              </div>
            </div>
            

           <!--  <form class="form reply-form">
              <textarea placeholder="답글을 남겨보세요"></textarea>
              <button type="button" class="submit customBtn btnStyle">등록하기</button>
            </form>        -->
        </div>
       
	    <%} %><!-- 댓글,답글 구별if문  -->
		<%} %>
		<%} %>
       
       
       
       
        <div style="border:0px solid yellow;width:100%;height:30px;"></div>
        <div style="border:0px solid yellow;width:100%;height:20px;">
      <!--   <a href="">다음글</a> -->
        </div>
        <div style="border:0px solid yellow;width:100%;height:20px;">
       <!--  <a href="">이전글</a> -->
        </div>
        <div style="background-color:rgba(128, 0, 128, 0.4);width:100%;height:3px;"></div>
        <div style="border:0px solid yellow;width:100%;height:30px;">
        <button type="button" class="submit customBtn btnStyle">목록</button>
        </div>

        


    </section> 
    
    <script>
  //댓글창 누를 시 로그인멤버 아니면 댓글 못 달게하기  *
	const logInCheck=()=>{
		if(<%=logInMember==null%>){
			Swal.fire({
				title:"로그인 한 사용자만 댓글을 \n등록할 수 있습니다."
				,icon: 'error'});
			$(".commentText").blur();
		}
	}
    
	//댓글등록 버튼 누를 시   *
	const insertComment=()=>{
		//아무것도 작성하지 않으면 재작성 요구
		if($("#comment_1").val().trim()==""){
			Swal.fire("댓글을 작성해주세요.");
			$(".commentText").blur();
			return false;
		}
	}
	
	//댓글에 ->답글 등록 클릭 시    *
	const btnReply=(e)=>{
		$(e.target).parentsUntil("section").find("form").show();
	}
	
	
	//댓글 삭제    *    
	const deleteComment=(qcNo)=>{
		const result=confirm("댓글 삭제 시 댓글에 달린 답글도 전부 삭제됩니다. 삭제하시겠습니까?");
		if(result){//확인버튼 누르면
			location.assign("<%=request.getContextPath()%>/community/DeleteReviewComment.do?qnaNo=<%=r.getReviewNo()%>&qcNo="+qcNo);
		}
	}
	
	
	//답글등록 클릭 시   *
	const checkReply=(e)=>{
		if($(e.target).parent().find("textarea").val().trim()==""){//해당 버튼의 답글을 아무것도 달지 않으면
			Swal.fire("댓글을 작성해주세요.");
			$(".commentText").blur();
			return false;
		}
	}
	
	
	//답글 삭제 *
	const deleteQC=(qcNo)=>{
		const result=confirm("답글을 삭제하시겠습니까?");
		if(result){//확인버튼 누르면
			location.assign("<%=request.getContextPath()%>/community/DeleteReviewComment.do?qnaNo=<%=r.getReviewNo()%>&qcNo="+qcNo);
		}
	}
	
	
	
	
	
	
	
	//답글 버튼 클릭 시 밑에 답글만 열리게 하기
	const showReply=(e)=>{
//			console.log($(e.target).parentsUntil("section").nextUntil(".level1").not("form"));
		$(e.target).parentsUntil("section").nextUntil(".level1").not("form").toggle(300);
		
	}
	
	
	
    
    
    </script>
    
    
    
    
    

    <script>
        // 기능1   로그인안한 유저는  로그인 메뉴로 이동해야한다.

    /* 	$(()=>{
                //1. 스크립트 태그로 만들어야  로그인 상태 분기처리 구문사용해야함
                $(".comment-form>textarea").focus(e=>{
                        confirm("로그인 후 이용할 수 있습니다.");

                        // 계속 focus 메소드가 돌고 있는 중이니까           
                        $(e.target).blur();  //blur 메소드로    focusing을 제거하고   해야함 !!!!1!
                        
                        // offset()으로 태그의 절대 위치를 구한 뒤  즉 로그인메뉴가 있는 div 
                        const offsetstr = $("#loginMenu").offset();
                        
                        // .top으로 해당 태그의 상단으로 50의 속도로 스크롤을 이동시킨다. 
                        //(숫자가 커질수록 속도는 느림)
                        $('html, body').animate({scrollTop : offsetstr.top}, 50); 
                    
    			
    		        });
                    //2.
                    $(".btn-reply").click(e=>{
                        const divP=$("<div>");
                        const form=$(".comment-editor>form").clone();
                        console.log(form);  // 이구문으로 find() 메소드 사용가능
                    
            
                    form.find("textarea").attr({"cols":"40","rows":"1"});
                    form.find("input[name=level]").val("2");  // 레벨 값을 바꾼다
                    form.find("input[name=commentref]").val($(e.target).val()); //레벨값을 바꾼다
                    
                    
                    // const checkboxDiv=form.parent().find("div");
                    // checkboxDiv.appendTo(divC);

                    // 안되면;  지우기 또는  .widh()메소드 사용
                
                    const divC=$("<div>").attr("style","width:100%;").append(form);//form을 divC에 집어넣는다.
                       
                       
                        divP.append(divC);//생성한 divP에 divC를 집어넣음
                       
                        divP.find("divC").css("display","none");//divC 처음에 보이지 않음
                        
                        // A insertAfter  B   A를  B밑에  집어넣라  형제태그로서(동등위치)
                        //일단 parents("header")를 이용해서 가장 가까운 header를 찾는다
                        // 그다음 parent() 메소드를 2번 사용하여   위치를 지정하고
                        //형제 태그로서  그밑에 집어넣는다.
                        divP.insertAfter($(e.target).parents("header").parent()).children("divC").slideDown(1000);
                        $(e.target).off("click");
    		
                     });
            
            }) */
      </script> 
    
    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<%@include file="/views/community/readReviewFooter.jsp" %>
<%@include file="/views/common/footer.jsp" %>
    