<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>

        <section>
        <div class="sector">
            <div class="sidemenu">
                <div><p>워킹 홀리데이란?</p></div>
                <div><p>찾아 오시는 길</p></div>
                <div><p>쇼미더웨이 소개</p></div>
            </div>
    
            <div class="menuDiv"></div>
    
            <div id="all">
                <h3><span style="background-color: rgb(178 183 239);">워킹홀리데이란?</span></h3>
                <img src="<%=request.getContextPath() %>/images/holiday.jpg" id="plane">
                
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이란?</h4>
                    <pre>
	워킹홀리데이란,국가들 간에 양해각서 협정을 맺어 젊은이들로 하여금 
	방문국에서 일반적으로 1년간 자유롭게 거주, 취업, 여행은 공부할 수 있도록 특별히 허가 
	해주고 각 방문국들의 현지 삶의 방식, 문화 체험, 언어 학습, 역사 공부, 유적지 탐방, 여행 
	및 타국의 이해를 높일 수 있도록 젊은 청년 시절의 경험의 폭을 넓힐 수 있는 
	기회를 제공하는 <span style="background-color: rgb(178 183 239);">청년 교환 이동성 프로그램</span>
                    </pre>
                </div>
    
                <div id="textContainer">
                    <h4>&nbsp;&nbsp;&nbsp;워킹홀리데이 신청 정보</h4>
                        <pre>
	<span style="background-color: rgb(178 183 239);">저희와 함께 워킹홀리데이를 지금 당장 준비하세요!</span>
	워킹홀리데이는 총 23개 국에서 신청이 가능합니다.
	23개국 나라의 상황에 따라 면접 또는 신청서 서류 작성이 필요합니다.
	나라마다 달라지는 워킹홀리데이 신청 및 준비가 어려우시다고요?
	저희 홈페이지에서 그 고민을 해결해 드리겠습니다.
	<b>Show Me The Way</b>는 워킹홀리데이를 가고자 하는 용감한 젊은이들의 준비를 돕겠습니다.
                        </pre>
                </div>
            </div>
        </div>
        <br>

    </section>
    <style>
        section{
            /*border: 1px solid tomato;*/
            
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
            /*border: 1px solid blue;*/
            /* 섹션 안의 div테두리 */
            
        }

        .sector{
                display: flex;
            }
        /* .sector>*{
            border: 1px solid;
        } */

        #all{
            max-width: 800px;
            margin: 0 auto;
            width: 85%;
        }

        .sidemenu{
            width: 200px;
            height: 50px;
            /* padding: 50px; */
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
        .sidemenu>div:first-child{
            color: purple;
        }

        #plane{
            border-radius: 20px;
            width: 700px;
        }
        #textContainer{
            width: 700px;
            height: 230px;
            border: 1px solid cornflowerblue;
            border-radius: 20px;
            margin-top: 1%;
            letter-spacing: 1px;
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