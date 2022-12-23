<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.MemberInfo" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<%
	String sender = (String)request.getParameter("friendId");
	String friendName = (String)request.getParameter("friendName");
	String friendAge = (String)request.getParameter("friendAge");
	String friendGender = (String)request.getParameter("friendGender");
	String userId = (String)request.getParameter("userId");

%>

    
    <div id="top" width=417,height=385>
      <div height="300">
    	<form name="form" action="" method="post">
        		<input type="hidden" name="sender" value=<%=sender %>>
        		<input type="hidden" name="friendName" value=<%=friendName %>>
        		<input type="hidden" name="userId" value=<%=userId %>>
            	<img src="<%=request.getContextPath()%>/images/mypage/prfile_pics.png" id="psc" alt="" width="200" height="200">
        </form>
            	<img src="<%=request.getContextPath()%>/images/mypage/mail.png" id="mail" width="60" height="60" alt="" onclick="goPopup(event)">
       </div>
        <div height="117" id="text"><h2><%=friendName %>(<%=friendAge %>/<%=friendGender %>)</h2> 
           <br>
        </div>
        <button onclick="window.close()">닫기</button>
        
    </div>
    
	<script>
       function goPopup(e){
           var gsWin=window.open("","winName2","width=500,height=600"); //open("주소",띄우는방식,크기)
           var frm=$(e.target).prev()[0];
           console.log(frm);
           frm.action="<%=request.getContextPath()%>/mypage/mypageNoteReply2.do";
           frm.target="winName2";
           frm.submit();
        }
    </script>
	
    <style>
        #psc{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 25px;
            left: 110px;
        }
        #mail{
            /* border: 1px solid;
            border-bottom: 3px solid; */

            position: absolute;
            top: 200px;
            left: 300px;
            cursor:pointer

        }
        #text{
            position: absolute;
            top: 230px;
            left: 140px;
        }
        button{
            position: absolute;
            top: 310px;
            left: 190px;
            cursor:pointer
        }
        
        
    </style>
