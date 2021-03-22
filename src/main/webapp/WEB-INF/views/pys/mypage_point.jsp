<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
    
        <%
	String context = request.getContextPath();
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<style type="text/css">
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
	.coint_chart_clear:after {
	content:"";
	display:block;
	clear:both;
}
	.ins_clear:after {
	content:"";
	display:block;
	clear:both;
}
	.mypage:after {
	content:"";
	display:block;
	clear:both;
}
th{
 font-family : 'yg-jalnan';
 width: 180px;
 line-height: 35px;
 text-align: center;
 background-color: palegoldenrod;
 color: #515543;
}

td{
 font-family: 'ChosunGu';
 width: 180px;
 font-size: 12px;
 text-align: center;
 height: 35px;
 background-color: #FBF5EC;
 font-weight: bold;
}
.line{border-bottom: 1px solid white;}
a{text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: #9E8173;}

#Follower_scroll::-webkit-scrollbar{width: 16px;}
#Follower_scroll::-webkit-scrollbar-track {background-color:palegoldenrod;}
#Follower_scroll::-webkit-scrollbar-thumb {background-color:white; border-radius: 10px;}
#Follower_scroll::-webkit-scrollbar-thumb:hover {background:#555;}
#Follower_scroll::-webkit-scrollbar-button:start:decrement {width:16px;height:16px;background:palegoldenrod;}
#Follower_scroll::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:palegoldenrod;}

#Following_scroll::-webkit-scrollbar{width: 16px;}
#Following_scroll::-webkit-scrollbar-track {background-color:palegoldenrod;}
#Following_scroll::-webkit-scrollbar-thumb {background-color:white; border-radius: 10px;}
#Following_scroll::-webkit-scrollbar-thumb:hover {background:#555;}
#Following_scroll::-webkit-scrollbar-button:start:decrement {width:16px;height:16px;background:palegoldenrod;}
#Following_scroll::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:palegoldenrod;}

.coint_chart_clear:after {
	content: "";
	display: block;
	clear: both;
}

.ins_clear:after {
	content: "";
	display: block;
	clear: both;
}

.mypage:after {
	content: "";
	display: block;
	clear: both;
}

.follw_cha_div:after {
	content: "";
	display: block;
	clear: both;
}

.f_ch_name:after {
	content: "";
	display: block;
	clear: both;
}

.jumseage {
	text-overflow:ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.follwer_cha_ti {
	text-overflow:ellipsis;
	overflow: hidden;
	white-space: nowrap;
}


</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
     
	 <!-- 마이페이지 구역 -->
    <div class="mypage" style="width: 1300px; margin: 0 auto;">
     
  <!-- 프로필 영역 시작 -->
		<div id="Profile_area" style="width: 300px; float: left;">
			<!-- 프로필 사진 영역 시작 -->
			<div
				style="width:200px;height:200px;border-radius: 50%;box-shadow: inset 0 0 0 2px palegoldenrod;background-color: white;margin: 0 60px 0 60px;position: relative;z-index: 2;">
				<div
					style="background-image: url('upload/profileIMG/${userlist_page.get(0).getUser_image()}'); background-size: 100%; width:190px; height:190px; border-radius: 50%; position: relative; background-color: white; top: 5px; left: 5px; overflow: hidden;">
				</div>
			</div>
			<!-- 프로필 사진 영역 끝 -->
			<!-- 프로필 내용 시작 -->
			<div
				style="width: 325px;box-shadow: 0 0 0 1.5px palegoldenrod;border-radius: 35px;text-align: center;position: relative;top: -50px;overflow: hidden;position: relative;/* background-color: #fafad27a; */z-index: 1;">
				<!-- 빈 공간 시작 -->
				<div style="width: 300px; height: 70px;"></div>
				<!-- 빈 공간 끝 -->
				<!-- 닉네임 시작 -->
				<div style="font-family: JalnanOTF; font-size: 30px;">
					${userlist_page.get(0).getUser_nickname() }</div>
				<!-- 닉네임 끝 -->
				<!-- 한줄 소개 시작 -->
				<div
					style="font-family: ChosunGu; font-size: 15px; margin: 20px 0 20px 0;">
					${userlist_page.get(0).getUser_intro() }</div>
				<!-- 한줄 소개 끝 -->
				<script type="text/javascript">
			function getFollow_logintopage() {
				var formData = $("#follow_haswil").serialize();
				$.ajax({
					url:"<%=context%>/getFollow_logintopageAjax",
					type:"POST",
					data:formData,
					dataType:'text',
					success:function(data){
						$("#Profile_area").load(" #Profile_area > *", {"Profile_area":data});
					}
				});
			}
			
			function getFollow_logintopage_del() {
				var formData = $("#follow_del_haswil").serialize();
				$.ajax({
					url:"<%=context%>/getFollow_logintopage_delAjax",
					type:"POST",
					data:formData,
					dataType:'text',
					success:function(data){
						$("#Profile_area").load(" #Profile_area > *", {"Profile_area":data});
					}
				});
			}
			</script>
				<!-- 프로필 편집 or 팔로우 시작 -->
				<c:choose>
					<c:when
						test="${user_id_email eq userlist_page.get(0).getUser_id_email()}">
						<form action="myInfo">
							<input type="hidden" id="user_id_email" name="user_id_email"
								value="${userlist_page.get(0).getUser_id_email()}">
							<button
								style="cursor: pointer;border: 0;outline: 0;width: 35%;margin: 0 5% 5% 13%;padding: 10px 0 10px 0;font-family: ChosunGu;font-size: 15px;float: left;border-radius: 35px;color: white;background-color: #9E8173;">
								프로필편집</button>
						</form>
						<form action="myUser_info">
							<input type="hidden" name="user_id_email"
								value="${userlist_page.get(0).getUser_id_email()}">
							<button
								style="cursor: pointer;border: 0;outline: 0;width: 35%;/* margin: 0 25% 0 25%; */padding: 10px 0 10px 0;font-family: ChosunGu;font-size: 15px;border-radius: 35px;color: white;background-color: #9E8173;float: left;">
								회원정보수정</button>
						</form>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${follow_page_me eq '0'}">
								<form name="follow_haswil" id="follow_haswil">
									<button type="button" name="follow_haswil"
										onclick="getFollow_logintopage()"
										style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white; background-color: black;">
										팔로우</button>
									<input type="hidden" name="user_id_email"
										value="${user_id_email }"> <input type="hidden"
										name="page_id_email" value="${page_id_email}">
								</form>
							</c:when>
							<c:when test="${follow_page_me eq '1'}">
								<form name="follow_del_haswil" id="follow_del_haswil">
									<button type="button" name="follow_del_haswil"
										onclick="getFollow_logintopage_del()"
										style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white; background-color: black;">
										팔로우해제</button>
									<input type="hidden" name="user_id_email"
										value="${user_id_email }"> <input type="hidden"
										name="page_id_email" value="${page_id_email}">
								</form>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<!-- 프로필 편집 or 팔로우 끝 -->
				<!-- 팔로워 팔로잉 위젯 시작 -->
				<div id="Widget"
					style="width: 100%; margin: 20px 0 0 0; display: table;">
					<div style="display: table-cell;">
						<!--  -->

						<script type="text/javascript">
					function getFollower() {
						/* background-color 값 가져오기 */
						var Follower_button_background_color = $(".Follower_button").css("background-color");
						var Following_button_background_color = $(".Following_button").css("background-color");
						/* #getFollower_form, #getFollowing_form form 에 있는 모든 내용 가져오기 */
						var formData = $("#getFollower_form, #getFollowing_form").serialize();
						/* formData 에 key value 값 입력 */
						formData += "&Follower_button_background_color=" + Follower_button_background_color;
						formData += "&Following_button_background_color=" + Following_button_background_color;
						$.ajax({
							/* pys/MyPage_Ajax_Controller - getFollowringAjax */
							url:"<%=context%>/getFollowerAjax",
							type:"POST",
							data:formData,
							dataType:'json',
							success:function(data){
								/* background-color 바꾸기 */
								$(".Follower_button").css("background-color", data.Follower_button_background_color);
								$(".Following_button").css("background-color", data.Following_button_background_color);
								/* Follower 내용 보이기 */
								$(".Following_scroll").hide();
								$(".Follower_scroll").show();
								$("#Follower_search").show();
								$("#Following_search").hide();
							}
						});
					}
					function getFollowing() {
						/* background-color 값 가져오기 */
						var Follower_button_background_color = $(".Follower_button").css("background-color");
						var Following_button_background_color = $(".Following_button").css("background-color");
						/* #getFollower_form, #getFollowing_form form 에 있는 모든 내용 가져오기 */
						var formData = $("#getFollower_form, #getFollowing_form").serialize();
						/* formData 에 key value 값 입력 */
						formData += "&Follower_button_background_color=" + Follower_button_background_color;
						formData += "&Following_button_background_color=" + Following_button_background_color;
						$.ajax({
							/* pys/MyPage_Ajax_Controller - getFollowringAjax */
							url:"<%=context%>/getFollowingAjax",
							type:"POST",
							data:formData,
							dataType:'json',
							success:function(data){
								/* background-color 바꾸기 */
								$(".Follower_button").css("background-color", data.Follower_button_background_color);
								$(".Following_button").css("background-color", data.Following_button_background_color);
								/* Following 내용 보이기 */
								$(".Following_scroll").show();
								$(".Follower_scroll").hide();
								$("#Follower_search").hide();
								$("#Following_search").show();
							}
						});
					}
				</script>
						<!--  -->
						<!-- 팔로워 or 팔로잉 버튼 시작 -->
						<form id="getFollower_form" style="margin: 0;">
							<button id="Follower_button" class="Follower_button"
								onclick="getFollower()" type="button"
								style="box-shadow: inset 0 0 0 2px palegoldenrod; width: 162.667px;font-family: JalnanOTF;font-size: 18px;background-color: palegoldenrod;color: rgb(81, 85, 67);border: 0px;outline: 0px;border-radius: 25px 25px 0px 0px;padding: 5px 0px;cursor: pointer;">
								팔로워 <span id="Follower_num"
									style="font-family: ChosunGu; color: black; font-size: 15px;">${follower_list.size() }명</span>
								
							</button>
						</form>
					</div>
					<div style="display: table-cell;">
						<form id="getFollowing_form" style="margin: 0;">
							<button id="Following_button" class="Following_button"
								onclick="getFollowing()" type="button"
								style="box-shadow: inset 0 0 0 2px palegoldenrod; width: 162.667px;font-family: JalnanOTF;font-size: 18px;background-color: rgb(255,250,250);color: rgb(81, 85, 67);border: 0px;outline: 0px;border-radius: 25px 25px 0px 0px;padding: 5px 0px;cursor: pointer;">
								팔로잉 <span id="Following_num"
									style="font-family: ChosunGu; color: black; font-size: 15px;">${following_list.size()}명</span>
							</button>
						</form>
						<!-- 팔로워 or 팔로잉 버튼 끝 -->
					</div>
				</div>
				<!-- 팔로워 or 팔로잉 검색 시작 -->
				<div
					style="width: 100%;height: 60px;background-color: palegoldenrod;">
					<input id="Follower_search" type="text"
						style="    font-family: 'ChosunGu'; width: 84%;border: 3px solid #d0cb96;border-radius: 15px;padding: 10px 0 10px 10px;margin: 10px 0 0 0;/* border: 0px; */outline: 0px;" placeholder="팔로워를 검색하세요">
					<input id="Following_search" type="text"
						style="    font-family: 'ChosunGu'; display: none; width: 84%;border: 3px solid #d0cb96;border-radius: 15px;padding: 10px 0 10px 10px;margin: 10px 0 0 0;/* border: 0px; */outline: 0px;"
						placeholder="팔로잉을 검색하세요">
				</div>
				<script type="text/javascript">
			$(document).on('keyup', '#Follower_search', function(e) {
				
				var Vsearch = $('#Follower_search').val();
				var Vuser_id_email = $('#user_id_email').val();
				
				$.ajax({
					url:"<%=context%>/getFollower_searchAjax",
					type:"POST",
					data:{search:Vsearch, user_id_email:Vuser_id_email},
					dataType:'text',
					success:function(data){
						$("#Follower_scroll").load(" #Follower_scroll > *", {"Follower_scroll":data});
					}
				});
			});
			
			$(document).on('keyup', '#Following_search', function(e) {
				
				var Vsearch = $('#Following_search').val();
				var Vuser_id_email = $('#user_id_email').val();
				
				$.ajax({
					url:"<%=context%>/getFollowing_searchAjax",
					type:"POST",
					data:{search:Vsearch, user_id_email:Vuser_id_email},
					dataType:'text',
					success:function(data){
						$("#Following_scroll").load(" #Following_scroll > *", {"Following_scroll":data});
					}
				});
			});
			</script>
				<!-- 팔로워 or 팔로잉 검색 끝 -->
				<script type="text/javascript">
				$(document).ready(function(){
					/* Follow_scroll 스크롤이 끝까지 내려갈 경우 loadNext_Follow 실행 */
					$(".Follow_scroll").scroll(function() {
						if ($(".Follow_scroll").scrollTop() + $(".Follow_scroll").innerHeight() >= $(".Follow_scroll")[0].scrollHeight) {
							loadNext_Follow();
						}
					});
				});
				
				function loadNext_Follow() {
					
				}
				
				function getFollowing_haeseum(e, d) {
					var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_haeseumAjax */
						url:"<%=context%>/getFollowing_haeseumAjax",
						type:"POST",
						data:formData,
						dataType:'text',
						success:function(data){
							$(e.Following_haeseum).hide();
							$("#Following_scroll").load(" #Following_scroll > *");
							// $("#Follower_num").load(" #Follower_button");
							document.getElementById("Following_num").innerHTML=data+"명";
						}
					});
				}
				
				function getFollowing_del(e, d) {
					var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_delAjax */
						url:"<%=context%>/getFollowing_delAjax",
						type:"POST",
						data:formData,
						dataType:'text',
						success:function(data){
							$(e.del).hide();
							$(e.re).show();
							$("#Follower_scroll").load(" #Follower_scroll > *");
							document.getElementById("Following_num").innerHTML=data+"명";
						}
					});
				}
				
				function getFollowing_re(e, d) {
				var formData = $(e).serialize();
					
					$.ajax({
						/* pys/MyPage_Ajax_Controller - getFollowing_delAjax */
						url:"<%=context%>/getFollowing_reAjax",
									type : "POST",
									data : formData,
									dataType : 'text',
									success : function(data) {
										$(e.del).show();
										$(e.re).hide();
										$("#Follower_scroll").load(
												" #Follower_scroll > *");
										// $("#Follower_scroll").load(" #Follower_scroll > *");
										document.getElementById("Following_num").innerHTML = data+"명";
									}
								});
					}
				</script>
				<div style="overflow: hidden;">

					<div id="Follower_scroll" class="Follower_scroll"
						style="width: 100%;height: 400px;background-color: palegoldenrod;overflow: hidden scroll;box-shadow: inset 0 0 0px 0px white;display: block;">
						<c:forEach var="follower_list" items="${follower_list }"
							varStatus="follower_list_status">
							<form style="margin: 0;" id="follow_page" name="follow_page">
								<input type="hidden" name="user_id_email"
									value="${userlist_page.get(0).getUser_id_email() }"> <input
									type="hidden" name="page_id_email"
									value="${follower_list.user_id_email }">
							</form>
							<form id="Follower_scroll_form${follower_list_status.index }"
								action="mypage?page_id_email=${follower_list.user_id_email }"
								method="post" style="margin: 0;">
								<input type="hidden" name="follower_list_follower_id_email"
									value="${follower_list.user_id_email }"> <input
									type="hidden" name="follower_list_user_id_email"
									value="${userlist_page.get(0).getUser_id_email() }"> <input
									type="hidden" name="page_id_email"
									value="${follower_list.user_id_email }"> <input
									type="hidden" name="user_id_email"
									value="${userlist_page.get(0).getUser_id_email() }">
								<div style="width: 300px; height: 75px;">
									<button type="submit"
										style="background-image: url('upload/profileIMG/${follower_list.user_image }'); cursor: pointer;outline: 0;border: 0;background-size: 100%;height: 60px;width: 60px;border-radius: 50%;margin: 0 10px 0 15px;float: left;">
									</button>
									
									<div style="float: left; width: 160px;">
										<div style="text-align: left;">
											<button type="submit"
												style="cursor: pointer;padding: 0;font-family: yg-jalnan;font-size: 18px;color: rgb(81, 85, 67);margin: 6px 0 0 0;background-color: #ffffff00;outline: 0;border: 0;">
												${follower_list.user_nickname }</button>
												</div>
											<div class="jumseage" 
												style=" text-align: left;width: 100%;font-family: ChosunGu;font-size: 13px;text-overflow: e;overflow: hidden;">
												${follower_list.user_intro }
											</div>
										</div>
									<div style="float: left;">
										<c:if
											test="${user_id_email eq userlist_page.get(0).getUser_id_email()}">
											<c:if test="${empty follower_list.haeseum }">
											<!-- class="Following_haeseum"${follower_list_status.index } -->
												<button type="button"
													class="Following_haeseum" id="Following_haeseum"
													onclick="getFollowing_haeseum(this.form, this);"
													style="width: 50px;padding: 2px 0 2px 0;/* margin: 50% 0 0 0; */border-radius: 20px;font-family: ChosunGu;color: white;margin: 19px 0 0 0;border: 0;outline: 0;background-color: olivedrab;/* box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; */cursor: pointer;">
													팔로우</button>
											</c:if>
										</c:if>
									</div>
								</div>
							</form>
						</c:forEach>
					</div>
					<div id="Following_scroll" class="Following_scroll"
						style="width: 100%;height: 400px;background-color: palegoldenrod;overflow: hidden scroll;box-shadow: inset 0 0 0px 0px white; display: none;">
						<div id=>
							<c:forEach var="following_list" items="${following_list }"
								varStatus="following_list_status">
								<form id="Following_scroll_form${following_list_status.index }"
									action="mypage?page_id_email=${following_list.user_id_email }"
									style="margin: 0;">
									<input type="hidden" name="follower_list_follower_id_email"
									value="${following_list.user_id_email }"> <input
									type="hidden" name="follower_list_user_id_email"
									value="${userlist_page.get(0).getUser_id_email() }"> <input
									type="hidden" name="page_id_email"
									value="${following_list.user_id_email }"> <input
									type="hidden" name="user_id_email"
									value="${userlist_page.get(0).getUser_id_email() }">
									<div style="width: 300px; height: 75px;">
										<button type="submit"
										
											style="background-image: url('upload/profileIMG/${following_list.user_image }'); cursor: pointer;outline: 0;border: 0;background-size: 100%;height: 60px;width: 60px;border-radius: 50%;margin: 0 10px 0 15px;float: left;">
										</button>
										<div style="float: left; width: 160px;">
										<div style="text-align: left;">
											<button type="submit"
												style="cursor: pointer;padding: 0;font-family: yg-jalnan;font-size: 18px;color: rgb(81, 85, 67);margin: 6px 0 0 0;background-color: #ffffff00;outline: 0;border: 0;">
												${following_list.user_nickname }</button>
												</div>
											<div class="jumseage" 
												style=" text-align: left;width: 100%;font-family: ChosunGu;font-size: 13px;text-overflow: e;overflow: hidden;">
												${following_list.user_intro }
											</div>
										</div>
										<c:if
											test="${user_id_email eq userlist_page.get(0).getUser_id_email()}">
												<button type="button"
													class="Following_del${following_list_status.index }"
													onclick="getFollowing_del(this.form, this);" id="del"
													style="width: 40px;padding: 2px 0 2px 0;/* margin: 50% 0 0 0; */border-radius: 20px;font-family: ChosunGu;color: white;margin: 19px 0 0 0;border: 0;outline: 0;background-color: olivedrab;/* box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; */cursor: pointer;">
													삭제</button>
												<button type="button"
													class="Following_re${following_list_status.index }"
													onclick="getFollowing_re(this.form, this);" id="re"
													style="display: none; width: 40px;padding: 2px 0 2px 0;/* margin: 50% 0 0 0; */border-radius: 20px;font-family: ChosunGu;color: white;margin: 19px 0 0 0;border: 0;outline: 0;background-color: olivedrab;/* box-shadow: inset 0px 0px 0 2px white, 0px 3px 0 0 black; */cursor: pointer;">
													팔로우</button>
										</c:if>
									</div>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>

				<!-- 팔로워 팔로잉 위젯 끝 -->
			</div>
			<!-- 프로필 내용 끝 -->
		</div>
		<!-- 프로필 영역 끝 -->
	 
	<div class="point" style="font-family: ChosunGu; margin-left: 500px; padding-top: 150px;">
       <h1 style="font-family:yg-jalnan; color: #784331; margin-left: 40px; text-align: center;">열매 내역</h1>
       <div class="myPoint" style="text-align: right; margin-right: 10px; margin-bottom: 3px;">
       <b style="font-size: 15px;">내 현재 열매 :</b>&nbsp;<img alt="" src="/pys/img/도토리.png" style="width: 18px; position: relative; bottom: -2;"><span style="font-family: yg-jalnan; font-size: 20px; color: #DB9C67;"><fmt:formatNumber pattern="#,###">${myPoint }</fmt:formatNumber></span>&nbsp;<span style="font-family: 'JalnanOTF'; color: #784331; font-size: 18px;">열매</span>
       </div>        
      <table style="border-collapse:collapse;">
         <tr>
            <th style="border-radius: 20px 0 0 0;">날짜</th><th>내용</th><th>열매 적립</th><th>열매 차감</th><th>잔액</th><th style="border-radius: 0 20px 0 0;">참여한 챌린지</th>
         </tr>
         <c:forEach var="point" items="${point_list }">
            <tr>
               <td class="line"><fmt:formatDate value="${point.point_timestamp }" pattern="yy/MM/dd HH:mm:ss"/></td>
               <td class="line">${point.point_memo }</td>
               <c:if test="${point.point_plus != 0}">
               <td class="line">+ ${point.point_plus }</td>
               </c:if>
               <c:if test="${point.point_plus == 0}">
               <td class="line"></td>
               </c:if>
               <c:if test="${point.point_minus != 0}">
               <td class="line" >- ${point.point_minus }</td>
               </c:if>
               <c:if test="${point.point_minus == 0}">
               <td class="line"></td>
               </c:if>
               <td class="line">${point.point_balance }</td>
               <c:if test="${point.chg_num != 0}">
               <td class="line"><a href="challengeDetail?chg_num=${point.chg_num }">${point.chg_num }</a></td>
               </c:if>
               <c:if test="${point.chg_num == 0}">
               <td class="line"></td>
               </c:if>
               
            </tr>
         </c:forEach>
      </table>
      <div class="page" style="margin-top:30px; text-align: center; font-family: 'ChosunGu'; font-weight: bold;">
      <c:if test="${pg.startPage > pg.pageBlock }">
         <a href="mypage_point?user_id_email=${user_id_email }&page_id_email=${page_id_email }&user_nickname=${userlist_me.get(0).getUser_nickname() }&user_image=${userlist_me.get(0).getUser_image()}&currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
         <a href="mypage_point?user_id_email=${user_id_email }&page_id_email=${page_id_email }&user_nickname=${userlist_me.get(0).getUser_nickname() }&user_image=${userlist_me.get(0).getUser_image()}&currentPage=${i}">[${i}]</a>
      </c:forEach>
      <c:if test="${pg.endPage < pg.totalPage }">
         <a href="mypage_point?user_id_email=${user_id_email }&page_id_email=${page_id_email }&user_nickname=${userlist_me.get(0).getUser_nickname() }&user_image=${userlist_me.get(0).getUser_image()}&currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
      </c:if>
       </div>
    </div>    
    </div>        
	<div>
	<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
	</div>
</body>
</html>