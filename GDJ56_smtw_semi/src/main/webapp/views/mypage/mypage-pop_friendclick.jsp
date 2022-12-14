<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.mypage.model.vo.MemberInfo" %>

<%
	String friendName = (String)request.getParameter("friendName");
	String friendAge = (String)request.getParameter("friendAge");
	String friendGender = (String)request.getParameter("friendGender");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <div id="top" width=417,height=385>
        <div height="300">
            <img src="<%=request.getContextPath()%>/images/mypage/prfile_pics.png" id="psc" alt="" width="200" height="200">
            <img src="<%=request.getContextPath()%>/images/mypage/mail.png" id="mail" width="60" height="60" alt="" onclick="">
        </div>
        
        <div height="117" id="text"><h2><%=friendName %>(<%=friendAge %>/<%=friendGender %>)</h2> 
           <br>
        </div>
        <button onclick="window.close()">닫기</button>
        
    </div>
    

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
            top: 235px;
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
</body>
</html>