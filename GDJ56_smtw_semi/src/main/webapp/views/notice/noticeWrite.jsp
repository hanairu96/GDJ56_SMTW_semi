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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/noticeWrite.css"/>
	<section id="notice-container">
        <div>
            <form action="<%=request.getContextPath()%>/notice/noticeWriteEnd.do" method="post">
                <h2>공지사항 글쓰기</h2>
                <table id="tbl-notice">
                <tr>
                    <th>제 목</th>
                    <td><input type="text" name="noticeTitle" placeholder="제목" size="65" required></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><%=logInMember.getMemberId()%>
                        <input type="hidden" name="noticeWriter" value=<%=logInMember.getMemberId()%>>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <div class="cont">
                            <textarea rows="10" cols="100" name="summernote" id="summernote" required></textarea>
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
    	const fn_writeReset=()=>{
    		const result=confirm("글 작성을 취소하시겠습니까?");
    		if(result){
    			location.replace('<%=request.getContextPath()%>/notice/noticeList.do');
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