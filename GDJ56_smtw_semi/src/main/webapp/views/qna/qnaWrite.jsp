<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/qnaWrite.css"/>
	<section id="notice-container">
        <div>
            <form action="<%=request.getContextPath()%>/qna/qnaWriteEnd.do" method="post" onsubmit="return fn_summernote();">
                <h2>Q&A 글쓰기</h2>
                <table id="tbl-notice">
                <tr>
                    <th>제 목</th>
                    <td><input type="text" name="qnaTitle" placeholder="제목" size="65" required></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=logInMember.getMemberId()%>
                        <input type="hidden" name="qnaWriter" value=<%=logInMember.getMemberId()%>>
                    </td>
                </tr>
<!--                 <tr> -->
<!--                     <th>이메일</th> -->
<!--                     <td> -->
<!--                         <input type="text" name="qnaEmail_1" size="30"> @  -->
<!--                         <select name="qnaEmail_2" id="email"> -->
<!--                             <option value="naver.com">naver.com</option> -->
<!--                             <option value="gmail.com">gmail.com</option> -->
<!--                             <option value="hanmail.net">hanmail.net</option> -->
<!--                             <option value="direct">직접입력</option> -->
<!--                             <input type="text" id="selboxDirect" name="selboxDirect"/> 정규식 처리 필요!!!!!!  -->
<!--                         </select> -->
<!--                     </td> -->
<!--                 </tr> -->
                <tr>
                    <th colspan="2">
                        <div class="cont">
                            <textarea rows="10" cols="100" name="summernote" id="summernote"></textarea>
                        </div>
                    </th>
                </tr>
                </table>
                <div class="bt_wrap">
                    <button type="reset" onclick="fn_writeReset();" class="customBtn btnStyle">취소</button>
                    <button type="submit" class="on customBtn btnStyle">등록</button>
                </div>
            </form>
        </div>
    </section>
    <script>
		//글 작성 안하면 못 넘어가게 하기
		const fn_summernote=()=>{
			if($("#summernote").summernote().val()==""){
				alert("내용을 입력해주세요.");
				return false;
			}
		};
		//글 작성 취소 시 반응
    	const fn_writeReset=()=>{
    		const result=confirm("글 작성을 취소하시겠습니까?");
    		if(result){
    			location.replace('<%=request.getContextPath()%>/qna/qnaList.do');
    		}
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
<%@include file="/views/common/footer.jsp" %>