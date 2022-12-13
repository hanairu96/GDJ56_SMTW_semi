<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/common/header.jsp" %>
     <!-- 부트스트랩 CSS -->
   
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    



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
                                        <li><a href="LeavingDiary.html">워홀프렌즈구하기</a></li>
                                        <li><a href="MyCountry.html">생생후기</a></li>
                                    </ul>
                                </nav>
                          </div>
                        </div>
                    </header>
                    <!-- <div style="background-color:rgba(221, 160, 221, 0.508);border:0px solid blue;width:270px;height:350px;border-radius:20px;">
                        <h1><a href="" style="color: white !important;font-size:30px !important;">워홀프렌즈 구하기</a></h1>
                        <h1><a href="" style="color: white !important;font-size:30px !important;">생생후기</a></h1>
                    </div> -->
            </div>
                <style>
                     /* 사이드메뉴바 스타일 여기부터*/
        /* 왼쪽 사이드메뉴영역 */
        #sideMenu{
            border: 1px solid black;
            /* border-radius: 10px; */
            position: absolute; 
            z-index: 10;
            width: 18%;
        }
        .header {
        /* position:relative; */
        left: 0;
        top: 100px;
        bottom: 0;
        /* width: 17.5em; */
        width: 20%;
        /* height: 900px; */
        /* background: #d9d9db; */
        }

        *,
        :before,
        :after {
        box-sizing: border-box;
        }

        .unstyled {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .unstyled a {
            text-decoration: none;
        }

        .list-inline {
            overflow: hidden;
        }

        .sidelogo {
            background-color: #b5aae5;
            text-transform: lowercase;
            font: 300 2em "Source Sans Pro", Helvetica, Arial, sans-serif;
            text-align: center;
            padding: 0;
            margin: 0;
            border: 2px solid black;
            /* border-radius: 10px; */
        }
        .sidelogo a {
        display: block;
        padding: 1em 0;
        color: #dfdbd9;
        text-decoration: none;
        transition: 0.15s linear color;
        }
        .sidelogo a:hover {
        color: #fffaf8;
        }
        .sidelogo a:hover span {
        color: #df4500;
        }
        .sidelogo span {
           
        color: #131110;
        font-weight: 700;
        transition: 0.15s linear color;
        }
        .main-nav li {
        /* border-bottom: solid 1px #3c3735; */
        font-size: 20px;
        font-weight: bold;
        }
        .main-nav a {
        padding: 1.1em 0;
        color: #f1f1f1;
        font: 400 1.125em "Source Sans Pro", Helvetica, Arial, sans-serif;
        text-align: center;
        text-transform: lowercase;
        }
        .main-nav a:hover {
        color: #f9f8f8;
        }
        .list-hover-slide li {
            border: 1px solid rgb(0, 0, 0);
            /* border-radius: 10px; */
            background-color: #d5d0e8;
            position: relative;
            overflow: hidden;
        }
        .list-hover-slide a {
        display: block;
        position: relative;
        z-index: 1;
        transition: 0.35s ease color;
        color: rgb(0, 0, 0);
        }
        .list-hover-slide a:before {
        content: "";
        display: block;
        z-index: -1;
        position: absolute;
        left: -100%;
        top: 0;
        width: 100%;
        height: 100%;
        border-right: solid 5px #4300df;
        background: #b7aee0;
        transition: 0.35s ease left;
        
        }
        .list-hover-slide a.is-current:before, .list-hover-slide a:hover:before {
        left: 0;
        }
        /* 사이드메뉴바 스타일 여기까지*/


         </style>




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
                        <nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
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
                          </nav>
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
                    <button class="btn btn-primary customBtn btnStyle" type="button" style=" margin-left :300px; margin-top :15px;background-color: rgba(221, 160, 221, 0.508) !important;" value="작성">작성하기</button>
                </div>
            </div>
        </div>       
    </section>
    <style>
        customBtn {
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
            background: #c67ed292;
            background: linear-gradient(0deg, #c67ed292 0%, #c67ed292 100%);
        }
        .btnStyle:hover {
            color:#c67ed292;
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
            background:#c67ed292;
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


    </style>

    <style>
        section{
            border: 0px solid tomato;
            font-family: "Hahmlet";
            margin-left: 50px;
            margin-right: 50px;
            /* padding-left: 100px; */
            /* padding-right: 100px; */
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
        section>div{
            border: 0px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>

    <!-- 여기까지!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

<%@include file="/views/common/footer.jsp" %>