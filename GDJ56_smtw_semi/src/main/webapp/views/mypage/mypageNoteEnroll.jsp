<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = (String)request.getAttribute("memberId");
	String receiver = (String)request.getAttribute("receiver");
	String receiverName = (String)request.getAttribute("receiverName");
%>
<div id="top" width=417 height=385>
    <div height="300">
        <h2 style="margin-left: 35%;"><span style="background-color:cornflowerblue; color: aliceblue;">쪽지 보내기</span></h2>
    </div>
    
    <div id="box">
    <form action="<%=request.getContextPath()%>/mypage/mypageNoteEnrollEnd.do">
    <input type="hidden" name="receiver" value="<%=receiver %>">
    <p>받는사람 : <input type="text" name="" id="receiver" value="<%=receiver %>(<%=receiverName %>)" style="padding: 2px;" readonly></p> <br>
    <textarea name="context" id="context" cols="75" rows="30"></textarea><br>
    <input type="hidden" name="memberId" value="<%=memberId %>">
    <button onclick="">보내기</button>
	</form>
    </div>
    
</div>
<style>
    #box>textarea{
        
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);

    }
    #box>input{
        position: absolute;
        left: 15%;
    }
    button{
        position: absolute;
        left: 50%;
        top: 93%;
        width: 60px;
        height: 30px;
    }
</style>