<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 비밀번호 찾기</title>
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
	#c2{display: none;}
.pwFound{
	font-family: 'yg-jalnan';
	height: 70%;
	width: 100%;
	text-align: center;
    margin-top: 200px;
    border-radius: 25px;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-bottom: 25%;
}
.found{
   font-family: 'ChosunGu';
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}

body {
	margin: auto;
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
</style>
<script type="text/javascript">
	/* 비밀번호 찾기 결과 ajax */
	function findPw() {
		var user_id_email = $('#user_id_email').val();
		var user_name = $('#user_name').val();
		var user_phone = $('#user_phone').val();
		$.ajax({
			url : '<%=context%>/findPw',
			data : {user_id_email : user_id_email, user_name : user_name, user_phone : user_phone},
			dataType : 'text',
			success : function(data) {
				if(data == 1){
				alert('비밀번호찾기 성공!');
				$('#findPw').append("회원님의 변경된 비밀번호가 메일로 발송되었습니다.<p>확인하시고 로그인 하실때 마이페이지로 이동하여<p>비밀번호를 변경해주세요<p>");
				$('#c1').hide();
				$('#chk1').hide();
				$('#c2').show();
				} else{
					alert('비밀번호찾기 실패!');
				}
			}
		});
	};
</script>
<body>
<!-- 상단바 -->
<div class="menuBarDa">
		<div style="text-align: center;">
			<div id="menuLeftDa" style="width: 700px;">
			할수있다람쥐<img src="../jy/img/dotori.png" id="imgDoDa">
			</div>
		</div>
</div>
	<!-- 비밀번호 찾기 구역 -->
	<div class="pwFound">	
		<h1 style="color: #DB9C67; margin-left: 40px;">비밀번호 찾기</h1>
		<div>
			<div  class="found">
				ID : <input type="email" id="user_id_email" name="user_id_email"
							placeholder="아이디 입력"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
							required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 28px;"><p>
				이름 : <input type="text" id="user_name" name="user_name" placeholder="이름" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 15px;"><p>
				연락처 : <input type="tel" id="user_phone" name="user_phone"
							placeholder="전화번호 ex)000-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;"><p>
				<span id="findPw"></span>
		<div style="width: 100%;">
			<div style="width: 225px; margin: 0 auto;">
			<button id="chk1" onclick="findPw();" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white;">비밀번호 찾기</button>
			<button id="c1" onclick="location.href='login'"style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">취소</button>
			<button id="c2" onclick="location.href='login'" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 220px; height:30px; color: white;">로그인 화면으로</button>
			</div>
		</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾기 구역 끝-->
	
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</body>
</html>