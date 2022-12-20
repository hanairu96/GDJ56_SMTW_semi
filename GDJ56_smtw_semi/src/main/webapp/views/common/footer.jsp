<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap">
        <footer onclick="footerClick();">    
            <p>
                <span id="footmain">SHOW ME THE WAY</span><br>
                <span id="foot">상호명 : SHOW ME THE WAY</span><br>
                <span id="foot">전화: 02-2108-5900</span><br>
                <span id="foot">운영시간 항시대기 언제든 전화주세요</span><br>
                <span id="foot">본관 : (08505) 서울특별시 금천구 가산디지털2로 115 (가산동. 대륭테크노타운3차) 811호</span>
            </p>
        </footer>
    </div>

<script>
	const footerClick=()=>{
		 location.assign("<%=request.getContextPath()%>/holiday/holidayRoad.do");
	}
</script>

</body>

</html>