<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/review.css"/>


 <!-- 부트스트랩 CSS -->
   
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>


<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
    <script src="js/jquery-3.6.1.min.js"></script>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


<%@include file="/views/community/enrollReviewHeader.jsp" %>


    <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section id="review-container">
        <div>
            <form  id="reviewfrm" action="<%=request.getContextPath()%>/community/enrollReviewEnd.do" method="post"   enctype="multipart/form-data">
                <table id="tbl-review">
                <input name="userId"  type="hidden" readonly value="<%=logInMember.getMemberId()%>">
                <tr>
                    <th>제 목</th>
                    <td><input   name="reviewTitle"  id="title"  type="text" placeholder="제목" size="65"></td>
                </tr>
                <tr>
                    <th>나라</th>
                    <td>
                        <select   name="reviewNation"  required   id="nation" class="form-select" aria-label="Default select example" style="box-shadow: 0 4px 2px -2px rgba(221, 160, 221, 0.304) !important;;">
                            
                            <!-- <input  name="reviewNationValue"  type="hidden"> -->
                            
                            <option selected>분류</option>
                            <option value="네덜란드">네덜란드</option>
                            <option value="스웨덴">스웨덴</option>
                            <option value="이스라엘">이스라엘</option>
                            <option value="포르투칼">포르투칼</option>

                            <option value="뉴질랜드">뉴질랜드</option>
                            <option value="스페인">스페인</option>
                            <option value="이탈리아">이탈리아</option>
                            <option value="폴란드">폴란드</option>

                            <option value="대만">대만</option>
                            <option value="아르헨티나">아르헨티나</option>
                            <option value="일본">일본</option>
                            <option value="프랑스">프랑스</option>

                            <option value="덴마크">덴마크</option>
                            <option value="아일랜드">아일랜드</option>
                            <option value="체코">체코</option>
                            <option value="헝가리">헝가리</option>

                            <option value="독일">독일</option>
                            <option value="영국">영국</option>
                            <option value="칠레">칠레</option>
                            <option value="호주">호주</option>

                            <option value="벨기에">벨기에</option>
                            <option value="오스트리아">오스트리아</option>
                            <option value="캐나다">캐나다</option>
                            <option value="홍콩">홍콩</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>도시</th>
                    <td><input  name="reviewCity"  id="city" type="text" placeholder="도시" size="65"></td>
                </tr>
                <tr>
                    <th>만족도</th>
                    <td>
                        <input   name="reviewSat"  id="sat" type="range" placeholder="만족도" size="65" min="1" max="5" step="1" oninput="document.getElementById('value1').innerHTML=this.value;">
                        <span id="value1"></span>
                    </td>
                </tr>
                 <tr>
                    <th>대표사진</th>
                    <td><input  name="upFile"   type="file" placeholder="" size="65"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <div class="cont">
                            <textarea  style="width:100%;"  style="height:100%;"   name="summernote" id="summernote" placeholder="내용 입력"></textarea>
                        	<!-- rows="10" cols="100" -->
                        </div>
                    </th>
                </tr>
                <!-- <tr>
                    <th>비밀글</th>
                    <td>
                        <input type="radio" name="secret" id="open">
                        <label for="open">공개글</label>
                        <input type="radio" name="secret" id="close">
                        <label for="close">비밀글</label>
                    </td>
                </tr> -->
                <input type="submit"  style="display:none" >
                
                </table>
                <div class="bt_wrap">
                    <!-- <a href="">취소</a> -->
                    <!-- <a  onclick="chk_form(this.form))" href="" class="on">등록</a> -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    			<button onclick="enroll_review(this.form);" class="customBtn btnStyle btn btn-primary" type="button" style="margin-left:690px;background-color: rgba(221, 160, 221, 0.508) !important;" value="등록">&nbsp등록&nbsp</button>
                    			<button onclick="cancel_review();" class="customBtn btnStyle btn btn-primary" type="button" style=" background-color: rgba(221, 160, 221, 0.508) !important;" value="취소">&nbsp취소&nbsp</button>
                			</div>
                    
                </div>
            </form>
        </div>
    </section>
    <script>
    function enroll_review(f){
		//입력 안 된 값이 있으면 알림	
    	if(document.getElementById("title").value==''){
    		alert("제목을 입력해주십시오.");
    		return false;
    	}	
		
		
		
		if(document.getElementById("nation").select=='selected'){
    		alert("나라를 선택해주십시오.");
    		return false;
    	} 
		
		
		if(document.getElementById("city").value==''){
    		alert("도시를 입력해주십시오.");
    		return false;
    	}
		
    	 if(document.getElementById("value1").value==''){
		alert("만족도를 입력해주십시오.");
		return false;
		
    	 } 
    	
    	
		
	
		
		
    	if(document.getElementById("summernote").value==''){
    		alert("텍스트를 입력해주십시오.");
    		return false;
    	}
    	
    	
		
			let answer;
			answer=confirm("리뷰를 등록하시겠습니까?");
			if(answer==true){
				f.submit();
			}
		
	}
    
    function cancel_review(url){
		location.assign("<%=request.getContextPath()%>/community/reviewBasic.do");
	}
    
   
   
    
    </script>
    
    
    
    
    <script>
        $(function(){
        //직접입력 인풋박스 기존에는 숨어있다가
            $("#selboxDirect").hide();
            $("#email").change(function() {
                //직접입력을 누를 때 나타남
                if($("#email").val() == "direct") {
                    $("#selboxDirect").show();
                }else {
                    $("#selboxDirect").hide();
                }
            }) 
        });

        //글작성에디터
        $(document).ready(function() {
            $('#summernote').summernote({
                tablesize :2,
                height:500
            });
        });
    </script>
    <style>
        .bt_wrap {
            margin-top: 30px;
            text-align: center;
            font-size: 0;
         }
        .bt_wrap a {
            display: inline-block;
            min-width: 80px;
            margin-left: 10px;
            padding: 10px;
            border-radius: 2px;
            font-size: 1.4rem;
            float: right;
        }
         
        .bt_wrap a:first-child {
            background: rgb(214, 214, 212);
            color: #fff;
        }
         
        .bt_wrap a.on {
            background: rgb(238, 198, 88);
            color: #fff;
        }
        
        /* section#notice-review{width:800px; margin:0 auto; text-align:center;} */
        section#notice-review h2{margin:10px 0;}
        table#tbl-review{width:800px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
        table#tbl-review th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
        table#tbl-review td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
        </style>


    
   
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
            height: 900px; 
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            border: 0px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>

    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

   <%@include file="/views/common/footer.jsp" %>