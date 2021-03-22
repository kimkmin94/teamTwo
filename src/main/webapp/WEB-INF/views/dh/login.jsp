<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 로그인</title>
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

/* 로그인창 css */
.loginClass{
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
.login{
   font-family: 'ChosunGu';
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
a{text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:hover {text-decoration: none; color: #9E8173;}
body{
	width: 100%;
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
::placeholder{
font-family: 'ChosunGu';
}
</style>
<body>
<!-- 상단바 -->
<div class="menuBarDa">
		<div style="text-align: center;">
			<div id="menuLeftDa" style="width: 700px;">
			할수있다람쥐<img src="../jy/img/dotori.png" id="imgDoDa">
			</div>
		</div>
</div>
<!-- 로그인창 -->
<div class="loginClass">
	<h1 style="color: #DB9C67; margin-left: 40px;">로그인</h1>
	<div class="login">
	<form action="goLogin">
		ID : <input type="email" name="user_id_email" placeholder="이메일 아이디 입력" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" style="border-radius: 5px; border: 1px solid  #9E8173; width: 250px; height: 30px; margin-left: 6px;"><p>
		PW : <input type="password" name="user_password" placeholder="비밀번호" style="border-radius: 5px; border: 1px solid  #9E8173; width: 250px; height: 30px;"><p>
		<input type="submit" value="LOGIN" style="background: #9E8173; border: #9E8173; border-radius: 5px;width: 255px; height: 45px; color: white; margin-left: 38px;">
	</form>	
	</div>
	<div class="login" style="margin-left: 40px;">
	<b><a href="join">회원 가입</a></b> | <a href="idFound">아이디 찾기</a> | <a href="pwFound">패스워드 찾기</a>
	</div>
</div>	
<!-- 로그인창 끝 -->

<!-- 하단바 -->
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>

</body>
</html>