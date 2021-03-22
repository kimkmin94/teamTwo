<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%
   String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>할수있다람쥐 : 회원가입</title>
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
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
body{
width: 100%;
margin: auto;
}
.join{
   width: 100%;
   font-family: 'yg-jalnan';
   text-align: center;
    border-radius: 25px;
    padding-bottom: 10px;
    padding-top: 10px;
}
.gojoin{   
   width: 80%;
   font-family: 'ChosunGu';
}
.menuBarDa {
   background-color: #9E8173;
   width: 100%;
   height: 70px;
   line-height: 70px;
   border-radius: 0px 0px 50px 50px;
   text-align: center;
   z-index: 99999;
}

@media screen and (max-width: 1600px) {
   .menuBarDa {
      background-color: #9E8173;
      width: 1600px;
      height: 70px;
      line-height: 70px;
      border-radius: 0px 0px 50px 50px;
      text-align: center;
      z-index: 99999;
   }
}
#menuLeftDa{
   font-family: 'yg-jalnan';
   display: inline-block; 
   text-align: left;
   line-height: 70px;
   float: left;
   font-family: 'yg-jalnan';
   font-size: 28px;
   color:#40312E;
   text-decoration: none;
   margin-left: 50px;
   line-height: 70px;
}
#imgDoDa{
   width: 28px;
    height: 30px;
    vertical-align: middle;
    margin-bottom: 4px;
}
.step{
font-family: 'yg-jalnan';
display: inline-block;
width: 90px;
height: 40px;
margin-top: 30px;
margin-left: 30px;
padding-top: 10px;
}
#step12{
width : 98%;
font-family: 'yg-jalnan';
display: inline-block;
text-align: center;
}
.arrow{
   display: inline-block;
   margin-bottom: -5px;
   margin-left: 30px;
    width: 15px;
     height: 15px;
    border-top: 5px solid #C55A11;
    border-left: 5px solid #C55A11;
    transform: rotate(135deg);
}
::placeholder{
font-family: 'ChosunGu';
}
</style>
<script type="text/javascript">
      /* 회원가입을 눌렀을때 실행하는 로직 */
      function chk() {
         /* 비밀번호와 비밀번호 확인이 맞지 않을때  */
         if(frm.user_password.value != frm.user_password_chk.value){
            alert("비밀번호 확인이 맞지 않습니다.");
            frm.user_password.focus();
            return false;
         }
         /* 아이디 중복확인이 안되어있을때 */
         if(frm.id_check.value != "id_check"){
            alert("아이디 중복확인 해주세요.");
            return false;
         }
         /* 닉네임 중복확인이 안되어있을때 */
         if(frm.nick_check.value != "nick_check"){
            alert("닉네임 중복확인 해주세요.");
            return false;
         }         
         return true;
      }
      
      /* 아이디 중복확인 ajax */
      function openIdChk(){
         var user_id_email = $('#user_id_email').val();
      $.ajax({
         url : '<%=context%>/idCheck',
         data : {user_id_email : user_id_email},
         dataType : 'text',
         success : function(data){
            console.log("1 = 중복o / 0 = 중복x : "+ data);
            if(data == 1){
               //중복일 경우
               frm.id_check.value = "noid_check";
               $('#id_check').text("사용중인 아이디 입니다.");
               $('#id_check').css("color","red");
            }else{
               frm.id_check.value = "id_check"
               $('#id_check').text("사용가능한 아이디 입니다.");
               $('#id_check').css("color","blue");
            }
         }
      });
   };
   
      /* 닉네임 중복확인 ajax */
      function openNicChk(){
         var user_nickname = $('#user_nickname').val();
      $.ajax({
         url : '<%=context%>/nicCheck',
         data : {
            user_nickname : user_nickname
         },
         dataType : 'text',
         success : function(data) {
            console.log("1 = 중복o / 0 = 중복x : " + data);
            if (data == 1) {
               //중복일 경우
               $('#nick_check').text("사용중인 닉네임 입니다.");
               $('#nick_check').css("color", "red");
            } else {
               frm.nick_check.value = "nick_check"
               $('#nick_check').text("사용가능한 닉네임 입니다.");
               $('#nick_check').css("color", "blue");
            }
         }
      });
   };
   

   $(function(){
      /* 비밀번호와 비밀번호 불일치 할때의 jQuery */
      $('#user_password_chk').on('keyup',function(){
         var str = "";
         var password = document.getElementById('user_password').value;
         var password2 = document.getElementById('user_password_chk').value;
         if(password != password2){
            str += "비밀번호 불일치 합니다.";
            $('#pw_check').text(str);
            $('#pw_check').css("color", "red");
         }else{
            str += "비밀번호 일치 합니다.";
            $('#pw_check').text(str);
            $('#pw_check').css("color", "blue");
         }
      });
      
      /* 아이디 중복확인을 눌렀지만 다시 아이디를 바꿀때 jQuery */
      $('#user_id_email').on('change',function(){
         frm.id_check.value = "noid_check";
         $('#id_check').empty();
      });
      /* 닉네임 중복확인을 눌렀지만 다시 닉네임를 바꿀때 jQuery */
      $('#user_nickname').on('change',function(){
         frm.nick_check.value = "nonick_check";
         $('#nick_check').empty();
      });
      
       $("#user_birth").datepicker({ maxDate: new Date, 
            dateFormat: "yy-mm-dd",
            changeMonth: true, 
             changeYear: true,
             showMonthAfterYear: true, 
             yearRange: 'c-100:c+10',
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
   });
</script>
<link rel="stylesheet" type="text/css" href="resources/dh/css/join.css">
</head>
<body>
   <!-- 상단바 -->
<div class="menuBarDa">
      <div style="text-align: center;">
         <div id="menuLeftDa" style="width: 700px;">
         할수있다람쥐<img src="../jy/img/dotori.png" id="imgDoDa">
         </div>
      </div>
</div>
<div style="width:100%; height:70%; margin-top: 100px;">

<div style="width: 919px; margin: 0 auto;">
<!-- STEP 1,2 -->
<div id="step12">
<div class="step" style="background-color: #DB9C67; border-radius: 5px; color: white;">STEP 1</div> <div class="arrow"></div> <div class="step" style="background-color: #BFBFBF; border-radius: 5px; color: white;">STEP 2</div>
</div>

<!-- 회원가입 창 -->
<div class="join">
   <h1  style="color: #DB9C67; text-align: center;   margin-right: 10px;">회원 가입</h1>
   <div class="gojoin">
      <div style="float: right; width: 60%; text-align: left;">
   <form action="goJoin" id="frm" method="post" onsubmit="return chk()">
   <!-- 중복확인 히든 -->
   <input type="hidden" name="id_check" value="noid_check">
   <input type="hidden" name="nick_check" value="nonick_check">   
         <b>ID :</b> <input type="email" id="user_id_email" name="user_id_email"
            placeholder="아이디 입력"
            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
            required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 49px;">
         <input type="button" id="chk1" onclick="openIdChk();" value="중복체크" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 70px; height:30px; color: white; margin-left: 13px;"><p>
         <span id="id_check" style="margin-left: 80px;"></span><p>   
      
         <b>PW :</b> <input type="password" id="user_password" name="user_password"
            placeholder="비밀번호(8~12자) 입력" required="required" maxlength="12" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 41px;">
         <p>
         <b>PW 확인 :</b> <input type="password" name="user_password_chk"
               placeholder="비밀번호 확인" id="user_password_chk" required="required" maxlength="12" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 8px;">
         <p>
         <span id="pw_check" style="margin-left: 80px;"></span><p>
            
         <b>이름 :</b> <input type="text" id="user_name" name="user_name"
            placeholder="이름 입력" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 35px;"><p>   
               
         <b>닉네임 :</b> <input type="text" id="user_nickname" name="user_nickname"
            placeholder="닉네임 입력 (8글자 이내)" required="required" maxlength="8" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 20px;">
         <input type="button" id="chk2" onclick="openNicChk();" value="중복체크" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 70px; height:30px; color: white; margin-left: 13px;"><p>
         <span id="nick_check" style="margin-left: 80px;"></span><p>
      
         <b>연락처 :</b> <input type="tel" name="user_phone"
            placeholder="전화번호 ex)000-0000-0000"
            pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 20px;"><p>
      
         <b>생년월일 :</b> <input readonly="readonly" type="text" name="user_birth" id="user_birth" placeholder="생년월일 입력" required="required" value="${user.user_birth }" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;   margin-left: 7px;"><p>
      
         <b>성별 :</b> <input type="radio" name="user_gender" value="Male"checked="checked" style="margin-left: 40px;">남  <input type="radio" name="user_gender" value="Female" style="margin-left: 40px;">여<p>
      <input type="submit" value="회원가입" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white; margin-left: 70px;">
      <input type="button" value="취소" onclick="history.back()" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">
   </form>
      </div>
   </div>
</div>
</div>      
</div>
<!-- 회원가입 창  끝-->

<!-- 하단바 -->
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>

</body>
</html>