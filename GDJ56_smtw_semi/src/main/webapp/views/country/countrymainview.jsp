<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.smtw.country.model.vo.Country,com.smtw.country.model.vo.Likenation" %>
<%
	List<Country> con=(List<Country>)request.getAttribute("country");
	List<Country> list=(List<Country>)request.getAttribute("list");
	List<Likenation> ln=(List<Likenation>)request.getAttribute("nation");
	String id=(String)request.getAttribute("id");
	String likeName="";
	for(Likenation l : ln){
		likeName+=l.getNName()+",";
	}
%>
<!-- 부트스트랩 CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"> -->
<!-- 부트스트랩 JS -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script> -->
<%@ include file="/views/common/header.jsp" %>
    <style>
     a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: none;}
        #countrymenu2{
            width: 250px;
            float: left; 
            height: 1100px;	
           /*  border:1px solid black; */
        }
        #collectmain2{
        	flex-wrap: wrap;
            padding: 30px;
            /* border: 3px solid brown; */
            width:400px;
            height: 450px;
        }
        #maininfo2{
            text-align: center;
            /* border: 1px solid black; */
        }
        #likename2{
        	display: flex;
        }
        #like2{
        	width:65px;
        	height:50px;
        	/* font-size:35px; */
        }
        #likebtn{
        	padding-top:30px;
        }
        #comaincontainer2{
        	flex-wrap: wrap;
        	display:flex;
         	position: absolute;
        	left :250px; 
        	/* border: 5px solid green;  */
        	width:1400px;
        	height:1100px;
        }
        #pageBar2{
        	position: absolute;
        	top :1650px;
			left:50%;
			width:500px;
        }
		#btnbtn{
			position: absolute;
			width:100px;
			left:1200px

		}
		#positionbtn{
			position: absolute;
			top:450px; 
		}
		#btninsertdelete{
			padding-left:50%;
		}
		#btninsertdelete>button{
			width:80px;
		}
    </style>


