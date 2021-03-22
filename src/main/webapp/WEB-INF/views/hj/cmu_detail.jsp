<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<%
   String context = request.getContextPath();
    System.out.println("context->"+context);
%>

<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<style type="text/css">
@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.button_01_detail {
	background-color: #444230;
	color: white;
	border: 1px solid #7e715b;
	border-radius: 10px;
	width: 70px;
	height: 51px;
	font-family: ChosunGu;
	margin: 10px;
	position: relative;
	top: -2px;
	font-size: 15px;
}

.button_02_detail {
	background-color: white;
	color: #444230;
	border: 2px solid #444230;
	border-radius: 8px;
	width: 70px;
	height: 51px;
	font-family: ChosunGu;
	margin: 10px;
	position: relative;
	top: -2px;
	font-size: 15px;
}

.button_03_detail {
	background-color: #9f6e54;
	color: #ebd39f;
	border: 1px solid #7e715b;
	border-radius: 10px;
	width: 70px;
	height: 40px;
	font-family: ChosunGu;
	margin: 10px;
	float: right;
	margin-right: 50px;
	margin-top: 0px;
}

.detail_div1 {
	text-align: left;
	margin: 3px;
}

.detail_div1_p {
	font-family: ChosunGu;
	margin: 5px;
	font-size: 20px;
}

.detail_div1_p3 {
	margin: 5px;
	font-family: 'JalnanOTF';
	position: relative;
	font-weight: bold;
	color: #444230;
	font-size: 18px;
}

.detail_div1_p2 {
	font-family: ChosunGu;
	margin: 5px;
	position: relative;
	left: -110px;
	top: -1px;
	font-size: 18px;
}

.detail_div1_p1 {
	font-family: yg-jalnan;
	margin: 5px;
	font-size: 30px;
}

.detail_re_p1 {
	height: 50px;
	font-size: 18px;
	font-family: ChosunGu;
	margin-top: 15px;
	margin-bottom: 2px;
	color: grey;
}

.detail_re_p2 {
	height: 60px;
	font-size: 18px;
	font-family: ChosunGu;
	margin: 0px;
	position: relative;
	top: -5px;
	width: 750px;
	overflow: auto;
}

.repliy_re_div {
	width: 1470px;
	height: 10%;
	float: left;
	margin-left: 7%;
	margin-bottom: 50px;
}

.reply_img {
	width: 80px;
	height: 100px;
	margin-right: 15px;
}

.repliy_rere_div {
	
}

.detail_re_p_update {
	height: 25px;
	font-size: 20px;
	font-family: ChosunGu;
	margin-top: 15px;
	margin-bottom: 2px;
}

#footer {
	background-color: #9E8173;
	width: 100%;
	height: 130px;
	border-radius: 50px 50px 0px 0px;
	color: white;
	font-family: 'ChosunGu';
	margin: 200px 0 0 0;
}

.footerCon {
	padding-top: 1px;
	padding-left: 40px;
	font-size: 12px;
}

#re_img {
	width: 80px;
	height: 80px;
	margin-right: 15px;
	position: relative;
	bottom: -10px;
	border-radius: 50%;
	object-fit: cover;
}

#replyUpdate {
	width: 52%;
	height: 50px;
	margin-left: -8px;
	font-size: 20px;
	font-family: 'ChosunGu';
	padding: 5px;
}

