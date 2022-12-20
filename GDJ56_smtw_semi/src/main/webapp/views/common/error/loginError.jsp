<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body>
	<script>
		Swal.fire({ 
			title:"로그인 시에만 \n이용할 수 있는 서비스 :(",
			icon:"error",
			 confirmButtonText: '확인'})
				.then((result)=>{
						if(result.isConfirmed){
							location.assign(document.referrer); 
						}
		})
		
	</script>
</body>
</html>