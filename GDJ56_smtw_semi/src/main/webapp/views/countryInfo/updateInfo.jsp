<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.country.model.vo.CountryPageInfo" %>
    <%
    CountryPageInfo cp=(CountryPageInfo)request.getAttribute("coinfo");
    %>
<%@ include file="/views/common/header.jsp" %>
<style>
    #insertpage{
        max-width: 800px;
        margin:0 auto;
        /* text-align:center; */
    }
    #twobu{
        /* max-width: 800px; 
        margin:0 auto;  */
        padding-right: 20%;
    }
    #twobu>*{
        position: relative;
        left: 80%;
    }
    #twobu>button{
        width:100px;
    }
    .customBtn {
        color: #fff;
        border-radius: 5px;
        padding: 10px 25px;
        font-family: 'Lato', sans-serif;
        font-weight: 500;
        background: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
        display: inline-block;
        box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
        7px 7px 20px 0px rgba(0,0,0,.1),
        4px 4px 5px 0px rgba(0,0,0,.1);
        outline: none;
        }
    .btnStyle {
        line-height: 42px;
        padding: 0;
        border: none;
        background: #7e8cd2;
        background: linear-gradient(0deg, #7e8cd2 0%, #7e8cd2 100%);
    }
    .btnStyle:hover {
        color: #7e8cd2;
        background: transparent;
        box-shadow:none;
    }
    .btnStyle:before,.btnStyle:after{
        content:'';
        position:absolute;
        top:0;
        right:0;
        height:2px;
        width:0;
        background: #7e8cd2;
        box-shadow:
        -1px -1px 5px 0px #fff,
        7px 7px 20px 0px #0003,
        4px 4px 5px 0px #0002;
        transition:400ms ease all;
    }
    .btnStyle:after{
        right:inherit;
        top:inherit;
        left:0;
        bottom:0;
    }
    .btnStyle:hover:before,.btnStyle:hover:after{
        width:100%;
        transition:800ms ease all;
    }
    
     section{
     border: 1px solid tomato;
     
     margin-left: 50px;
     margin-right: 50px;
     padding-left: 100px;
     padding-right: 100px;
     /* 
         만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
         좌우 간격을 조정하세요
         왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
      */
     margin-top: 100px;
     height: 900px; 
     /*
         ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
         높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
     */
         
    }
</style>
<section>
    <form action="<%=request.getContextPath()%>/countryinfo/updatecoinfo.do"
     enctype="multipart/form-data" method="post">
    <div id="insertpage">
        <fieldset>
            <legend><h1 style="text-align: centers;">국가정보 수정 페이지</h1></legend>
            	<div>
            		나라이름 : <%=cp.getNName() %>
            		<br><input type="hidden" name="nName" value="<%=cp.getNName() %>" readonly>  
            	</div>
            	<br>
                <div>
                    국기사진
                    <br><input type="file" name="cimage" >
                </div> 
                <br>
                <div>
                    언어 
                    <br><inpuT type="text" name="langagecountry" value="<%=cp.getCLanguage() %>" placeholder="예시) 영어, 프랑스어, 독일어"></inpuT>
                </div>
                <br>
                <div>
                    수도 
                    <br><inpuT type="text" name="urban" value="<%=cp.getUrban() %>" placeholder="예시) 암스트르담"></inpuT>
                </div>
                <br>
                <div>
                    화폐단위 
                    <br><inpuT type="text" name="moneycountry" value="<%=cp.getMoney() %>" placeholder="예시) 유로(Euro, €, EUR)" ></inpuT>
                </div>
                <br>
                <div>
                    전기 
                    <br><inpuT type="text" name="elect" value="<%=cp.getElect() %>" placeholder="예시) 220V"></inpuT>
                </div>
                <br>
                <div>
                    구글 주소 링크
                    <br><textarea name="contryaddress" id="contryaddress" cols="80" rows="5"  placeholder="예시) 구글지도 링크"><%=cp.getMapAddress() %></textarea>
                </div>
                <br>    
                <div>
                    영문 수도명  
                    <br><inpuT type="text" name="engcity" value="<%=cp.getEnglishName() %>" placeholder="예시) amsterdam"></inpuT>
                </div>
                <br>    
                <div>
                    시차 (영국기준) 
                    <br><inpuT type="text" name="clockchange" value="<%=cp.getClock() %>" placeholder="예시) +1"></inpuT>
                </div>
                <br>

        </fieldset>
    </div>
        <div id="twobu">
            <button class="customBtn btnStyle" type="submit"><span>수정</span></button>
        </div>
	</form>
</section>
<%@ include file="/views/common/footer.jsp" %>