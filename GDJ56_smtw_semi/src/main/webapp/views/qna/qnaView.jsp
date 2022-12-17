<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.member.model.vo.Member,java.util.List,com.smtw.qna.model.vo.*" %>
<%
	Qna q=(Qna)request.getAttribute("qna");
	List<Qna> list=(List<Qna>)request.getAttribute("qnaList");
%>
<%@include file="/views/common/header.jsp" %>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/qnaView.css"/>

<section>
<div style="height:auto;">
	<div style="display:flex;border: 0px;">
	    <div style="border:0px solid red;width:100%;height:auto;display:flex; ">
	     <div style="border:0px solid green;width:1390px;;height:auto;margin: 0 auto;">
	         <div style="border:0px solid pink;width:950px;height:140px;margin: 0 auto;">
	             <div>
	                 <form action="" method="post">
	                     <table id="tbl-notice">
	                     <tr>
	                         <td style="border-left: 0px; padding-left: 40px;" colspan="2">
	                             <a href="<%=request.getContextPath() %>/qna/qnaList.do" style="color:#7e8cd2" >
	                             	<small>&raquo;&nbsp;질문하기</small>
	                             </a>
	                         </td>
	                     </tr>
	                     <tr>
	                         <th>제 목</th>
	                         <td><span id="insertTitle"><%=q.getReviewTitle()%></span></td>
	                     </tr>
	                     
	                     <tr>
	                         <th>작성자</th>
	                         <td><span id="insertWriter"><%=q.getMemberId()%></span></td>
	                     </tr>
	                     <tr>
	                         <th><small style="color: #bebebe;">작성일</small></th>
	                         <td>
	                             <span id="enroll_date"><small style="color: #bebebe;"><%=q.getEnrollDate()%></small></span>
	                         </td>
	                     </tr>
	                     
	                     
	                     </table>
	                     
	                 </form>
	             </div>
	           
	         </div>
	         <div style="border:0px solid pink;width:950px;height:auto;margin: 0 auto;margin-top: 30px; ">
	           
	             <div style="padding:30px;border:1px solid lightgray;width:800px;height:auto;border-radius:10px;margin-left:75px;">
	                <%=q.getReviewContents() %>
	             </div> 
	         </div>
	         <%if(logInMember!=null&&(logInMember.getMemberId().equals(q.getMemberId())||logInMember.getMemberId().equals("ADMIN"))){ %>
	         <div style="display:flex; border:0px solid rgb(15, 231, 231);width:900px;height:auto;margin: 0 auto;">
	             <div style="border:0px solid yellow;width:800px;height:60px;margin:0 auto;margin-top: 10px;">
	                 <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                 <%if(logInMember.getMemberId().equals(q.getMemberId())){ %>
	                     <button onclick="location.assign('<%=request.getContextPath() %>/qna/modifyQna.do?qnaNo=<%=q.getQnaNo()%>');" class="customBtn btnStyle" type="button" value="수정">수정하기</button>
	                  <%} %>    
	                     <button onclick="deleteQna();"    class="customBtn btnStyle" type="button"value="삭제">삭제하기</button> 
	                 </div>
	             </div>
	         </div>
	         <%} %>
	         <div style="border-top:0px solid #7e8cd2;width:850px;height:20px;margin:0 auto;margin-top: 30px; padding-left: 20px;padding-bottom: 30px;padding-top: 10px;">
	             <%if(list.size()==3) {%>
                 	<a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=list.get(2).getQnaNo()%>" style="color:#7e8cd2">△ 다음글</a>
				<%} else{%>
                	<a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=list.get(1).getQnaNo()%>" style="color:#7e8cd2">△ 다음글</a>
				<%} %>
	         </div>
	         <div style="border-bottom:1px solid #7e8cd2;width:850px;height:20px;margin: 0 auto; padding-left: 20px;padding-bottom: 30px;">
	             <%if(list.size()==3) {%>
	             	<a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=list.get(0).getQnaNo()%>" style="color:#7e8cd2">▽ 이전글</a>
                <%} else{%>
					<a href="<%=request.getContextPath()%>/qna/qnaView.do?qnaNo=<%=list.get(0).getQnaNo()%>" style="color:#7e8cd2">▽ 이전글</a>
                <%} %>
	         </div>
	         <div style="border:0px solid blue;width:850px;height:40px;margin: 0 auto;">
	         	<button onclick="location.assign('<%=request.getContextPath() %>/qna/qnaList.do');" type="button" id="qnaList" class=" customBtn btnStyle"
	               style="margin-top: 10px;height: 30px;line-height: 20px;margin-left: 10px;">목록</button>
	             </div>
	         </div>  
        </div>
    </div>
</div>
<script>
	const deleteQna=()=>{
		const result=confirm("Q&A글을 삭제하시겠습니까?");
		if(result){
			location.assign('<%=request.getContextPath() %>/qna/deleteQna.do?qnaNo=<%=q.getQnaNo()%>');
		}else{
			return false;
		}
	}
</script>

	<!-- 댓글 등록하기폼 -->
	<!-- div로 form을 감아줌 -->
	
	<div class="comment-editor" style="border:0px solid green;width:850px;height:auto;margin: 0 auto;margin-top:50px;"> 
	  
	   <form class="form comment-form" style="display:flex;flex-direction:column;align-items:center;">
           <textarea placeholder="댓글을 남겨보세요" style="width:100%;"></textarea>
           <input type="hidden" name="boardref" value="">
           <input type="hidden" name="level" value="1"/>
           <input type="hidden" name="commentref" value="0"/>
           <input type="hidden" name="commentWriter" value="">   				
           <div style="width:100%;">
               <button type="button" class="submit customBtn btnStyle" id="btn-insert" style="width:80px;height:47px;float:right;">댓글등록</button>
           </div>
	    </form>
	</div>
    <!-- 등록된 댓글 -->
	<div class="comments level1" style="border:0px solid green;width:850px;height:auto;margin: 0 auto;">
	   <div class="comment replies" style="border:5px solid #ddd;width:850px;height:auto;margin: 0 auto;background-color: #f2f2f2;margin-bottom:10px;margin-top:10px;">
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
	              <li class="menu show-reply">답글 (1)</li> 
	            </ul>
			</div>
		</div>            
            <!-- 이위치에 태그를 추가해줘야함 -->
	</div>
	
          <!--등록된 답글  -->
        <div class="replies level2" style="border-left:5px solid #ddd;border-right:5px solid #ddd;border-bottom:5px solid #ddd;width:850px;height:auto;margin: 0 auto;">
            <div class="reply">
              <div class="content">
              	<header class="top">
                	<div class="username">워홀러</div>
              		<div class="utility"> 
                		<button class="menu">메뉴</button>
               		</div>
                </header>
	                <p>감사!!</p>
	                <ul class="bottom">
	                  <li class="menu time">2022-12-06</li>
	                </ul>
         		</div>
         	</div>
            
            <form class="form reply-form"style="display:flex;flex-direction:column;align-items:center;">
              <textarea placeholder="답글을 남겨보세요"style="width:100%;"></textarea>
              <div style="width:100%;">
                <button type="button" class="submit customBtn btnStyle" style="width:80px;height:47px;float:right;">댓글등록</button>
             </div>
            </form>       
	</div> 
</section>

<%@include file="/views/common/footer.jsp" %>