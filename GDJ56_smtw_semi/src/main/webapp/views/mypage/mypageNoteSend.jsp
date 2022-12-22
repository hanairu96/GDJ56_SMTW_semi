<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smtw.mypage.model.vo.Note" %>
<%
	List<Note> list = (List<Note>)request.getAttribute("list");
	String id = (String)request.getParameter("id");
%>

  <section>
        <div class="sidemenu">
            <div><h4 style="text-align: center;">마이 페이지</h4></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageFriends.do?id=<%=logInMember.getMemberId()%>');">워홀 프렌즈</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageAccountView.do?id=<%=logInMember.getMemberId()%>');">계정 관리</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">쪽지함</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageWriting.do?id=<%=logInMember.getMemberId()%>');">내가 쓴 글</p></div>
            <div><p onclick="location.assign('<%=request.getContextPath()%>/mypage/mypageNation.do?id=<%=logInMember.getMemberId()%>');">찜한 나라</p></div>
        </div>
        <div class="menuDiv"></div>
        <div class="contentList">
            <div>
                <div id="menutitle"><h2 style="background-color: cornflowerblue;">쪽지함</h2></div><br>
                
            </div>

            <div id="postrecieve"><h2 style="background-color: rgb(239, 239, 239);" onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageNoteReceive.do?id=<%=logInMember.getMemberId()%>');">수신함</h2></div><br>
            
            <div id="postsend"><h2 style="background-color: cornflowerblue;" onclick="location.replace('<%=request.getContextPath()%>/mypage/mypageNoteSend.do?id=<%=logInMember.getMemberId()%>');">발신함</h2></div><br>

              <table id="postbox" style="width: 90%;">
                <tr>
                    <td style="width: 50px;"><input type="checkbox" name="전체선택" id="" onclick='selectAll(this)'></td>
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
            
            <div id="pageBar">
					<%=request.getAttribute("pageBar") %>
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
        <script>
        	function selectAll(selectAll)  {
      	  		const checkboxes 
      	       = document.getElementsByName('check');
      	  
      	  		checkboxes.forEach((checkbox) => {
      	    	checkbox.checked = selectAll.checked;
      	  		})
      		}
      
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
   </section>
   
	 <style>
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
            left: 450px;
            
        }
        
        #pageBar{
        	position: absolute;
            top: 1000px;
            left: 900px;
        }

        #postcontroll{
            position: absolute;
            top: 550px;
            left: 450px;
            
        }

        #postcontroll>*{
            width: 100px;
            height: 50px;
            
        }

        #postrecieve{
            position: absolute;
            top: 450px;
            left: 580px;
            width: 300px;
            height: 100px;
            cursor: pointer;
        }

        #postsend{
            position: absolute;
            top: 450px;
            left: 1000px;
            width: 300px;
            height: 100px;
            cursor: pointer;
        }

        #menutitle{
            /* border: 1px solid;
            border-bottom: 3px solid; */

            position: absolute;
            top: 350px;
            left: 800px;
            width: 300px;
            height: 100px;
        }

        #mypsc{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 500px;
         
            width: 300px;
            height: 300px;
        }
        #flist{
            border: 1px solid;
            border-bottom: 3px solid;

            position: absolute;
            top: 500px;
            left: 900px;
            
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
            left: 500px;
            
            width: 1000px;
            height: 300px;
        }
        section{
            display: flex;
        }
        .contentList{
            width:50%;
            height:700px;
       		margin-left:0 auto;
       		margin-left: 0 auto;
       		text-alian : center;
       		border : 2px solid;
       		border-radius : 10px;
       		padding 20px;
       		margin-right : 150px;
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
            padding: 10px;
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

        .sidemenu p:hover{
            transform: scale(1.1);
            transition-property: transform;
            transition-duration: 1s;
        }
        .sidemenu>*:not(div:nth-child(1)){
            width: 200px;
            height: 50px;
            background-color: lavender;
            border-radius: 50px;
            box-shadow: 5px 2px 8px lavender;
        }
        .sidemenu p{
            text-align: center;
            padding: 13px;
            cursor:pointer
        }
        .sidemenu>div:nth-child(4){
            color: purple;
            
        }
        section{
            border: 1px solid tomato;
            
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
            border: 1px solid blue;
            /* 섹션 안의 div테두리 */
            
        }
    </style>
<%@include file="/views/common/footer.jsp" %>