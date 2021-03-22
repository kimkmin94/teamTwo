<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<style type="text/css">
.endPageBody {
	width: 100% display: inline-block;
	margin: auto;
	vertical-align: top;
	text-align: center;
}

.makeChalTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 30px;
	font-family: 'JalnanOTF';
}

.contentFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 20px;
	font-family: 'JalnanOTF';
}
</style>
</head>
<body>
	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
	<div class="endPageBody">
		<b class="makeChalTitleFont">${message }</b><br /> <br> <img
			src="ban/img/daram1.png" width="400px"> <br /> <br> <br>
		<br> <span class="contentFont">내가 만든 챌린지 <a
			href="/challengeDetail?chg_num=${userchallenge.chg_num }">보러가기</a>
		</span> 
		<br/>
<!-- 이미지 노출을 원할 경우  -->
<!-- 		<img src="../upload/mainIMG/${userchallenge.chg_image}"
			style="width: 200px; height: 200px;"> -->

	</div>


	<div style="position: absolute; bottom: 0px; width: 99%;">
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>
</body>
</html>