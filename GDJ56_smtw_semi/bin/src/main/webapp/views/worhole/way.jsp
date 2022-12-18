<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>

    <section>
        <div class="sector">
            <!-- 페이지 왼편 메뉴 바 -->
            <div class="sidemenu">
                <div><p>워킹 홀리데이란?</p></div>
                <div><p>찾아 오시는 길</p></div>
                <div><p>쇼미더웨이 소개</p></div>
            </div>
    
            <div class="menuDiv"></div>
    
            <!-- 다음 지도+찾아오시는길 -->
            <div id="all">
                <h3><span style="background-color: rgb(178 183 239);">찾아오시는길</span></h3>
                <div id="map" style="width:500px;height:300px;"></div>
                
                <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=63790162820e52da6fdb26e25b092596"></script>
                <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(37.4780485, 126.8790079), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
                    
                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
                    
                    // 마커가 표시될 위치입니다 
                    var markerPosition  = new kakao.maps.LatLng(37.4780485, 126.8790079); 
                    
                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
                    
                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
                    
                    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                    // marker.setMap(null);    
                </script>   
                <div id="info">
                    <h4>주소</h4>
                    <pre>(08505) 서울특별시 금천구 가산디지털로 2로 115(가산동, 대륭테크노타운3차),811호</pre>
                    
                    <h4>교통편</h4>
                    <pre>1,7호선 5,6번출구 보고 5~10분</pre>
                    
                    <h4>고객센터</h4>
                    <pre>문의사항 : 질문게시판 <button>질문게시판</button></pre>
                    <pre>대표전화 : 010-0000-0000  운영시간 : 항시대기</pre>
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
            }
        /* .sector>*{
            border: 1px solid;
        } */

        #all{
            /* 페이지 안에 내용 중앙에 정렬 */
            /* 페이지 내용 가로 길이 */
            max-width: 700px;
            margin: 0 auto;
            width: 85%;
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
        .sidemenu>div:nth-child(2){
            color: purple;
        }

        div#map{
            border-radius: 20px;
            border: 2px solid navy;
            
        }
        div#info{
            align-items: center ;
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