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

   
</head>
<body>
    <form id="myform">
        <div>
            <img id="popupImg" onclick="javascript();" src="<%=request.getContextPath() %>/images/팝업창 사진.jpg" alt="" width="200px", height="235px">
        </div>
        <input type="checkbox" name="popclose" value="">하루동안 이 창을 열지않음
        <button onclick="closeWin();">닫기</button>
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
 <script>
 		// 쿠키를 만듭니다. 아래 closeWin() 함수에서 호출됩니다
	    function setCookie( name, value, expiredays ) 
		{ 
				var todayDate = new Date();
				todayDate.setDate( todayDate.getDate() + expiredays ); 
				document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
				//toGMTString() : GMT시간으로 기록됨 즉, GMT+9=>한국시간, 찾아보니까 toUTCString()을 쓰라고 하는데 UTC로는 쿠키가 생성되지 않아서 그냥 GMT로 했음,,ㅎ
				
		}
	
		// 체크후 닫기버튼을 눌렀을때 쿠키를 만들고 창 닫음
		function closeWin() 
		{ 
				if (document.querySelector("input[name=popclose]").checked){
					console.log("체크함")
					setCookie("popclose","done",1);  //1일
					
				}
			close();
		} 
		// --> 
        
        function javascript(){//현재창에서 다른페이지로 이동
            opener.location.replace("<%=request.getContextPath()%>/mycountry/myCountry.do");    
        	close();
        }
    </script>    

</body>
</html>