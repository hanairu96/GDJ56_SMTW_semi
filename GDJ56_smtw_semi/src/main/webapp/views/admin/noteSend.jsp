<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smtw.mypage.model.vo.Note" %>
<%
	List<Note> list = (List<Note>)request.getAttribute("list");
	String id = (String)request.getParameter("id");
%>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

  <section>
        <div class="sidemenu">
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p>관리자 페이지</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/memberList.do"><p>회원 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/qnaManage.do"><p>Q&A 관리</p></a></div>
            <div><a href="<%=request.getContextPath()%>/admin/noteReceive.do?id=ADMIN"><p id="purple">쪽지함</p></a></div>
        </div>

        <div class="menuDiv"></div>
        
        <div class="contentList">
            <div>
                <div id="menutitle"><h2 style="background-color: cornflowerblue;">쪽지함</h2></div><br>
                
            </div>

            
             <div id="postrecieve"><h2 style="background-color: rgb(239, 239, 239);" onclick="location.assign('<%=request.getContextPath()%>/admin/noteReceive.do?id=ADMIN');">수신함</h2></div><br>
            

            <div id="postsend"><h2 style="background-color: cornflowerblue;" onclick="location.assign('<%=request.getContextPath()%>/admin/noteSend.do?id=ADMIN');">발신함</h2></div><br>
            

            <table id="postbox" style="width: 1000px;">

                
                <tr>
                    <td style="width: 50px;"><input type="checkbox" name="전체선택" id=""></td>
                    <td style="width: 80px;"><p>TO</p></td>
                    <td style="width: 700px;">내용</td>
                    <td style="width: 100px;">보낸날짜</td>
                </tr>
                
                <%if(list.isEmpty()){ %>
                <tr>
                	<td colspan="4" height="100">아직 보낸 쪽지가 없습니다 :(</td>
                </tr>
                <%}else{
                	for(int i=0;i<list.size();i++){
                %>
               		<tr>
                    	<td><input type="checkbox" name="check" id="" value="<%=list.get(i).getNtNo() %>"></td>
                    	<td>
                    		<p><%=list.get(i).getSenderName() %></p>
	                    	<form name="form" action="" method="post">
			                    <input type="hidden" name="noteNo" value="<%=list.get(i).getNtNo() %>">
			                    <input type="hidden" name="id" value=<%=id %>>
			                </form>	
		                </td>
                    	<td onclick="goPopup(event)"><%=list.get(i).getContent() %></td>
                    	<td><%=list.get(i).getDate()%></td>
                	</tr>
                <%}
                } %>

            </table>
            
            <div id="pageBar" style="border:0px solid blue;width:100%;height:80px;text-align: center;">
                <!-- 페이지 바 -->
                <nav aria-label="Page navigation example" style="margin-top:30px;color:rgba(221, 160, 221, 0.508) !important;">
                    <ul class="pagination justify-content-center" style="color:rgba(221, 160, 221, 0.508) !important;">
						<%=request.getAttribute("pageBar") %>
                    </ul>
                </nav>
            </div>

			  <script>
            	function goPopup(e){
            		var gsWin=window.open("","winName","width=520,height=630"); //open("주소",띄우는방식,크기)
            		var frm=$(e.target).prev().find("form")[0];
            		frm.action="<%=request.getContextPath()%>/mypage/mypageNotePop.do";
            		frm.target="winName";
            		frm.submit();
            	}
            </script>
            
           
            <div id="postcontroll">
                <button onclick="noteDeleteClick();">삭제하기</button>
                <!-- <button onclick="window.open('mypage-pop_sendnote.html','_blank','scrollbars=yes,width=600,height=600,top=100,left=300')">쪽지보내기</button> -->
            </div>
        </div>
   </section>
	 <style>
	   body, pre{
          font-family: "Hahmlet";
       }
       
       table,th,td{
            border: 1px solid rgb(112, 112, 112);
            border-collapse: collapse;
            padding: 2px;
        }
        table{
            border-bottom: hidden;
            border-left: hidden;
            border-right: hidden;
            border-top: hidden;
            position: absolute;
            top: 630px;
            left: 650px;
            
        }
        
        #pageBar{
        	position: absolute;
            top: 1100px;
            left: 200px;
        }

        #postcontroll{
            position: absolute;
            top: 550px;
            left: 650px;
            
        }

        #postcontroll>*{
            width: 100px;
            height: 50px;
            
        }

        #postrecieve{
            position: absolute;
            top: 450px;
            left: 780px;
            width: 300px;
            height: 100px;
            cursor: pointer;
        }

        #postsend{
            position: absolute;
            top: 450px;
            left: 1200px;
            width: 300px;
            height: 100px;
            cursor: pointer;
        }

        #menutitle{
            /* border: 1px solid;
            border-bottom: 3px solid; */

            position: absolute;
            top: 350px;
            left: 1000px;
            width: 300px;
            height: 100px;
        }

        #mypsc{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 700px;
         
            width: 300px;
            height: 300px;
        }
        #flist{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 1100px;
            
            width: 600px;
            height: 300px;
        }
        #flist>img{
            float: left;
            margin: 5px;
        }
        #recievelist{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 850px;
            left: 700px;
            
            width: 1000px;
            height: 300px;
        }
        section{
            display: flex;
        }
        .contentList{
            width: 80%;  
            margin-left: 0 auto;
            margin-right: 0 auto;
            text-align: center;
            border: 2px solid;
            border-radius: 10px;
            padding: 20px;
            margin-right: 150px;
        }
        .memberInfo{
            width: 70%;  
            padding: 20px;
            margin-right: 150px;
        }

        #list{
            margin: 0 auto;
            width: 700px;
            border-collapse: collapse;
        }
        #list th{
            border: 1px solid;
            border-bottom: 3px solid;
        }
        #list td{
            border: 1px solid;
        }
        
		.sidemenu{
		    width: 20%;
		    height: 100px;
		    font-size: 20px;
		    font-weight: bold;
		    position: absolute;
		}
			
		.menuDiv{
		    width: 40%;
		}
			
		.sidemenu>*:hover{
		    transform: scale(1.1);
		    transition-property: transform;
		    transition-duration: 1s;
		}
		.sidemenu>*:not(div:nth-child(1)){
		    background-color: lavender;
		    border-radius: 50px;
		    box-shadow: 5px 2px 8px lavender;
		}
		.sidemenu p{
		    text-align: center;
		    padding-top: 6%;
		}
		/* .sidemenu>div:first-child{
		    color: purple;
		}
		
		.sidemenu>div:nth-child(3) p{
		    color: purple;
		} */
		
		.sidemenu>div{
		    height: 70px;
		}
		a{
		    text-decoration: none;
		}

        .sidemenu #purple{
            color: purple;
        }
        
        .sidemenu>div{
        	margin-top:20px;
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

        section{
            /* border: 1px solid tomato; */
            
            margin-left: 50px;
            margin-right: 50px;
            /* ★수정한 부분 */
            /* padding-left: 100px;
            padding-right: 100px; */
            /* ★수정한부분 */
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
            /* border: 1px solid blue; */
            /* 섹션 안의 div테두리 */
            
        }
    </style>
    <script>
		$(document).ready(function() {
		    // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		    var floatPosition = parseInt($(".sidemenu").css('top'));
		    // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		
		    $(window).scroll(function() {
		        // 현재 스크롤 위치를 가져온다.
		        var scrollTop = $(window).scrollTop();
		        var newPosition = scrollTop + floatPosition + "px";
		        $(".sidemenu").stop().animate({
		            "top" : newPosition
		        }, 500);
		    }).scroll();
		});
		
	    function noteDeleteClick(){
			var checkBoxArr=[];
			$("input:checkbox[name='check']:checked").each(function(){
				checkBoxArr.push($(this).val());
				console.log(checkBoxArr);
			});
			$.ajax({
				type:"POST",
				url : "<%=request.getContextPath()%>/mypage/mypageNoteDelete.do",
				data : {
					checkBoxArr : checkBoxArr
				},
				success : function(result){
					alert("삭제 완료");
					history.go(0);
				},
				error:function(xhr, status, error){
					alert("실패");
				}
			});
		}
    </script>
<%@include file="/views/common/footer.jsp" %>