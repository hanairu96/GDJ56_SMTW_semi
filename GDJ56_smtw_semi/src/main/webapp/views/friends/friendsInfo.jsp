<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smtw.friends.model.vo.Friends, com.smtw.member.model.vo.Member, 
	com.smtw.friends.model.vo.ApplyFriends, java.util.List, java.util.ArrayList, 
	com.smtw.friends.model.service.FriendsService" %>
<%
	Friends f=(Friends)request.getAttribute("friends");
	Member m=(Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp" %>

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <section>
        <div id="friendTitle">
            <h1 style="text-align: center;">워홀프렌즈 찾기</h1><br>
                <div style="margin:0 auto;border:1px solid rgba(238, 130, 238, 0.315);width:910px;height:650px;display:flex;border-radius:20px;">
                    <div style="display:flex">
                        <div style="border:0px solid green;width:452px;height:690px ">
                            <div style="border:0px solid pink;width:440px;height:340px;">
                                <img src="<%=request.getContextPath() %>/images/lupy.jpg" alt="" style="width:60%;height:75%;margin:auto;display:block;margin-top:50px;border-radius:120px;">
                            </div>
                            <div style="border:0px solid pink;width:440px;height:340px;text-align:center;">
                            <%
	                            ApplyFriends myFriends=null;
                            	if(logInMember!=null){
	                            	List<ApplyFriends> afs=new FriendsService().selectFriendsApply(logInMember.getMemberId());
	                            	List myFriendsList=new ArrayList();
	                            	for(ApplyFriends af : afs){
	                            		if(af.getMemberFrom().equals(f.getMemberId())){
	                            			myFriends=af;
	                            		}
	                            		myFriendsList.add(af.getMemberFrom());
	                            	}
									System.out.println("내 친구 목록: "+myFriendsList);
									System.out.println("이 프렌즈의 아이디: "+f.getMemberId());
									System.out.println("친구 여부: "+(myFriends!=null?"친구":"친구 아님"));
                            	}
                            %>
                            <!-- 내 아이디가 아닐 때, 친구가 아닐 때 친구신청 버튼 보임 -->
                            <%if((logInMember!=null&&!logInMember.getMemberId().equals(f.getMemberId()))
                            		&&myFriends==null){%>
                                <button onclick="window.open('<%=request.getContextPath() %>/friends/friendsApply.do?memberFrom=<%=logInMember.getMemberId() %>&friendsNo=<%=f.getFriendsNo() %>&nName=<%=f.getNName() %>',
                                '_blank','scrollbars=yes,width=500,height=500,top=100,left=300')"
                                class="customBtn btnStyle btn btn-primary" type="button" style="width:120px;margin-top:25px;background-color:rgba(221, 160, 221, 0.508) !important;"value="친구신청하기">친구 신청하기</button>
                            <!-- 친구일 때 이미 친구입니다 버튼 보임 -->    
							<%}else if(myFriends!=null) {%>
								<button class="customBtn btnStyle btn btn-primary" style="width:120px;margin-top:25px;background-color:rgba(221, 160, 221, 0.508);font-size:13px !important;">이미 친구입니다.</button>
							<%} %>
                            </div>
                        </div>
                    </div>
                    <div style="display:flex">
                        <div style="border:0px solid green;width:452px;height:690px;">
                           <div id="do" style="border:0px solid blueviolet;width:452px;height:350px;text-align:center;">
								<br>
								<p>이름: <%=m!=null?m.getMemberName():"" %></p>
								<p>성별: <%=m!=null?(m.getGender()=='M'?"남자":"여자"):"" %></p>
								<p>Mbti: <%=f!=null?f.getMbti():"" %></p>
								<p>희망국가: <%=f!=null?f.getNName():"" %></p>    
								<p>취향: <%=f!=null?f.getType():"" %></p>
								<p>워홀경험 유무: <%=f!=null?(f.getExpYn()=='Y'?"있음":"없음"):"" %></p>
								<p>목적: <%=f!=null?f.getPurpose():"" %></p>
                            </div>
							
                            <div id="doo" style="border:0px solid blueviolet;width:452px;height:300px;">
                            	<b style="margin-left:15px;"><%=f!=null?f.getFriendsTitle():"" %></b>
                                <div style="border:1px solid rgba(238, 130, 238, 0.452);width:420px;height:235px;margin-top:10px;">
                                    <%=f!=null?f.getFriendsContents():"" %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			<div style="text-align:center;">
            <div style="border:1px solid yellow;width:910px;height:60px;display:inline-flex;align-items:center; ">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                	<%if(logInMember!=null&&(logInMember.getMemberId().equals("ADMIN")||logInMember.getMemberId().equals(f.getMemberId()))){%>
		            	<button onclick="location.assign('<%=request.getContextPath()%>/friends/friendsUpdate.do?friendsNo=<%=f.getFriendsNo()%>');" 
		            	class="customBtn btnStyle btn btn-primary" type="button" style="width:80px;margin-left:640px;background-color: rgba(221, 160, 221, 0.508) !important;" value="수정하기">수정하기</button>
		            	<button onclick="friendDelete();" class="customBtn btnStyle btn btn-primary" type="button" style="width:80px;background-color: rgba(221, 160, 221, 0.479) !important;" value="삭제">삭제하기</button>
		            	<button onClick="location.href='<%=request.getContextPath() %>/friends/friendsList.do'" class="customBtn btnStyle btn btn-primary" type="button" style="width:80px;background-color: rgba(221, 160, 221, 0.508) !important;" value="목록">목록으로</button>
	                <%}else {%>
		            	<button onClick="location.href='<%=request.getContextPath() %>/friends/friendsList.do'" class="customBtn btnStyle btn btn-primary" type="button" style="width:80px;margin-left:815px;background-color: rgba(221, 160, 221, 0.508) !important;" value="목록">목록으로</button>
					<%} %>
                </div>
            </div>
            </div>
            </div>
    </section>

     <style>
     	#do>p{
     		font-size:20px;
     	}
     	#doo>*{
     		margin:0 auto;
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
    
    <script>
		function friendDelete(){
			let answer = confirm("정말로 삭제하시겠습니까?");
			if(answer == true){
				location.assign("<%=request.getContextPath()%>/friends/friendsDelete.do?friendsNo=<%=f.getFriendsNo() %>");
			}
		}
	</script>

<%@ include file="/views/common/footer.jsp" %>
