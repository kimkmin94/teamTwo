<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>

<%
   String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
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

#scrollhea::-webkit-scrollbar{width: 16px;}
#scrollhea::-webkit-scrollbar-track {background-color:#fff6e9;}
#scrollhea::-webkit-scrollbar-thumb {background-color:palegoldenrod; border-radius: 10px;}
#scrollhea::-webkit-scrollbar-thumb:hover {background:#555;}
#scrollhea::-webkit-scrollbar-button:start:decrement {width:16px;height:16px;background:#fff6e9;}
#scrollhea::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#fff6e9;}

#follw_cha_div::-webkit-scrollbar{width: 16px;}
#follw_cha_div::-webkit-scrollbar-track {background-color:#fff6e9;}
#follw_cha_div::-webkit-scrollbar-thumb {background-color:palegoldenrod; border-radius: 10px;}
#follw_cha_div::-webkit-scrollbar-thumb:hover {background:#555;}
#follw_cha_div::-webkit-scrollbar-button:start:decrement {width:16px;height:16px;background:#fff6e9;}
#follw_cha_div::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#fff6e9;}

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}

</style>
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
                              style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white;background-color: #9E8173;">
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
                              style="cursor: pointer; border: 0; outline: 0; width: 50%; margin: 0 25% 0 25%; padding: 10px 0 10px 0; font-family: ChosunGu; font-size: 15px; border-radius: 35px; color: white;background-color: #9E8173;">
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
                           <input type="hidden" name="following_list_following_id_email"
                           value="${following_list.user_id_email }"> <input
                           type="hidden" name="following_list_user_id_email"
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

      <!-- 메인 영역 시작 -->
      <div style="width: 950px; margin: 0 0 0 50px; float: left;">
         <!-- 달력 영역 시작 -->
         <div
            style="width: 950px;width: 950px;height: 80px;background-color: palegoldenrod;border-radius: 25px 25px 0 0;overflow: hidden;">
            <div style="width: 950px; height: 70px;">
               <div
                  style="width: 250px; height: 100%; box-sizing: border-box; float: left;">
                  <div
                     style="width: 240px;/* height: 60px; */line-height: 45px;margin: 16px 0 0 10px;/* box-shadow: inset 0 0 0 2px white; */border-radius: 15px;background-color: white;">
                     <div
                        style="font-family: JalnanOTF;font-size: 25px;text-align: center;color: rgb(81, 85, 67);padding: 5px 0 0 0;">
                        ${calendar.get(5).getMonth() }월</div>
                  </div>
               </div>
               <div style="width: 700px; height: 100%; float: left;">
                  <div
                     style="width: 680px; height: 60px; margin: 10px 0 0 10px; border-radius: 20px;">
                     <c:forEach var="calendar" items="${calendar }">
                        <div
                           style="width: 50px; height: 50px; border-radius: 15px; margin: 5.9065px 5.9065px 0 5.9065px; background-color: white; float: left;">
                           <div
                              style="margin: 6px 0 0 0; width: 100%; height: 40%; text-align: center; font-size: 15px; font-family: ChosunGu; color: black;">
                              ${calendar.day }</div>
                           <div
                              style="width: 100%; height: 40%; text-align: center; font-size: 15px; font-family: ChosunGu; color: black;">
                              ${calendar.week }</div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
         <div
            style="width: 950px; overflow: hidden;">
            <div id="scrollhea" class="scrollhea"
               style="width: 950px; height: 300px; background-color: #FBF5EC; border-bottom: 4px solid #FBF5EC; overflow-y: scroll; overflow-x: hidden;">
               <c:forEach var="challenges" items="${calendar_master }">
                  <div style="width: 950px; height: 55px;">
                     <div
                        style="width: 250px; height: 100%; box-sizing: border-box; float: left;">
                        <div
                           style="width: 240px;     line-height: 43px; font-family: ChosunGu; text-align: center; margin: 10px 0 0 10px; border-radius: 20px; background-color: white;">
                           <a href="challengeDetail?chg_num=${challenges.chg_num }" style="text-decoration: none; visibility: black;">
                           <c:choose>
                        <c:when test="${fn:length(challenges.chg_title) gt 15}">
                           <c:out value="${fn:substring(challenges.chg_title, 0, 15)}">... </c:out>
                        </c:when>
                        <c:otherwise>
                           <c:out value="${challenges.chg_title}"> </c:out>
                        </c:otherwise>
                     </c:choose>
                     </a>
                     </div>
                     </div>
                     <div style="width: 700px; height: 100%; float: left;">
                        <div
                           style="width: 680px;height: 43px;margin: 10px 0 0 10px;border-radius: 20px;background-color: white;overflow: hidden;">
                           <div
                              style="width: calc((61.813px * ${challenges.end_day_between}) + (61.813px * ${challenges.start_day_between}) + 150px );">
                              <div
                                 style="border-radius: 10px; background-color: #916657; width: calc(61.813px * ${challenges.end_day_between}); margin: 16px 0 0 calc(61.813px * ${challenges.start_day_between} + 30.906px); height: 30%; float: left;"></div>
                              <img src="/pys/img/도토리.png"
                                 style="width: 31px;left: -18px;position: relative;top: 3px;float: left;">
                           </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
               <c:forEach var="challenges" items="${challenges }">
                  <div style="width: 950px; height: 55px;">
                     <div
                        style="width: 250px; height: 100%; box-sizing: border-box; float: left;">
                        <div
                           style="width: 240px;     line-height: 43px; font-family: ChosunGu; text-align: center; margin: 10px 0 0 10px; border-radius: 20px; background-color: white;">
                           <a href="challengeDetail?chg_num=${challenges.chg_num }" style="text-decoration: none; visibility: black;">
                           <c:choose>
                        <c:when test="${fn:length(challenges.chg_title) gt 15}">
                           <c:out value="${fn:substring(challenges.chg_title, 0, 15)}">... </c:out>
                        </c:when>
                        <c:otherwise>
                           <c:out value="${challenges.chg_title}"> </c:out>
                        </c:otherwise>
                     </c:choose>
                     </a>
                     </div>
                     </div>
                     <div style="width: 700px; height: 100%; float: left;">
                        <div
                           style="width: 680px;height: 43px;margin: 10px 0 0 10px;border-radius: 20px;background-color: white;overflow: hidden;">
                           <div
                              style="width: calc((61.813px * ${challenges.end_day_between}) + (61.813px * ${challenges.start_day_between}) + 150px );">
                              <div
                                 style="border-radius: 10px; background-color: #916657; width: calc(61.813px * ${challenges.end_day_between}); margin: 16px 0 0 calc(61.813px * ${challenges.start_day_between} + 30.906px); height: 30%; float: left;"></div>
                              <img src="/pys/img/도토리.png"
                                 style="width: 31px;left: -18px;position: relative;top: 3px;float: left;">
                           </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
               <c:if test="${challenges.size() eq 0 && calendar_master.size() eq 0 }">
                  <img src="/pys/img/없다람쥐.png"
                     style="width: 320px; margin: 0 0 0 300px;">
               </c:if>
            </div>
         </div>
         <!-- 달력 영역 끝 -->
         <!-- 포인트 / 차트 영역 시작 -->
         <div style="margin: 30px 0 0 0;">
            <div class="coint_chart_clear" style="width: 100%; clear: both;">
               <!-- 포인트 영역 시작 -->
               <div
                  style="height: 260px;width: 48.5%;/* box-shadow: inset 0 0 0 3px #eee8aa; *//* margin: 0 50px 0 50px; */margin: 0 3% 0 0;float: left;top: 3px;background-color: #FBF5EC;position: relative;border-radius: 20px 20px 0 0;">
                  <div style="width: 100%;">
                     <div style="margin: 20px 20px 0 20px">
                        <form action="mypage_point" style="margin: 0 0 15px 0; float: left;">
                           <img alt="" src="/pys/img/도토리.png" style="width: 28px;">
                           <a
                              style="font-family: JalnanOTF; font-size: 27px; color: #DB9C67; top: -3px; position: relative;"><fmt:formatNumber value="${points.get(0).getPoint_balance() }" pattern="#,###" /></a>
                           <a
                              style="font-family: JalnanOTF; font-size: 21px; color: #784331; top: -4px; position: relative;">열매</a>
                           <input type="submit" value="more..."
                              style="top: -4px; position: relative; font-family: 'ChosunGu'; font-size: 18px; font-weight: bold; color: #ADADAD; background-color: #FBF5EC; border: 0; outline: 0; cursor: pointer;">
                        </form>
                     </div>
                  </div>

                  <c:forEach var="points" items="${points}" begin="0" end="4">
                     <div style="width: 90%; margin: 0 0 0 5%;">
                        <div
                           style="width: 70%; font-family: ChosunGu; font-size: 18px; float: left; margin: 0 0 15px 0;">
                           - ${points.point_memo}</div>
                        <div
                           style="top: -5px; position: relative;width: 30%; font-family: ChosunGu; font-size: 25px; float: left;">
                           <c:choose>
                              <c:when test="${points.point_plus ne '0'}">
                                 <img class="dotori" src="/pys/img/도토리.png"
                                    style="width: 22px;"> <span style="font-size: 20px; top: -3px;  position: relative;">+<fmt:formatNumber value="${points.point_plus}" pattern="#,###" /></span>
                  </c:when>
                              <c:otherwise>
                                 <img class="dotori" src="/pys/img/도토리.png"
                                    style="width: 22px;"> <span style="font-size: 20px; top: -3px;  position: relative;">-<fmt:formatNumber value="${points.point_minus}" pattern="#,###" /></span>
                  </c:otherwise>
                           </c:choose>
                        </div>
                     </div>
                  </c:forEach>
               </div>
               <!-- 포인트 영역 끝 -->
               <!-- 차트 영역 시작 -->

               <div
                  style="height: 260px;width: 48.5%;/* box-shadow: inset 0 0 0 3px #eee8aa; */float: left;border-radius: 20px 20px 0 0;background-color: #fbf5ec;">
                  <c:choose>
                     <c:when
                        test="${ch_success eq 0 && ch_progress eq 0 && ch_fail eq 0}">
                        <img src="/pys/img/없다람쥐.png"
                           style="width: 250px; margin: 0 0 0 50px;">
                     </c:when>
                     <c:otherwise>
                     <div style="margin: 25px 20px 10px 27px;  width: 100%;">
                     <div style="float: left; width:25px; height:25px; border-radius: 50%; background: conic-gradient(#C9DECF ${ch_success_p_1} ${ch_success_p_2}, #F5DDAD ${ch_progress_p_1} ${ch_progress_p_2}, #F1BCAE ${ch_fail_p_1} ${ch_fail_2}); float: left;">
                         </div>   
                     <div style="float:left; font-family: 'JalnanOTF'; font-size: 21px; color: #784331; margin: 0 0 0 7px;  top: -5px;
    position: relative;">
                            챌린지 차트
                            </div>
                         </div>
                         
                         <div style="float: left; margin: 17px 0 0 75px;">
                        <div
                           style="width:150px; height:150px; border-radius: 50%; background: conic-gradient(#C9DECF ${ch_success_p_1} ${ch_success_p_2}, #F5DDAD ${ch_progress_p_1} ${ch_progress_p_2}, #F1BCAE ${ch_fail_p_1} ${ch_fail_2}); float: left;">
                        </div>
                        
                        <div style="float: left;     top: 49px;   position: relative;   margin: 0 0 0 21px;">
                           <div
                              style="width: 160px; font-family: ChosunGu; font-size: 13px;">
                              <div
                                 style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
                                 <div
                                    style="width: 6px; height: 6px; margin: 2px; background-color: #C9DECF;">
                                 </div>
                              </div>
                              &nbsp;성공 챌린지 :&nbsp; ${ch_success } 개
                           </div>
                           <div
                              style="width: 160px; font-family: ChosunGu; font-size: 13px;">
                              <div
                                 style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
                                 <div
                                    style="width: 6px; height: 6px; margin: 2px; background-color: #F5DDAD;">
                                 </div>
                              </div>
                              &nbsp;진행 챌린지 :&nbsp; ${ch_progress } 개
                           </div>
                           <div
                              style="width: 160px; font-family: ChosunGu; font-size: 13px;">
                              <div
                                 style="width: 10px; height: 10px; margin: 3px 0 0 0; box-shadow: inset 0 0 0 1px black; background-color: white; float: left;">
                                 <div
                                    style="width: 6px; height: 6px; margin: 2px; background-color: #F1BCAE;">
                                 </div>
                              </div>
                              &nbsp;실패 챌린지 :&nbsp; ${ch_fail } 개
                           </div>
                        </div>
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
               <!-- 차트 영역 끝 -->
            </div>
         </div>
         <!-- 포인트 / 차트 영역 끝 -->
         

         
         <!-- 팔로잉 유저 참여 챌린지 시작 -->
         <div style="margin: 30px 0 0 0;">
            <div style="border-radius: 20px 20px 0 0; background-color: #FBF5EC; width: 100%;">
               <div style="font-family: 'JalnanOTF'; font-size: 21px; color: #784331; overflow: hidden; padding: 20px 0 0 20px;">
                  <img src="/pys/img/어깨동무.png" style="float: left; width: 30px; margin: 0 10px 0 0;">
                  <div style="float: left;">
                  팔로잉 유저가 참여중인 챌린지
                  </div>
               </div>
               <c:if test="${follwer_challenge.size() eq 0 }">
                  <div>
                  <img src="/pys/img/없다람쥐.png"
                     style="width: 320px; height: 320px; margin: 0 0 0 300px;">
                  </div>
               </c:if>
            </div>
            <div class="follw_cha_div" id="follw_cha_div" style="background-color: #FBF5EC; overflow-x: scroll; overflow-y: hidden;">
            <div style="width: calc(${follwer_challenge.size() } * 250px)">
         <c:forEach var="follwer_challenge" items="${follwer_challenge }" >
                  <div style="float: left; width: 237.5px; margin: 10px 0 10px 0;">
                     <div style="background-color: #f5ddad; color: #515543;  border-radius: 10px; width: 200px; line-height: 33px; margin: 0 auto;">
                     <div class="follwer_cha_ti" style="font-family: 'ChosunGu'; font-weight: bold;width: 90%; text-align: center; margin: 0 auto; margin-bottom: 10px;">
                     ${follwer_challenge.chg_title }
                     </div>
                     </div>
                     <div style="border-radius: 20px; margin: 0 auto; margin-bottom: 10px; width: 200px; height: 200px; background-size: cover; background-repeat: no-repeat; background-image: url(upload/mainIMG/${follwer_challenge.chg_image }); object-fit: cover;">
                     </div>
                     <div style="width: 90%; margin: 0 auto; ">
                     <div class="f_ch_name" style="margin: 0 auto; width: 70%;">
                     <div style="display: inline-block; float: left; width:25px; height:25px; border-radius: 50%; background-size: 100%; background-image: url('upload/profileIMG/${follwer_challenge.user_image }'); ">
                     </div>
                     <div style="display: inline-block; float: left; font-family: 'JalnanOTF'; margin: 0 0 0 5px; color: rgb(81, 85, 67);">
                     ${follwer_challenge.user_nickname }
                     </div>
                     </div>
                     </div>
                  </div>            
         </c:forEach>
         </div>
         </div>
         </div>
         <!-- 팔로잉 유저 참여 챌린지 끝 -->
         <!-- 팔로잉 유저 참여 챌린지 시작 -->
         <div style="margin: 30px 0 0 0;">
            <div style="border-radius: 20px 20px 0 0; background-color: #FBF5EC; width: 100%;">
               <div style="font-family: 'JalnanOTF'; font-size: 21px; color: #784331; overflow: hidden; padding: 20px 0 0 20px;">
                  <img src="/pys/img/참여중.png" style="float: left; width: 30px; margin: 0 10px 0 0;">
                  <div style="float: left;">
                  팔로잉 유저가 모집중인 챌린지
                  </div>
               </div>
               <c:if test="${follwer_challenge_master.size() eq 0 }">
                  <div>
                  <img src="/pys/img/없다람쥐.png"
                     style="width: 320px; height: 320px; margin: 0 0 0 300px;">
                  </div>
               </c:if>
            </div>
            <div class="follw_cha_div" id="follw_cha_div" style="background-color: #FBF5EC; overflow-x: scroll; overflow-y: hidden;">
            <div style="width: calc(${follwer_challenge_master.size() } * 250px)">
         <c:forEach var="follwer_challenge" items="${follwer_challenge_master }" >
                  <div style="float: left; width: 237.5px; margin: 10px 0 10px 0;">
                     <div style="background-color: #f5ddad; color: #515543; border-radius: 10px; width: 200px; line-height: 33px; margin: 0 auto;">
                     <div class="follwer_cha_ti" style="font-family: 'ChosunGu'; font-weight: bold;width: 90%; text-align: center; margin: 0 auto; margin-bottom: 10px;">
                     ${follwer_challenge.chg_title }
                     </div>
                     </div>
                     <div style="border-radius: 20px; margin: 0 auto; margin-bottom: 10px; width: 200px; height: 200px; background-size: cover; background-repeat: no-repeat; background-image: url(upload/mainIMG/${follwer_challenge.chg_image }); object-fit: cover;">
                     </div>
                     <div style="width: 90%; margin: 0 auto; ">
                     <div class="f_ch_name" style="margin: 0 auto; width: 70%;">
                     <div style="display: inline-block; float: left; width:25px; height:25px; border-radius: 50%; background-size: 100%; background-image: url('upload/profileIMG/${follwer_challenge.user_image }'); ">
                     </div>
                     <div style="display: inline-block; float: left; font-family: 'JalnanOTF'; margin: 0 0 0 5px; color: rgb(81, 85, 67);">
                     ${follwer_challenge.user_nickname }
                     </div>
                     </div>
                     </div>
                  </div>            
         </c:forEach>
         </div>
         </div>
         </div>
         <!-- 팔로잉 유저 참여 챌린지 끝 -->
      </div>
      <!-- 메인 영역 끝 -->

   </div>

   <div>
      <%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
   </div>

</body>
</html>