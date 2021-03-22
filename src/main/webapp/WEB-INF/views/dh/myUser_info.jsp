<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<%
   String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 회원정보 수정</title>
<script type="text/javascript" src="dh/js/jquery.js"></script>
<script type="text/javascript" src="dh/js/httpRequest.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
</head>

<style>
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
#user {
   display: none;
   font-family: 'yg-jalnan';
   text-align: center;
   width: 100%;
   height: 70%;
   margin: 0 auto;
    margin-top: 50px;
    border-radius: 25px;
    padding-bottom: 10px;
    padding-top: 10px;
}
#pw{
   font-family: 'yg-jalnan';
   text-align: center;
   width: 100%;
   height: 70%;
   margin: 0 auto;
    margin-top: 150px;
    border-radius: 25px;
    padding-bottom: 10px;
    padding-top: 10px;
}
body{
   width: 100%;
   margin: auto;
}
.update{ 
font-family: 'ChosunGu';
text-align: left;
width: 60%;
float:right;
margin: 0 auto;
}
::placeholder{
font-family: 'ChosunGu';
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}

</style>
<script type="text/javascript">
   // 회원정보 수정 전 암호 확인 ajax
   function pwChk(){
      var user_id_email = "${user_id_email}";
      var pw = $('#user_password1').val();
      $.ajax({
         url : '<%=context%>/pwChk',
         data : {pw : pw, user_id_email : user_id_email},
         dataType : 'text',
         success : function(data){
            if(data == 1){
               $('#user').show();
               $('#pw').hide();
            }else{
               alert('비밀번호 틀림!');
            }
         }
      });
   };
   // 닉네임 중복확인 ajax
   function openNicChk(){
      var user_nickname = $('#user_nickname').val();
      var user_id_email = "${user_id_email}";
   $.ajax({
      url : '<%=context%>/nicCheckInfo',
         data : {
            user_nickname : user_nickname , user_id_email : user_id_email
         },
         dataType : 'text',
         success : function(data) {
            console.log("1 = 중복o / 0 = 중복x : " + data);
            if (data == 1) {
               //중복일 경우
               frm.nick_check.value = "nonick_check"
               console.log(frm.nick_check.value);
               $('#nick_check').text("사용중인 닉네임 입니다.");
               $('#nick_check').css("color", "red");
            } else {
               frm.nick_check.value = "nick_check"
               console.log(frm.nick_check.value);
               $('#nick_check').text("사용가능한 닉네임 입니다.");
               $('#nick_check').css("color", "blue");
            }
         }
      });
   };
   
   // 회원 정보 수정할때 확인해야하는 로직
   function chk() {
      if (frm.user_password.value != frm.user_password2.value) {
         alert("비밀번호 확인이 맞지 않습니다.");
         frm.user_password.focus();
         return false;
      }
      if (frm.nick_check.value != "nick_check" && frm.nick_check.value != "nick_check1") {
         alert("닉네임 중복확인 해주세요.");
         return false;
      }
      return true;
   }
   
   // jQuery(회원가입과 동일)
   $(function(){
      $('#user_password2').on('keyup',function(){
         var str = "";
         var password = document.getElementById('user_password').value;
         var password2 = document.getElementById('user_password2').value;
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

      $('#user_nickname').on('change',function(){
         frm.nick_check.value = "nonc";
         $('#nick_check').empty();
      });
      
      $("#user_birth").datepicker({ maxDate: new Date, 
                              dateFormat: "yy-mm-dd",
                              changeMonth: true, 
                               changeYear: true,
                               showMonthAfterYear: true , 
                               yearRange: 'c-100:c+10',
                               dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
                               monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
});
   });
</script>
<body>
   <div style="height: 70px; margin: 0 0 15px 0;">
  		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
   </div>
   
   <!-- 수정 전 암호 확인 -->
   <input type="hidden" value="${user_id_email }">
   <div id="pw">
      패스워드를 입력하세요.
      <p>
         <input type="password" id="user_password1" name="user_password1" placeholder="암호 입력" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;">
      <p>
         <button id="pwChk" onclick="pwChk();" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white;">암호 입력</button>
         <button onclick="history.back();"  style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">취소</button>
   </div>
   
   <!-- 회원정보 변경 -->
   <div id="user">
   <div style="width: 919px; margin: 0 auto;">
   <h1 style="color: #DB9C67;">회원정보 수정</h1>
      <div class="update">
      <form action="myUser_info_update" id="frm" method="post" onsubmit="return chk()">
         <input type="hidden" name="nick_check" value="nick_check1">
         <input type="hidden" name="user_id_email" value="${user.user_id_email }">
         <input type="hidden" name="user_image" value="${user.user_image }">
           <b>ID :</b> ${user.user_id_email }<p>
    
        
            <b>PW 변경:</b> <input type="password" name="user_password" id="user_password"
               placeholder="비밀번호(8~12자) 입력" required="required" value="${user.user_password }" minlength="8" maxlength="12" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 8px;">
            <p>
           <b>PW 확인 :</b> <input type="password" name="user_password2" id="user_password2"
               placeholder="비밀번호 확인" required="required" value="${user.user_password }" minlength="8" maxlength="12" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 3px;"><p>
            <span id="pw_check" style="margin-left: 75px;"></span>
            <p>
      
        
            <b>이름 :</b> <input type="text" id="user_name" name="user_name"
               value="${user.user_name }" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 29px;"><p>
       
     
            <b>닉네임 :</b> <input type="text" id="user_nickname" name="user_nickname"
               placeholder="닉네임 입력 (8글자 이내)" value="${user.user_nickname }"
               maxlength="8" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 15px;">
               <input type="button" id="chk2" onclick="openNicChk();" value="중복확인" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 70px; height:30px; color: white; margin-left: 13px;"><p>   
            <span id="nick_check" style="margin-left: 75px;"></span><p>
        
       
            <b>연락처 :</b> <input type="tel" name="user_phone"
               placeholder="전화번호 ex)000-0000-0000"
               pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" value="${user.user_phone }" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 14px;"><p>
        
        
            <b>생년월일 :</b> <input type="text" readonly="readonly" name="user_birth" id="user_birth" required="required"  value="${user.user_birth }" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;   "><p>
     
        
            <b>나의 챗봇 답변 : </b><select name="a_cnum1" style="border-radius: 5px; border: 1px solid  #9E8173; width: 125px; height: 30px;">
                     <option value="1" <c:if test="${a_num1 == 1}">selected</c:if>>미래를 위한 투자</option>
                     <option value="2" <c:if test="${a_num1 == 2}">selected</c:if>>마음 돌보기</option>
                     <option value="3" <c:if test="${a_num1 == 3}">selected</c:if>>습관 형성</option>
                     <option value="4" <c:if test="${a_num1 == 4}">selected</c:if>>티끌모아 태산</option>
                  </select>
                  <select name="a_cnum2" style="border-radius: 5px; border: 1px solid  #9E8173; width: 125px; height: 30px;">
                     <option value="1" <c:if test="${a_num2 == 1}">selected</c:if>>아침</option>
                     <option value="2" <c:if test="${a_num2 == 2}">selected</c:if>>낮</option>
                     <option value="3" <c:if test="${a_num2 == 3}">selected</c:if>>저녁</option>
                     <option value="4" <c:if test="${a_num2 == 4}">selected</c:if>>밤</option>
                     <option value="5" <c:if test="${a_num2 == 5}">selected</c:if>>새벽</option>
                     <option value="6" <c:if test="${a_num2 == 6}">selected</c:if>>하루종일</option>
                  </select>
                  <select name="a_cnum3" style="border-radius: 5px; border: 1px solid  #9E8173; width: 125px; height: 30px;">
                     <option value="1" <c:if test="${a_num3 == 1}">selected</c:if>>1주일 이내</option>
                     <option value="2" <c:if test="${a_num3 == 2}">selected</c:if>>1~2주</option>
                     <option value="3" <c:if test="${a_num3 == 3}">selected</c:if>>2~3주</option>
                     <option value="4" <c:if test="${a_num3 == 4}">selected</c:if>>3~4주</option>
                  </select>
         <div style="text-align: center; width: 50%;">
         <input type="submit" value="회원수정" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white;">
         <input type="button" value="취소" onclick="history.back()" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">
         </div>
      </form>
   </div>
   </div>
 </div>  
<!-- 회원정보 변경  끝-->


<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>

</body>
</html>