<section>
	<h1 style="text-align: center;  font-size:40px;">국가 및 지역 정보</h1>
		<div id="countrymenu2">
	            
        <%if(list.isEmpty()) {%>
        	나라를 추가중입니다!!
        <%}else{%>
			<ul>
			<!-- 페이지 왼편에 나라 리스트 -->
	           	<%for(Country c : list){%>
				<li>
                    <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN"))  {%>
                    <!-- 나라 상세 페이지가 없으면 수정페이지로 이동한다 -->
                   		<a href="<%=request.getContextPath()+(c.getInfo().getMoney()==null?"/country/updateCountry.do?nName=":"/countryinfo/searchAll.do?nName=")+c.getNName() %>"><%=c.getNName() %></a>
                  		<%}else{
						if(c.getInfo().getMoney()==null){%>
						<!-- 회원이 상세페이지를 보려고 할때 정보가 없을 경우 분기처리 -->
                   		<a href="" onclick="nodatano();"><%=c.getNName() %></a>
                    	<%}else{ %>
                   		<a href="javascript:void(0);" onclick="fn_emergency('<%=c.getEmergency()%>','<%=c.getNName() %>')" > <%=c.getNName() %> </a>
	                	<%}
	            	 }%>
	      		</li>
	      	<%}%>
			</ul>    
		</div>
        <%}%>
           	<script>
           		/* 회원일경우 나라 상세정보가 없을때 뜨는 알림팝업 */
            	const nodatano=()=>{
					alert("나라정보를 업데이트중입니다!!!");	
            	}	
            	/* 비상상황문구를 넣었을 경우 알림팝업 */
            	const fn_emergency=(em,name)=>{
            		if(em!='null') alert(em);
            		location.assign('<%=request.getContextPath()%>/countryinfo/searchAll.do?nName='+name);
            	}
			</script>
        <div id="comaincontainer2"> 
	        <%if(con.isEmpty()) {%>
	        	<div>
	        		<h2>조회된 나라가 없습니다.</h2>
	        	</div>
	        <%}else{

	        	for(int i=0;i<con.size();i++) {%>
           		 		
       				 <div id="collectmain2">
       				 <!-- 메인 이미지가 있을때 없을때(대체이미지) 분기처리 -->
       				 	<%if(con.get(i).getNImg()==null) {%>
	                    <img src="<%=request.getContextPath()%>/images/country/noimage_view.png"  alt="" style="width: 400px; height:300px;border-radius:10%;" >
       				 	<%}else{ %>
	                    <img src="<%=request.getContextPath()%>/upload/country/<%=con.get(i).getNImg() %>"  alt="" style="width: 400px; height:300px;border-radius:10%;" >
	                    <%} %>
	                    
	                    <div id="likenameinfo">
	                        <div id="likename2">
	                        
	                        <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN"))  {%>
	                            <p id="font1" style="font-size:30px;">
	                            <a href="<%=request.getContextPath()+(con.get(i).getInfo().getMoney()==null?"/countryInfo/insergo.do?nName=":"/countryinfo/searchAll.do?nName=")+con.get(i).getNName()%>">
                            <%}else{
                            	if(con.get(i).getInfo().getMoney()==null){%>
                            	<!-- 내용이 없을경우 준비중 팝업이 뜬다 -->
                            		<p id="font1" style="font-size:30px;">
	                    			<a href="" onclick="nodatano()">
		                    	<%}else{ %>
		                    	<!-- 내용이 있을 경우 상세페이지로 이동한다 -->
		                    		<p id="font1" style="font-size:30px;">
		                    		<a href="javascript:void(0);" onclick="fn_emergency('<%=con.get(i).getEmergency()%>','<%=con.get(i).getNName() %>')" >
	                    		
		                    	<%}%>
                            <%}%>    
	                            <%=con.get(i).getNName()%></a></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            
	                            
	                            
	                            <!-- 좋아요 버튼 -->
	                            <%if(logInMember!=null){ %>
		                        	<div id="likebtn">
		                        		<input type="hidden" id="conameinput" value="<%=con.get(i).getNName() %>">
		                        		<img class="likeimg"  src="<%=request.getContextPath() %>/images/country/like.png" 
		                        		style="width:50px;height:50px;<%=likeName.contains(con.get(i).getNName())?"display:inline":"display:none" %>" onclick="likebtn(event)">
		                        		<img class="dislikeimg" src="<%=request.getContextPath() %>/images/country/dislike.png" 
		                        		style="width:50px;height:50px;<%=likeName.contains(con.get(i).getNName())?"display:none":"display:inline" %>"" onclick="likebtn(event)">
		                        	</div>	 
	                        	<%} %>   
	                        	
	                        	
	                        	
	                        </div>
	                        <h4 id="maininfo2"><%=con.get(i).getNpharse() %></h4>
	                        
	                        <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) {%>
		                        <div id="btninsertdelete">
		                            <button id="update" class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/country/updateCountry.do?nName=<%=con.get(i).getNName()%>&id=<%=logInMember.getMemberId()%>')">수정</button>
		                            <button id="delete" class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/country/deleteCountry.do?nName=<%=con.get(i).getNName()%>&&nImg=<%=con.get(i).getNImg()%>&id=<%=logInMember.getMemberId()%>')">삭제</button>
		                        </div>
	                        <%} %> 
	                     </div> 
	                 </div>
				<%} 
			 }%>  
		    <script>
				//좋아요 하트 버튼
				//$(".likeimg").hide();
				
				const likebtn=(e)=>{
					$(e.target).parent().find("img").toggle();
					//이름값 불러오기
					const coname=$(e.target).parent().find("input").val();
					console.log(coname);
					if($(e.target).parent().find("img.dislikeimg").css('display')=='none'){
						//저장(아이디 값이 없을때의 분기처리함)
 						location.assign('<%=request.getContextPath()%>/likecountry.do?id=<%=logInMember!=null?logInMember.getMemberId():""%>&name='+coname+'&ckLike=Y'); 
					}else{
						//삭제
 						location.assign('<%=request.getContextPath()%>/dislikecountry.do?id=<%=logInMember!=null?logInMember.getMemberId():""%>&name='+coname);
					}
				};
				
			</script>			
   		</div>
	
	<!-- 페이징 처리 -->
   	<div id="pageBar2">
   	<!-- 부트스트랩 ㅠㅜㅠㅜ -->
<!-- 		<nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
			<ul class="pagination justify-content-center" style="color:rgba(221, 160, 221, 0.508) !important;"> -->
				<%=request.getAttribute("pageBar") %>
<!-- 			</ul>
		</nav> -->
	</div>
	
	
	
	 <%if(logInMember!=null&&logInMember.getMemberId().equals("ADMIN")) {%>
	<!-- 페이지 우측 상단으로 자리 강제 이동함 -->
	<div id="positionbtn">
    	<button id="btnbtn" class="customBtn btnStyle" onclick="location.assign('<%=request.getContextPath()%>/country/insertgo.do?id=<%=logInMember!=null?logInMember.getMemberId():""%>')"><span>국가 추가</span></button>
    </div>
    <%} %>
</section>
    <STYLE>
    	#font1{
    		padding-left:30px;
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
        /*  border: 1px solid tomato; */
         
         /* margin-left: 50px; */
         margin-right: 50px;
         padding-left: 30px;
         padding-right: 100px;
         /* 
             만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
             좌우 간격을 조정하세요
             왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
          */
         margin-top: 100px;
         height: 1300px; 
         /*
             ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
             높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
         */
            
        }
/*         section>div{
            border: 1px solid blue;
            /* 섹션 안의 div테두리 */
            
        } */
    </style>

<%@ include file="/views/common/footer.jsp" %>