<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.friends.model.vo.Friends, com.smtw.member.model.vo.Member" %>
<%
	Friends f=(Friends)request.getAttribute("friends");
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<>
    <section>
        <div id="friendTitle" style="text-align: center;">
            <h1>워홀프렌즈 찾기</h1>
        </div>

        <div style="height:40px;display: flex;">
            <div style="border:0px solid yellow;width:400px;height:60px;margin-left: 50px;"></div>
            <div style="border:0px solid yellow;width:400px;height:60px;margin-left: 50px;"></div>
            <div style="border:0px solid yellow;width:400px;height:60px;margin-left: 50px;">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button onclick="friend_delete('주소값');" class="customBtn btnStyle btn btn-primary" type="button" style=" background-color: rgba(221, 160, 221, 0.479) !important;" value="삭제">삭제하기</button>
                </div>
            </div>
        </div>
        <script>
            function friend_delete(url){
            var answer;
             answer = confirm("워홀프렌즈를 삭제하시겠습니까?");
             if(answer == true){
             location = url;
                }
          }
            
         </script>



        <div style="height:700px">
            <div style="display:flex">
                <div style="border:0px solid yellow;width:300px;height:700px">
                    <div style="border:0px solid blue;width:270px;height:350px">
                        <header class="header" role="banner">
                            <div id="sideMenu">
                                <h1 class="sidelogo">
                                    <a href="LeavingDiary.html"><span>커뮤니티</span></a>
                                </h1>
                                <div class="nav-wrap">
                                    <nav class="main-nav" role="navigation">
                                        <ul class="unstyled list-hover-slide">
                                            <li><a href="LeavingDiary.html">워홀프렌즈 구하기</a></li>
                                            <li><a href="MyCountry.html">생생후기</a></li>
                                        </ul>
                                    </nav>
                              </div>
                            </div>
                        </header>
                    </div>
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



                <div style="border:1px solid rgba(238, 130, 238, 0.315);width:910px;height:695px;display:flex;border-radius:20px;">
                    <div style="display:flex">
                        <div style="border:0px solid green;width:452px;height:690px ">
                            <div style="border:0px solid pink;width:440px;height:340px;">
                                <img src="<%=request.getContextPath() %>/images/lupy.jpg" alt="" style="width: 50%;height:50%; margin:auto; display: block;margin-top:50px;border-radius:120px;">
                            </div>
                            <div style="border:0px solid pink;width:440px;height:340px;text-align: center; ">
                                <button  onclick="window.open('친구신청하기.html','_blank','scrollbars=yes,width=600,height=600,top=100,left=300')"
                                class="customBtn btnStyle btn btn-primary" type="button" style=" margin-top :15px;background-color: rgba(221, 160, 221, 0.508) !important;" value="친구신청하기">친구 신청하기</button>

                            </div>
                        </div>
                    </div>
                    <div style="display:flex">
                        <div style="border:0px solid green;width:452px;height:690px;">
                           <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                               <div>이름:</div>
                               <div><%=m!=null?m.getMemberId():"" %></div>
                           </div>
                           <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>성별:</div>
                                <div><%=m!=null?(m.getGender()=='M'?"남자":"여자"):"" %></div>
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>Mbti:</div>
                                <div><%=f!=null?f.getMbti():"" %></div>
                           </div>
                           <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>희망국가:</div>
                                <div><%=f!=null?f.getNName():"" %></div>    
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>취향:</div>
                                <div><%=f!=null?f.getType():"" %></div>    
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>워홀경험 유무:</div>
                                <div>?</div>
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:50px;display:flex;justify-content:center;">
                                <div>목적:</div>
                                <div><%=f!=null?f.getPurpose():"" %></div>  
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:25px;">
                                자기소개글(100자이내)
                            </div>
                            <div style="border:0px solid blueviolet;width:452px;height:300px;">
                                <div style="border:1px solid rgba(238, 130, 238, 0.452);width:452px;height:180px;margin-top:30px;">
                                    <%=f!=null?f.getFriendsContents():"" %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div style="display:flex; border:0px solid rgb(15, 231, 231);width:100%;height:75px">
            <div style="border:0px solid yellow;width:400px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px"></div>
            <div style="border:0px solid yellow;width:400px;height:60px;display: inline-flex;align-items:center; ">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button onClick="location.href='링크주소'" class="customBtn btnStyle btn btn-primary" type="button" style="margin-left:220px;background-color: rgba(221, 160, 221, 0.508) !important;" value="목록">목록</button>
                    <button onclick="update_friend('주소값');" class="customBtn btnStyle btn btn-primary" type="button" style="background-color: rgba(221, 160, 221, 0.508) !important;" value="수정하기">수정하기</button>
                </div>
            </div>
        </div>       
    </section>
    <script>
        function update_friend(url){
        var answer;
         answer = confirm("수정하시겠습니까?");
         if(answer == true){
         location = url;
            }
      }
        
         
     </script>

     <style>
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
            background: #d27ec492;
            background: linear-gradient(0deg, #d27ec492 0%, #d27ec492 100%);
        }
        .btnStyle:hover {
            color: #d27ec492;
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
            background: #d27ec492;
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

<%@ include file="/views/common/footer.jsp" %>
