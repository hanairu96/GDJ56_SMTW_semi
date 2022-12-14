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

%>



<%@include file="/views/common/header.jsp" %>
    
    



    <!-- 가운데 섹션 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section>
        <div id="friendTitle" style="text-align: center;">
            <h1>생생후기</h1>
        </div>

        <div style="height:50px;">
            <div style="display:flex;float: right;">
                <select class="form-select" aria-label="Default select example" style="box-shadow: 0 4px 2px -2px rgba(221, 160, 221, 0.304) !important;;">
                    <option selected>분류</option>
                    <option value="등록일순">등록일순</option>
                    <option value="별점높은순">별점높은순</option>
                    <option value="별점낮은순">별점낮은순</option>
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
           



			<!--데이터 출력  -->
              	<div style="border:0px solid red;width:1100px;height:695px;margin-left:80px;">
                    <div style="display:flex">
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.12</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                    </div>
                    <div style="display:flex">
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                        <div style="border:0px solid green;width:270px;height:300px;text-align: center; ">
                            <div style="border:0px solid magenta;width:180px;height:230px; margin-left :50px; margin-top :5px; " >
                                <img src="./images/lupy.jpg" alt="" style="width:100%;height:100%;margin:auto;border-radius:20px;">
                            </div>
                            <div><a href="" style="color: black !important;font-size:20px !important;" >호주딸기농장후기</a></div>
                            <div>2022.11.11</div>
                        </div>
                    </div>
                   
                   
                    <div style="border:0px solid blue;width:890px;height:80px;text-align: center;margin-left:100px;">
                      
                       <!-- 페이지 바 -->
                        
                        
                        <%=request.getAttribute("pageBar") %>
                        
                        <!-- <nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
                            <ul class="pagination justify-content-center" style="color:rgba(221, 160, 221, 0.508) !important;">
                              <li class="page-item disabled"  style="color:rgba(221, 160, 221, 0.508) !important;">
                                <a class="page-link" style="color:rgba(221, 160, 221, 0.508) !important;">이전</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#" style="color:rgba(221, 160, 221, 0.508) !important;">1</a></li>
                              <li class="page-item"><a class="page-link" href="#" style="color:rgba(221, 160, 221, 0.508) !important;">2</a></li>
                              <li class="page-item"><a class="page-link" href="#" style="color:rgba(221, 160, 221, 0.508) !important;">3</a></li>
                              <li class="page-item"><a class="page-link" href="#" style="color:rgba(221, 160, 221, 0.508) !important;">4</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#" style="color:rgba(221, 160, 221, 0.508) !important;">다음</a>
                              </li>
                            </ul>  
                          </nav> -->
                          
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
                        <select class="form-select form-select-sm" aria-label=".form-select-sm  example">
                            <option selected>선택</option>
                            <option value="나라">나라</option>
                            <option value="도시">도시</option>
                            <option value="제목+내용">제목+내용</option>
                            <option value="작성자(아이디)">작성자(아이디)</option>
                        </select>
                        <form class="d-flex" role="search">
                          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                          <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                      </div>
                    </div>
                  </nav>
            </div>
            <div style="border:0px solid yellow;width:400px;height:60px">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-primary customBtn btnStyle" type="button" style=" margin-left :300px; margin-top :15px;background-color: rgba(221, 160, 221, 0.508) !important;" value="작성">
                    작성하기</button>
                </div>
            </div>
        </div>       
    </section>
    

    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

<%@include file="/views/common/footer.jsp" %>