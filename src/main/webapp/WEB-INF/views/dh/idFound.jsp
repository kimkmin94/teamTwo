<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<script type="text/javascript" src="dh/js/jquery.js"></script>
<script type="text/javascript" src="dh/js/httpRequest.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 아이디 찾기</title>
<script type="text/javascript">
	/* 아이디 찾기 결과가 나오는 ajax */
	function findId() {
		var user_name = $('#user_name').val();
		var user_phone = $('#user_phone').val();
		$.ajax({
			url : '<%=context%>/findId',
			data : {user_name : user_name, user_phone : user_phone},
			dataType : 'text',
			success : function(data) {
				if(data == ''){
				$('#findId').append("입력하신 정보에는 해당하는 아이디가 없습니다.<p>다시한번 확인해주세요<p>");	
				/* 찾은 아이디 값이 나오지 않아서 다시 정보를 입력할때 결과값을 지우는 역할을 해줌. */
				$(function(){
					$('#user_name').on('change',function(){
				         $('#findId').empty();
				      });
				      
				      $('#user_phone').on('change',function(){
				        $('#findId').empty();
				      });
				});
				}else{
				$('#findId').append("회원님의 아이디는 <b><span id='id'>"+data+"</span></b> 입니다.<p>");
				$('#chk1').hide();
				$('#chk2').show();
				}
			}
		});
	};
</script>
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
 #id{
 	color: blue;
 }
 #chk2{display: none;}
 body {
	margin: auto;
}
/* 스크롤바 */
body::-webkit-scrollbar{width: 16px;}
body::-webkit-scrollbar-track {background-color:#f1f1f1;}
body::-webkit-scrollbar-thumb {background-color:#D8E4A9; border-radius: 10px;}
body::-webkit-scrollbar-thumb:hover {background:#555;}
body::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#D8E4A9;}
.idFound{
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

	<!-- 아이디 찾기 div -->
	<div class="idFound">		
		<h1 style="color: #DB9C67; margin: 40px;">아이디 찾기</h1>				
		<div  class="found">
	이름: &nbsp;<input type="text" id="user_name" name="user_name" placeholder="이름" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px; margin-left: 10px;"><p>
	연락처: <input type="tel" id="user_phone" name="user_phone"
				placeholder="전화번호 ex)000-0000-0000"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" style="border-radius: 5px; border: 1px solid  #9E8173; width: 200px; height: 30px;"><p>
	<span id="findId"></span>
			<div style="width: 100%;">
				<div style="width: 225px; margin: 0 auto;">
					<button id="chk1" onclick="findId();" style="background: #9E8173; border: #9E8173; border-radius: 5px; width: 110px; height:30px; color: white;">아이디 찾기</button>
					<button id="chk2" onclick="location.href='pwFound'" style="background: #9E8173; border: #9E8173; border-radius: 5px;width: 110px; height:30px; color: white;">비밀번호 찾기</button>
					<button onclick="location.href='login'" style="background: white; border: 1px solid  #9E8173; border-radius: 5px; width: 110px; height:30px; color: black;">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 아이디 찾기 div 끝 -->
	
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>

</body>
</html>