@media screen and (max-width: 1600px) {
	#footer {
		background-color: #9E8173;
		width: 1600px;
		height: 130px;
		border-radius: 50px 50px 0px 0px;
		color: white;
		font-family: 'ChosunGu';
		margin: 200px 0 0 0;
	}
}
</style>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

 

   function getReply_insert(){
      //댓글 등록
      var contextPath='${pageContext.request.contextPath}';
      var b_num = $('input[name=b_num]').val();
      var reply = $('input[name=reply]').val();
      if(reply==""){
         alert("댓글을 작성해 주세요");
         $('#reply').focus();

      }else{
         $.ajax({
            url       : "<%=context%>/reply_insert",
            dataType   : 'text',
            data      : $('#form').serialize(), //id="form"인 form의 데이터 가져오기
            success      : function(data){
                  console.log("확인");
                  if(data == "good"){
                        //성공
                        alert("등록성공");
                        location.reload(); //새로고침
                           
                     }else{
                        //실패
                        alert("등록실패");
                     }
                  }
               });
            }
         
      }
   
    function updateReply(re_no){
       //댓글 수정 => 1.댓글을 수정할 수 있게 text 값을 받을 div로 바꿔줌
       var re_contents = $('input[name=re_contents]').val();
       
       var div = "";
        div += '<div class="detail_div1">';
       div += '<input type="text"    id="replyUpdate" name="replyUpdate" placeholder="댓글을 수정하세요" value="'+re_contents+'">';
       div += '<input type="button"  id="button_01_detail" name="replyUp" value="수정하기" class="button_01_detail" onclick="getReply_update('+re_no+');">';
       div += '<input type="rest"    id="button_02_detail" name="replyUp" value="취소하기" class="button_02_detail" onclick="location.reload();">';
       div += '</div>';
       
       $('#di'+re_no).replaceWith(div); //댓글이 있는 자리에 수정 할 수 있는 div로 바꿈
       
      
       } 
    
    function getReply_update(re_no){
       //댓글 수정 =>2. 댓글 수정하기 버튼을 누를 떼 실행 되는 아작스(실제 수정)
       var contents = $('input[name=replyUpdate]').val();
       if(contents != ""){
        $.ajax({
          url : "<%=context%>/Reply_update",
          dataType   : 'text',
          data      : {re_no : re_no,contents : contents}, //data 여러개 받을 때
          success   : function(data){
             
             if(data == "good"){
                  //성공
                  alert("수정성공");
                  location.reload(); //새로고침
               }else{
                  //성공
                  alert("수정실패");
               }
             }
          }); 
        
       }else{
            alert("댓글을 작성해 주세요");
            $('#replyUpdate').focus();
       }
       
    }
    
    function deleteReply(re_no) {
      //댓글 삭제이지만 상태를 -1로
      $.ajax({
          url       : "<%=context%>/deleteReply",
          dataType   : 'text',
          data      : {re_no : re_no}, 
          success    : function(data){
             if(data == "result"){
                  //성공
                  alert("삭제성공");
                  location.reload(); //새로고침
               }else{
                  //성공
                  alert("삭제실패");
                  
               }
          }

      });
      
   }
 
   
   
   function updateLike(){
      
      var b_num = $('input[name=b_num]').val();
      
         $.ajax({
      
            url       : "<%=context%>/updateLike",
            dataType    : 'text',
            data      : {b_num : b_num},
            success      : function(data){
               var lickCnt = parseInt(data);    //문자를 정수형 숫자로 변환해줌
               alert("추천되었습니다");
               $('#like1').html(lickCnt);
            }
         
         });

   }
   
</script>

</head>
<body>

   <div style="height: 70px; margin: 0 0 15px 0;">
   	<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
   </div>
   
<!--로그인 정보 가져오기  -->

