<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.Note" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%
	Note n = (Note)request.getAttribute("n");
	String id = (String)request.getAttribute("id");
%>

    	<div height="300">
        	<h2 style="margin-left: 35%;"><span style="background-color:cornflowerblue; color: aliceblue;">받은 쪽지</span></h2>
    	</div>
    
    	<form name="form" action="" method="post">
   	 		<div id="box">
   	 			<input type="hidden" name="sender" value="<%=n.getSender() %>">
   	 			<input type="hidden" name="userId" value="<%=id %>">
   	 			<input type="hidden" name="friendName" value="<%=n.getSenderName() %>">
    			<p>보낸사람 : <%=n.getSenderName() %>(<%=n.getSender() %>)</p>
    			<p id="noteDate" style="color: gray;">보낸날짜 : <%=n.getDate() %></p> <br><br>
    		<textarea name="" id="" cols="75" rows="30" readonly> <%=n.getContent() %></textarea>
    		</div>
		</form>
	
    	<button id="ntback" onclick="goReply(event)" name="ntback"> 답장하기 </button>
    	
     <script>
       function goReply(e){
           var gsWin=window.open("","winName","width=520,height=630"); //open("주소",띄우는방식,크기)
           var frm=$(e.target).prev()[0];
           console.log(frm);
           frm.action="<%=request.getContextPath()%>/mypage/mypageNoteReply.do";
           frm.target="winName";
           frm.submit();
       }
       
       function goRemove(e){
           var gsWin=window.open("","winName","width=520,height=630"); //open("주소",띄우는방식,크기)
           var frm=$(e.target).prev().find("form")[0];
           frm.action="<%=request.getContextPath()%>/mypage/mypageNoteRemove.do";
           frm.target="winName";
           frm.submit();
       }
     </script>

	<button onclick="window.close()" id="close"> 닫기 </button> 
	

<style>
    #noteDate{
        
        position: absolute;
        right: 50px;
        top: 45px;

    }
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
    #close{
        position: absolute;
        left: 50%;
        top: 93%;
        width: 60px;
        height: 30px;
    }
    #ntback{
     position: absolute;
        left: 3%;
        top: 88%;
        width: 70px;
        height: 30px;
    }
    #ntremove{
     position: absolute;
        left : 18%;
        top: 88%;
        width: 70px;
        height: 30px;
    }    
    
</style>