<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/review.css"/>

	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
    

    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    

<script src="http://code.jquery.com/jquery-3.6.1.min.js"> </script> 
	
<%@ page import="com.smtw.review.model.vo.Review" %>   

<%
	Review  r=(Review)request.getAttribute("readReview");
	
%>

<%@include file="/views/common/header.jsp" %>

    <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section>
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
                    <button onclick="update_check('주소값');"   class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.508) !important;" value="수정">수정하기</button>
                    <button onclick="delete_check('주소값');" class="btn btn-primary customBtn btnStyle" type="button" style=" background-color: rgba(221, 160, 221, 0.479) !important;" value="삭제">삭제하기</button>
                </div>
            </div>
        </div>       
        </div>
        <script>
           function update_check(url){
           var answer;
            answer = confirm("후기를 수정하시겠습니까?");
            if(answer == true){
			location = url;
		       }
         }
           
            
           function delete_check(url){
           var answer;
            answer = confirm("후기를 삭제하시겠습니까?");
            if(answer == true){
			location = url;
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
                                
                                 <img src="<%=request.getContextPath() %>/upload/<%=r.getReviewFileName() %>" alt="" style="width: 50%;height:50%;margin:auto; display:block;border-radius:20px;">
                                </div>
                                <div style="border:1px solid rgba(137, 43, 226, 0.301);width:950px;height:55%;text-align:center;border-radius:20px;;">
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
       
        <div class="comment-editor"> 
           
            <form class="form comment-form">
                    <textarea placeholder="댓글을 남겨보세요"></textarea>
                    <input type="hidden" name="boardref" value="">
                    <input type="hidden" name="level" value="1"/>
                    <input type="hidden" name="commentref" value="0"/>
                    <input type="hidden" name="commentWriter" value="">   				
                    <button type="button" class="submit  customBtn btnStyle" id="btn-insert">등록</button>
            </form>
            <!-- <div>
            비밀댓글<input type="checkbox" style="margin-left: 800px;">
            </div> -->
        </div>


        <!-- 등록된 댓글 -->
         
        <div class="comments level1">
            <div class="comment ">
              <div class="content">
                <header class="top">
                  <div class="username">이동훈</div>
                  <div class="utility">
                    <!-- 현재버튼의 위치 -->
                    <button class="menu btn-reply customBtn btnStyle">답글등록</button>  
                    <!-- 관리자와 해당 작성자만 보이게 -->
                    <button class="menu customBtn btnStyle">댓글삭제</button>    
                </div>
                </header>
                <p>잘봤습니다.잘 보고 가요 !!</p>
                <ul class="bottom">
                  <li class="menu time">2022-12-05</li>
                  <li class="divider"></li>
                  <!-- <li class="menu show-reply">답글 (1)</li> -->
                </ul>


              </div>
            </div>
            
            <!-- 이위치에 태그를 추가해줘야함 -->
        
        
        
        </div>
        
        
          <!--등록된 답글  -->
        <div class="replies level2">
            <div class="reply">
              <div class="content">
                <header class="top">
                  <div class="username">워홀러</div>
                  <div class="utility">
                    <!-- <button class="menu">메뉴</button> -->
                  </div>
                </header>
                <p>감사!!</p>
                <ul class="bottom">
                  <li class="menu time">2022-12-06</li>
                </ul>
              </div>
            </div>
            

            <form class="form reply-form">
              <textarea placeholder="답글을 남겨보세요"></textarea>
              <button type="button" class="submit customBtn btnStyle">등록하기</button>
            </form>       
        </div>
       
       
       
        <div style="border:0px solid yellow;width:100%;height:30px;"></div>
        <div style="border:0px solid yellow;width:100%;height:20px;">
        <a href="">다음글</a>
        </div>
        <div style="border:0px solid yellow;width:100%;height:20px;">
        <a href="">이전글</a>
        </div>
        <div style="background-color:rgba(128, 0, 128, 0.4);width:100%;height:3px;"></div>
        <div style="border:0px solid yellow;width:100%;height:30px;">
        <button type="button" class="submit customBtn btnStyle">목록</button>
        </div>

        


    </section> 
    

    <script>
        // 기능1   로그인안한 유저는  로그인 메뉴로 이동해야한다.

    	$(()=>{
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
            
            })
      </script> 
    
    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<%@include file="/views/community/readReviewFooter.jsp" %>
<%@include file="/views/common/footer.jsp" %>
    