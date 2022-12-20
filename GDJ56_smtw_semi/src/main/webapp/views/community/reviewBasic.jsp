<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/review.css"/>


 <!-- 부트스트랩 CSS -->
   
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    
<%@ page import="java.util.List" %>   
<%@ page import="com.smtw.review.model.vo.Review" %>   
 
 <%
	List<Review> review=(List<Review>)request.getAttribute("review");
	String state=(String)request.getAttribute("state");
%>



<%@include file="/views/common/header.jsp" %>
    
  



    <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section>
        <div id="friendTitle" style="text-align: center;">
            <h1>생생후기</h1>
        </div>

        <div style="height:50px;">
            <div style="display:flex;float: right;">
                	
	                <select  id="stateSort" class="form-select" aria-label="Default select example" style="box-shadow: 0 4px 2px -2px rgba(221, 160, 221, 0.304) !important;"> 
	                    <option value="ORDER BY enroll_date DESC">등록일순</option>
	                    <option value="ORDER BY REVIEW_SAT DESC">별점높은순</option>
	                    <option value="ORDER BY REVIEW_SAT ASC">별점낮은순</option>
	                </select>
                
               
            </div>
        </div>

        <div style="height:700px">
            <div style="display:flex">
                <div style="border:0px solid yellow;width:300px;height:700px">
                    <header class="header" role="banner">
                        <div id="sideMenu">
                            <h1 class="sidelogo">
                                <a href="LeavingDiary.html"><span>커뮤니티</span></a>
                            </h1>
                            <div class="nav-wrap">
                                <nav class="main-nav" role="navigation">
                                    <ul class="unstyled list-hover-slide">
                                        <li><a href="LeavingDiary.html">워홀프렌즈 구하기</a></li>
                                        <li><a href="<%=request.getContextPath()%>/community/reviewBasic.do">생생후기</a></li>
                                    </ul>
                                </nav>
                          </div>
                        </div>
                    </header>
           	 	</div>
           
           
	  			<div style="border:0px solid red;width:1100px;height:695px;margin-left:80px;">
				<div style="display:flex">
		 	<%if(review==null||review.isEmpty()){ %>	 
				<div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                           <P>조회된 후기가 없습니다.</P>
                </div>
			<!--데이터 출력  -->
               <%}else{ 
            	  for(Review r :review)  { %> 
              	
                   
                   
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="<%=request.getContextPath() %>/upload/review/<%=r.getReviewFileName() %>" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="<%=request.getContextPath()%>/community/readReview.do?ReviewNo=<%=r.getReviewNo()%>" style="color: black !important;font-size:20px !important;" ><%=r.getReviewTitle() %></a></div>
                            <div><%=r.getEnrollDate()%></div>
                        </div>
                       
                        
                        
                     <% }
                    
              		}%> 
                    
                    <!--반복문에서 뺴야함  -->
                    </div> 
                    
                    
                
                   
                   
                   
                   
                    <!-- 페이지 바 -->
                    <div style="border:0px solid blue;width:890px;height:80px;text-align: center;margin-left:100px;">
                      
                               <%=request.getAttribute("pageBar") %>
                              
                             
                    </div>
                </div>
            </div>
        </div>
        <div style="display:flex; border:0px solid rgb(15, 231, 231);width:100%;height:75px;margin-left: 0px;">
            <div style="border:0px solid yellow;width:400px;height:60px;"></div>
           
            <div style="border:0px solid yellow;width:600px;height:60px;">
                <!-- 검색창 위치 -->
                <!-- <input type="text" style="margin-top:25px;margin-left:120px;margin-bottom:100px !important;" value="검색창 API 부트스트랩위치 " >  -->
                
                <nav class="navbar navbar-expand-sm " style="background-color: white;" >
                    <div class="container-fluid position-absolute top-0 end-0" >
                       <div class=" navbar-collapse" id="navbarSupportedContent">
                        
                         <div id="search-container">
                        
                        	<div style="display:flex;">
		                        <select  id="searchType"  class="form-select form-select-sm" aria-label=".form-select-sm  example">
		                          <!--   <option selected>선택</option> -->
		                            <option value="nation">나라</option>
		                            <option value="city">도시</option>
		                            <option value="title">제목</option>
		                           	<option value="content">내용</option>
		                            <option value="userId">작성자(아이디)</option>
		                        </select>
		                        <div id=search-nation>
			                        <form action="<%=request.getContextPath()%>/community/searchReview.do"    class="d-flex" role="search">
			                      	<input type="hidden" name="searchType" value="N_NAME">
			                         <input name="searchKeyword" class="form-control me-2" type="text" placeholder="나라검색" aria-label="Search">
			                         <button class="btn btn-outline-success" type="submit">Search</button>
			                        </form>
		                      	</div>
		                      	<div id=search-city style="display:none;">
			                        <form action="<%=request.getContextPath()%>/community/searchReview.do" class="d-flex" role="search">
			                      	<input type="hidden" name="searchType" value="REVIEW_CITY">
			                         <input name="searchKeyword" class="form-control me-2" type="text" placeholder="도시검색" aria-label="Search">
			                         <button class="btn btn-outline-success" type="submit">Search</button>
			                        </form>
		                      	</div>
	                      		<div id=search-title  style="display:none;">
			                        <form action="<%=request.getContextPath()%>/community/searchReview.do" class="d-flex" role="search">
			                      	<input type="hidden" name="searchType" value="REVIEW_TITLE">
			                         <input name="searchKeyword" class="form-control me-2" type="text" placeholder="제목검색" aria-label="Search">
			                         <button class="btn btn-outline-success" type="submit">Search</button>
			                        </form>
		                      	</div>
		                      	<div id=search-content  style="display:none;">
			                        <form action="<%=request.getContextPath()%>/community/searchReview.do" class="d-flex" role="search">
			                      	<input type="hidden" name="searchType" value="REVIEW_CONTENTS">
			                         <input name="searchKeyword" class="form-control me-2" type="text" placeholder="내용검색" aria-label="Search">
			                         <button class="btn btn-outline-success" type="submit">Search</button>
			                        </form>
		                      	</div>
		                      	<div id=search-userId  style="display:none;">
			                        <form action="<%=request.getContextPath()%>/community/searchReview.do" class="d-flex" role="search">
			                      	<input type="hidden" name="searchType" value="MEMBER_ID">
			                         <input name="searchKeyword" class="form-control me-2" type="text" placeholder="작성자(아이디)검색" aria-label="Search">
			                         <button class="btn btn-outline-success" type="submit">Search</button>
			                        </form>
		                      	</div>
                      		</div>
                      
                     
                      	</div>
                      
                      </div>
                    </div>
                  </nav>
            </div>
           
            <div style="border:0px solid yellow;width:400px;height:60px">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <%if(logInMember!=null) {%>  
                    <button  onclick="location.assign('<%=request.getContextPath()%>/community/enrollReview.do');"
                    class="btn btn-primary customBtn btnStyle" type="button" style=" margin-left :300px; margin-top :15px;background-color: rgba(221, 160, 221, 0.508) !important;" value="작성">
                    작성하기</button>
               <% }	%>
                </div>
            </div>
        </div>       
    </section>
    <script>
    
    
    

   	 <% String stateSort = request.getParameter("stateSort"); %>
   	 <%if(stateSort == null){%>
   	 	$("#stateSort").val("ORDER BY enroll_date DESC");
   	 <%} else{%>
   	 	$("#stateSort").val("<%=stateSort%>");
   	 <%}%>

    
    
    
   
    
   
    
    
    
    
    $('#searchType').change(e=>{
        	$(e.target).val();
        const type=$(e.target).val();
        	console.log($("search-"+type));
        	$("#search-container>div>div").hide();
        	$("#search-"+type).css("display","inline-block");
        
        });
    
     
     $("#stateSort").change(e=>{
     	
    	
    	console.log($(e.target).val()); 
    	
     	
     	const stateSort=$(e.target).val()
     	
     	let url;
     	<%if(state.equals("search")) {%>
     	url = '<%=request.getContextPath()%>/community/searchReview.do?stateSort='+$(e.target).val()+'&searchType='+'<%=request.getParameter("searchType")%>'+'&searchKeyword='+'<%=request.getParameter("searchKeyword")%>';
     	location.replace(url);
     	
     	<% }else{ %>
     	
     		location.replace('<%=request.getContextPath()%>/community/reviewBasic.do?stateSort='+$(e.target).val()) ; 
     	<%}  %>
    	 
     	
     	
   
     });
     
     

     
     
     
     $("#stateSort").change(e=>{
      	
    	 console.log($(e.target).val()); 
    	
      	
      	const stateSort=$(e.target).val();
      	
     	<%-- location.replace('<%=request.getContextPath()%>/community/searchReview.do?stateSort='+$(e.target).val()); --%>
      	
      	
      	
      	
      	
      });
     
     
     
     
     </script>

    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

<%@include file="/views/common/footer.jsp" %>