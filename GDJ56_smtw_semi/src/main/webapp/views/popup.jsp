<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팝업창</title>
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <script>
        function setCookie( name, value, expiredays ){
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays );
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }
        function closeWin(){
            if ( document.myform.event.checked )
            setCookie("memo", "no" , 1); // 1일 간 쿠키적용
        }
        
        function javascript(){//현재창에서 다른페이지로 이동합니다.
            opener.location.replace("<%=request.getContextPath()%>/mycountry/myCountry.do");    
        	close();
        }
    </script>    
</head>
<body onunload="closeWin()" >
    <form id="myform">
        <div>
            <img id="popup" onclick="javascript();" src="<%=request.getContextPath() %>/images/팝업창 사진.jpg" alt="" width="400px", height="435px">
        </div>
        <input type="checkbox" name="event">다음부터 이 창을 열지않음
        <input type=button value="닫기" onclick="self.close()">
    </form>
    
    <style>
    	#popup{
    	display: block;
    	margin: 0 auto;
    	}
    	#myform{
    		padding: 0;
    		overflow: hidden;
    	}
        html{
            font-family: "Hahmlet";
        }
        img#popup{
            cursor: pointer;
        }
    </style>


</body>
</html>