<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
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
.myInfo{
   width: 100%;
   height: 70%;
   font-family: 'yg-jalnan';
   text-align: center;
    margin-top: 100px;
    padding-bottom: 10px;
    padding-top: 10px;
}
.introImage{
    font-family: 'ChosunGu';
}
body{
   width: 100%;
   margin: auto;
}
input[type="file"]{
      display:none;
   }
.input-file-button {
   border: 1px solid  #9E8173;
   border-radius:5px;
   background-color:  #9E8173;
   display: inline-block;   
   padding: 6px; 12px;
   cursor: pointer;
   color: white;
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
</style>
</head>
<script type="text/javascript">
	// 첨부파일 용량 확인
	function () {
		var size = document.getElementById('image').files[0].size;
			
		// 용량 확인하기
		if(size > 1024 * 1024 * 5){
			// 용량 초과시 경고후 해당 파일의 용량도 보여줌
			alert('5MB 이하 파일만 등록 가능\n\n' + '현재 사진 용량 : ' + (Math.round(size / 1024 / 1024 * 100) / 100) + 'MB');
			// 올리려 시도했던 파일정보를 날려버림 
			$("input[id=file]").val("");
		}

		// 체크를 통과했다면 종료
		else return;
	}
	
	
</script>
<body>
   <div style="height: 70px; margin: 0 0 15px 0;">
	   <%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
   </div>
   
   
<div class="myInfo">
   <h1><b style="color: #DB9C67;">${user.user_nickname }</b>님의 프로필 편집</h1>
<div class="introImage">
<!-- 사진,한줄소개 수정 -->
   <form action="myInfo_update" method="post" enctype="multipart/form-data">      
      <input type="hidden" name="user_id_email" value="${user.user_id_email }">
      <input type="hidden" name="user_image" value="${user.user_image }">
      <input type="hidden" name="user_nickname" value="${user.user_nickname }">
      <b style="color: #C55A11;">프로필 이미지</b><p>
      <!-- 현재 프로필 이미지 -->
      <div id="image_preview">
      <img src="upload/profileIMG/${user.user_image }" style="background-size: 100%; width:170px; height:170px; border-radius: 50%; position: relative; background-color: white; top: 5px; left: 5px; overflow: hidden;"><p>
      </div>
      <!-- 프로필 바꾸기 구역 -->
      <label class="input-file-button" for="image">수정 이미지</label>
      <input type="file" id="image" name="user_image" onchange="sizeCheck()"><p>
     
      <!-- 바꾼 이미지 미리보기 -->
      <script>
       // 이미지 업로드
        $('#image').on('change', function() {
         ext = $(this).val().split('.').pop().toLowerCase(); //확장자
         //배열에 추출한 확장자가 존재하는지 체크
         if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
         resetFormElement($(this)); //폼 초기화
         window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
         } else {
                 file = $('#image').prop("files")[0];
                 blobURL = window.URL.createObjectURL(file);
                 $('#image_preview img').attr('src', blobURL);
                 $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
                 $(this).slideUp(); //파일 양식 감춤
                 }
          });
 	</script>
 	
	  <!-- 한줄 소개 구역 -->
      <b style="color: #C55A11;">한줄 소개</b><p>
      <textarea name="user_intro" rows="5" cols="40" maxlength="36">${user.user_intro }</textarea><p>
      <input type="submit" value="프로필 수정" style="background: #9E8173; border: #9E8173; border-radius: 5px;width: 110px; height:30px; color: white;">
      <input type="button" value="취소" onclick="history.back()" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">
   </form>
</div>
</div>

<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>

</body>
</html>