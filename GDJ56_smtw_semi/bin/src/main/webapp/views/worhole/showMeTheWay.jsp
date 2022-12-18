<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>

    <section>
        <div class="sector">
            <div class="sidemenu">
                <div onclick="go1();"><p>워킹 홀리데이란?</p></div>
                <div onclick="go2();"><p>찾아 오시는 길</p></div>
                <div onclick="go3();"><p>쇼미더웨이 소개</p></div>
            </div>
            
            <div class="menuDiv"></div>
            
            <div id="all">
                <div id="title"><h2 class="fade-in">Show Me The Way를 만든 사람들</h2></div>
                <div class="container">
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/INTP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h3>최유리</h3>
                                <p>
                                    팀의 리더<br>
                                    카리스마로 팀을 이끄는 최고의 리더다.<br>
                                    INTP<br>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h3>구예지</h3>
                                <p>
                                    팀의 맏언니<br>
                                    항상 간식을 준비하여 팀원들에게 나눠주시는 우리의 귀중한 요원<br>
                                    ISTP<br>
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/INFP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/ISFJ2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h3>홍나리</h3>
                                <p>
                                    카리스마 그 자체<br>
                                    특유의 카리스마로 선생님을 제압하는 자<br>
                                    ISFJ
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h3>문지희</h3>
                                <p>
                                    에이스<br>
                                    힘을 숨기고 있는 전공자<br>
                                    ISFP
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/ISFP2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
                    <div class="modu">
                        <div>
                            <div class="pro fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/INFJ2.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                        <div>
                            <div class="dis">
                                <h3>이동민</h3>
                                <p>
                                    비밀요원<br>
                                    그의 정체는 수수께끼이다.<br>
                                    INFJ 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modu2">
                        <div>
                            <div class="dis2">
                                <h3>장선우</h3>
                                <p>
                                    팀의 광대이자 분위기 메이커<br>
                                    얼굴만 봐도 웃음이 나는, 이 시대 최고의 코미디언이다.<br>
                                    그의 이름은 바로 <strong>Cutty Jang</strong><br>
                                    INFP
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="pro2 fade-in">
                                <img src="<%=request.getContextPath() %>/images/mbti/INFP2-1.png" 
                                style="width: 120px; height: 160px; border-radius: 20px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
    <style>
        section{
            /* border: 1px solid tomato; */
            
            margin-left: 50px;
            margin-right: 50px;
            /* padding-left: 100px;
            padding-right: 100px; */
            /* 
                만약 섹션 안에 div를 만든다면 여기 padding-left,padding-right에서
                좌우 간격을 조정하세요
                왼쪽 오른쪽도 웬만하면 다같이 맞추면 좋을 듯 하니 각자 만들어보고 의견주세요
             */
            margin-top: 100px;
            /* height: 900px;  */
            /*
                ->내가 사용하는 중간 섹션부분의 크기를 조절하려면 이 height를 조정하세요★★
                높낮이 조절해도 footer침범하지 않도록 설정해놨으니 마음껏 늘려도 됩니다.
            */
            
        }
        section>div{
            /* border: 1px solid blue; */
            /* 섹션 안의 div테두리 */
            
        }

        .sector{
                display: flex;
                /* border: 1px solid green; */
        }
        /* .sector>*{
            border: 1px solid;
        } */

        #all{
            width: 85%;  
            margin: 0 auto;
            /* border: 1px solid; */
        }

        .sidemenu{
            width: 200px;
            height: 50px;
            /* padding: 50px; */
            /* margin-top: 1000px; */
            /* margin: 0 auto; */
            /* border: 1px solid; */
            font-size: 18px;
            font-weight: bold;
            position: fixed;
        }
        .menuDiv{
            width: 15%;
        }

        .sidemenu>*:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu>*{
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu p{
            text-align: center;
            padding: 13px;
        }
        .sidemenu>div:nth-child(3){
            color: purple;
        }

        #title{
            /* width: 300px; */
            text-align: center;
        }
        #title>h2{
            font-size: 30px;
            font-style: italic;
            /* font-family: 'THE_Christmas.ttf'; */
            /* background-color: deepskyblue; */
        }
        .fade-in{
            animation: fadeIn 3s ;
        }
        @keyframes fadeIn {
            0%{
                opacity: 0;
            }
            100%{
                opacity: 1;
            }
        }
        .modu{
            display: flex;
            justify-content: center;
        }
        .modu>div:last-child{
            overflow: hidden;
        }
        .pro{
            /* width: 120px; */
            height: 160px;
            border: 1px solid black;
            border-radius: 20px;
            margin-bottom: 50px;
            /* margin-left: 50px; */
            margin-right: 50px;
            box-shadow: 0px 3px 0px gray;
        }
        .pro:hover, .pro2:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .dis{
            width: 600px;
            height: 160px;
            border: 1px solid black;
            /* background-color: gainsboro; */
            /* background-color: mistyrose; */
            background-color: lavender;
            /* background-color: lavenderblush; */
            margin-bottom: 50px;
            animation: 2s slide-right;
            border-radius: 10px;
            box-shadow: 0px 3px 0px gray;
        }
        @keyframes slide-right{
            from{
                margin-left: -100%;
            }
            to{
                margin-left: 0%;
            }
        }
        .modu2{
            display: flex;
            justify-content: center;
        }
        .modu2>div:first-child{
            overflow: hidden;
        }
        .pro2{
            /* width: 120px; */
            height: 160px;
            border: 1px solid black;
            border-radius: 20px;
            margin-bottom: 50px;
            margin-left: 50px;
            /* margin-right: 50px; */
            /* justify-content: right; */
            justify-items: right;
            box-shadow: 0px 3px 0px gray;
        }
        .dis2{
            width: 600px;
            height: 160px;
            border: 1px solid black;
            background-color: lavender;
            margin-bottom: 50px;
            justify-content: right;
            animation: 2s slide-left;
            border-radius: 10px;
            box-shadow: 0px 3px 0px gray;
        }
        @keyframes slide-left{
            from{
                margin-left: 100%;
            }
            to{
                margin-left: 0%;
            }
        }
        .dis>*{
            margin-left: 20px;
        }
        .dis2>*{
            margin-right: 20px;
            text-align: right;
        }
    </style>
    
    <script>
        $(".sidemenu>*:nth-child(1)").click(e=>{
            location.assign("<%=request.getContextPath() %>/views/worhole/introduce.jsp");
        })
        $(".sidemenu>*:nth-child(2)").click(e=>{
            location.assign("<%=request.getContextPath() %>/views/worhole/way.jsp");
        })
        $(".sidemenu>*:nth-child(3)").click(e=>{
            location.assign("<%=request.getContextPath() %>/views/worhole/showMeTheWay.jsp");
        })
    </script>
    
<%@include file="/views/common/footer.jsp" %>