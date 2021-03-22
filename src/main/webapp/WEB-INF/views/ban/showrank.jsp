<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 랭킹</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">
	
<%
String context = request.getContextPath();
%>
	
</script>


<style type="text/css">
@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	text-align: center;
}

a:link {
	color: #6d3416;
}

a:visited {
	color: #6d3416;
}

a:hover {
	color: #4d9549;
}

a:active {
	color: #6d3416;
}

.makeChalTitleFont {
	margin-top: 40px;
	display: inline-block;
	vertical-align: baseline;
	font-size: 30px;
	font-family: 'JalnanOTF';
	display: inline-block;
}

.container {
	width: 900px;
	margin: 0 auto;
}

.top {
	margin-top: 70px 0px 100px 0px auto;
	width: 880px;
	height: 400px;
	text-align: center;
	padding: 20px;
	background-color: #fffcf2;
}

.bottom {
	width: 880px;
	height: 200px;
	margin: 40px auto;
}

.bottom2 {
	width: 880px;
	height: 200px;
	/* 	background-color: pink; */
	text-align: center;
}

.bleft {
	width: 430px;
	height: 180px;
	float: left;
	margin-left: 10px;
	font-size: 20px;
	font-family: 'JalnanOTF';
}

.bright {
	width: 430px;
	height: 180px;
	float: left;
	font-size: 20px;
	font-family: 'JalnanOTF';
}

.makeChalTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 50px;
	font-family: 'JalnanOTF';
}

.top3table {
	text-align: center;
	margin: 0 auto;
}

.btmtable {
	margin-left: 20px;
	text-align: left;
	font-family: 'ChosunGu';
	color: #9f6e54;
	font-size: 18px;
	text-align: left;
}

.blackbold {
	font-family: 'ChosunGu';
	color: black;
	font-size: 21px;
}

.contentFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 18px;
	color: #9f6e54;
	font-family: 'ChosunGu';
}

.content2Font {
	display: inline-block;
	vertical-align: baseline;
	font-size: 14px;
	color: gray;
	font-family: 'ChosunGu';
}

.content3Font {
	display: inline-block;
	vertical-align: baseline;
	font-size: 10px;
	color: gray;
	font-family: 'ChosunGu';
	width: 250px;
	height: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.subTitleFont {
	display: inline-block;
	vertical-align: baseline;
	font-size: 20px;
	font-family: 'JalnanOTF';
}

.subTitle2Font {
	display: inline-block;
	vertical-align: baseline;
	font-size: 18px;
	font-family: 'JalnanOTF';
	color: #723c20;
}

.circle {
	border-radius: 50%;
}
</style>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>


	<div class="container">
		<span class="makeChalTitleFont">할수있다람쥐 명예의 전당</span><br /> <span
			class="content2Font">열매가 동일하다면 가입일순으로 표시됩니다람!</span><br /> <br /> <br />
		<div class="top">

			<!-- 1~3위 테이블 영역  -->
			<table class="top3table">
				<tr>
					<td><img src="ban/img/medal.png" width="50px;" height="50px;"></td>
					<td><img src="ban/img/medal2.png" width="50px;" height="50px;"></td>
					<td><img src="ban/img/medal3.png" width="50px;" height="50px;"></td>
				</tr>
				<tr height="230px">
					<c:forEach var="pulist" items="${pulist }" begin="0" end="2">
						<td width="270px"><a
							href="mypage?user_id_email=${userinfo.user_id_email }&page_id_email=${pulist.user_id_email}">
								<img class="circle"
								src="../upload/profileIMG/<c:out value="${pulist.user_image }"></c:out>"
								width="180px" height="180px">

						</a></td>
					</c:forEach>
				</tr>

				<tr>
					<c:forEach var="pulist" items="${pulist }" begin="0" end="2">
						<td><a
							href="mypage?user_id_email=${userinfo.user_id_email }&page_id_email=${pulist.user_id_email}">
								<span class="subTitleFont"><c:out
										value="${pulist.user_nickname }"></c:out> 님</span>
						</a></td>
					</c:forEach>
				</tr>

				<tr>
					<c:forEach var="pulist" items="${pulist }" begin="0" end="2">
						<td><span class="contentFont"><c:out
									value="${pulist.point_balance }"></c:out> 열매</span><img
							src="ban/img/dotori.png" width="15px;" height="15px;"></td>
					</c:forEach>
				</tr>

				<tr>
					<c:forEach var="pulist" items="${pulist }" begin="0" end="2">
						<td width="270px"><span class="content3Font"><br /> <c:out
									value="${pulist.user_intro}"></c:out></span></td>
					</c:forEach>
				</tr>

			</table>
		</div>

		<!-- 4위이후 영역  -->
		<div class="bottom">


			<!-- 좌측 하단 영역  -->
			<div class="bleft">


				<table class="btmtable">
					<c:forEach var="pulist" items="${pulist }" begin="3" end="6"
						varStatus="status">
						<tr>
							<td width="50px">${status.count +3}위</td>
							<td width="200p"><a
								href="mypage?user_id_email=${userinfo.user_id_email }&page_id_email=${pulist.user_id_email}"><span
									class="subTitle2Font"> <c:out
											value="${pulist.user_nickname }"></c:out></span></a> 님</td>
							<td width="90px"><c:out value="${pulist.point_balance }"></c:out>
								열매</td>
						</tr>

					</c:forEach>
				</table>





			</div>
			<!-- 우측 하단 영역  -->
			<div class="bright">
				<table class="btmtable">
					<c:forEach var="pulist" items="${pulist }" begin="7" end="9"
						varStatus="status">
						<tr>
							<td width="50px">${status.count +7}위</td>
							<td width="200p"><a
								href="mypage?user_id_email=${userinfo.user_id_email }&page_id_email=${pulist.user_id_email}"><span
									class="subTitle2Font"><c:out
											value="${pulist.user_nickname }"></c:out></span></a> 님</td>
							<td width="90px"><c:out value="${pulist.point_balance }"></c:out>
								열매</td>
						</tr>

					</c:forEach>
				</table>



			</div>
		</div>
		<!-- 		<div class="bottom2">
		더 추가할 게 있다면 여기에!
		
		</div> -->

	</div>




	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>

</body>
</html>