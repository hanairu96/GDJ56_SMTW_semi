<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/searchIdPwd.css"/>
<section>
	<div class="container py-4">
	    <div class="row align-items-center justify-content-between" id="insert">
	        <a href="" class="text-dark h4">아이디 찾기</a>
	        <a href="" class="text-dark h4">비밀번호 찾기</a>
	    </div>
	    <form>
	        <small id="emailHelp" class="form-text text-muted">
	            가입 당시 입력한 <b>이메일</b>을 통해 비밀번호를 재설정해주세요.<br>
	            비밀번호는 고객님의 소중한 개인정보로 고객센터에서 안내 또는 수정이 불가합니다.
	        </small>
<!-- 	        <div class="form-group"> -->
<!-- 	       		<label for="exampleInputId" class="form-label mt-4">아이디　　</label> -->
<!-- 	            <input type="text" class="" id="exampleInputId" aria-describedby="emailHelp" > -->
<!-- 	        </div> -->
	        <div class="form-group">
	       		<label for="exampleInputName" class="form-label mt-4">이름　　　</label>
	            <input type="text" class="" id="exampleInputName" aria-describedby="emailHelp">
	        </div>
	        <div class="form-group">
	               <label for="exampleInputEmail" class="form-label mt-4">이메일　　</label>
	            <input type="email" class="" id="exampleInputEmail" aria-describedby="emailHelp">
	            <input type="button" aria-describedby="emailHelp"  value="인증번호">
	        </div>
	        <div class="form-group">
	            <label for="exampleInputNum" class="form-label mt-4">인증번호　</label>
	         <input type="text" class="" id="exampleInputNum" aria-describeby="emailHelp"><br>
	         <span class="obli">인증번호를 발송했습니다. 인증번호를 입력해주세요.</span>
	        </div> 
	        <div id="insert">
	            <div class="d-grid">
	                <button id="searchIdPwd" class="customBtn btnStyle" type="submit">다음</button>
	            </div>
	        </div>
	
	    </form>
	</div>
</section>

<%@include file="/views/common/footer.jsp" %>