<div style="width: 100%; min-width:1650px; text-align: center;  ">
   <div style="width: 1200px; margin: 0 auto;">
      <form action="" id="form">
         <input type="hidden" name="user_id_email" value="${user_info.user_id_email }">
         <input type="hidden" name="user_nickname" value="${user_info.user_nickname }">
         <input type="hidden" name="user_image" value="${user_info.user_image }">
      
       
         <div style=" width: 40%; float: left; ">
            <div class="detail_div1">
               <p class="detail_div1_p">[${com.b_subject }]</p>
            </div>
            <div class="detail_div1">
               <p class="detail_div1_p1">${com.b_title}</p>
            </div>
             <div style=" width: 10%; float: left; display: inline-block;">
            <input type="image" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" src="/upload/profileIMG/${com.user_image}">
           </div>
            <div class="detail_div1" style="display: inline-block;">
               <p class="detail_div1_p3">${com.b_nickname }</p>
               <input type="hidden" name="user_id_email" value="${com.b_id_email}">
            </div>
            <div class="detail_div1" style="display: inline-block;">
               <p class="detail_div1_p2" style="margin-left: 115px;"><fmt:formatDate value="${com.b_regdate }" pattern="yyyy/MM/dd HH:mm:ss"/></p>

            </div>
         </div>
         <div style=" width: 20%; height:83px;float: right; vertical-align: bottom; font-size: 20px;">
               <span
                  style="width: 10px; top: 150px; font-family: 'ChosunGu'; font-size: 18px; font-weight: bold; color: #444230;">
                  <input type="button" value="❤" id="like" name="좋아요" style="color: red; border: none;background-color: white;"
                  onclick="updateLike()" readonly="readonly">&nbsp;&nbsp;:
                  <span id="like1">${com.b_like_count }</span>
               </span>&nbsp;&nbsp; <span
                  style="width: 5%; top: 150px; font-family: 'ChosunGu'; font-size: 18px; font-weight: bold; color: #444230;">
                  조회수 : ${com.b_view_count } </span>
            </div>
         <br>
         <hr style="width: 100%; position: relative; border: 0px; border-top: 1px solid #BFBFBF;">
         <div style="width: 1200px;">
            <c:if test="${com.b_image != null}">
               <img alt="" src="/upload/cmuIMG/${com.b_image}" style="width: 400px; height: 400px; object-fit: contain;">
               <br><br>
               <div>${com.b_contents}</div>
               <br><br>
            </c:if>
            <c:if test="${com.b_image == null }">
               <br><br>
               <div style="width: 800px; height: 500px; text-align: center;">${com.b_contents}</div>
               <br><br>
            </c:if>
         </div>
         <c:if test="${com.b_id_email == user_info.user_id_email}">
         <div style="float: right; width: 33%;">
            <!--게시글 수정 ,  삭제  -->
            <input type="button" onclick="location.href='delete?b_num=${com.b_num}'" value="삭제"  class="button_01_detail">
            <input type="button" onclick="location.href='update?b_num=${com.b_num}'" value="수정"  class="button_02_detail">
         </div>
         </c:if>
         <hr style="width: 100%; position: relative; border: 0px; border-top: 1px solid #BFBFBF;">
   
      <!--댓글작업 -->
      <div>
         <div >
               <div id="totalRe" style="text-align: left; margin-left: 50px; ">
                  <p style="font-size: 20px; margin-left: 22px; font-family: 'ChosunGu'; font-weight: bold; color: #444230; display: inline-block;" id="cCnt">총 </p>
              <p style="display: inline-block; font-family: 'JalnanOTF'; color: #5B874A; font-size: 40px; position: relative; margin-left: 5px; bottom: -3px;">${replyTotal}</p>
              <p style="font-size: 20px; font-family: 'ChosunGu'; font-weight: bold; color: #444230; display: inline-block;">개의 댓글</p>
                  <input type="hidden" name="b_num" value="${com.b_num}">
               </div>
               <br>
               <input type="text"  id="reply" name="reply" required="required" style="width: 80%; height: 50px; margin-left: 5px; font-size: 20px; font-family: 'ChosunGu'; padding: 5px;" placeholder="댓글을 등록하세요">
             
               <input type="button"  id="button_01_detail"  name="" value="등록"  class="button_01_detail" onclick="getReply_insert()">
               <br><br>
         </div>
         <br>
         <c:if test="${replyList != null }">
         <div id="Scroll" style="margin-bottom: 1300px;">
         <c:forEach var="reply" items="${replyList}">
            
               <div id="repliy_re1">
            
                  <!--댓글이 보여지는 부분  -->
                  <div id="reply" class="repliy_re_div" >
                         <div style="float: left;">
                          <input id="re_img" type="image" src="/upload/profileIMG/${reply.user_image}" onclick="location.href='mypage?user_id_email=${user_info.user_id_email}&page_id_email=${reply.re_writer}&user_nickname=${user_info.user_nickname}&user_image=${user_info.user_image }'">
                        </div>
                        <div class="detail_div1">
                           <p class="detail_re_p1">${reply.user_nickname }&nbsp;&nbsp;<fmt:formatDate value="${reply.re_date }" pattern="yyyy/MM/dd HH:mm:ss" />
                           
                        </div>
                        <div class="detail_div1" id="di${reply.re_no}">
                           <div class="detail_re_p2" style="display: inline-block;">${reply.re_contents}</div>
                           <input type="hidden" name="re_contents" value="${reply.re_contents}">
                           
                           <c:if test="${reply.re_writer == user_info.user_id_email}">
                           <div style="display: inline-block;">
                              <!--댓글 수정시 가져갈 것  -->
                              <input type="hidden" name="re_contents" value="${reply.re_contents}">
                              <input type="button" class="button_01_detail" onclick="deleteReply(${reply.re_no})" value="삭제하기">
                              <input type="button" class="button_02_detail" onclick="updateReply(${reply.re_no})" value="수정하기">
                           </div>
                           </c:if>
                        </div><hr style="position: relative; top: -15px; left: -220px; border: 0px; border-top: 1px solid #BFBFBF; width: 70%;">
                     </div><br>
                  </div>
            </c:forEach><br><br><br>
            </div><!-- Scroll End -->
         <div id="repliy_re1"></div>
         
         </c:if>
         <c:if test="${replyList == null }">
            <div class="repliy_re_div">
               <p>작성된 댓글이 없습니다</p>
            </div>
         </c:if>   
      <br><br>   
      </div>
      
      
      
      </form>
   </div>
      
</div>

<div>
   <footer>
      <div id="footer">
         <div style="padding-top: 20px; padding-left: 40px; font-size: 14px; font-weight: bold;">COMPANY. (주)할수있다람쥐</div>
         <div style="padding-top: 15px; padding-left: 40px; font-size: 12px; ">owner. 김경민 tel. 1234-1234</div>
         <div class="footerCon">business no. 201-86-27722 mail order license. 제2020-서울강남-00123호 [사업자정보확인]</div>
         <div class="footerCon">personal info manager. 박용수 (halsooit@daramji.com)</div>
         <div class="footerCon">address. [123123] 서울특별시 강남구 다람동1가 458-294 1층</div>
         <div class="footerCon">copyright © (주)할수있다람쥐 all rights reserved / published by JiyeCha design</div>
      
      </div>
   </footer>

</div>

</body>
</html>