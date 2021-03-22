<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 관리자</title>
<style type="text/css">
.h2 {
	font-family: 'JalnanOTF';
	text-align: center;
}

.table1 {
	width: 1800px;
	margin: 0 auto;
	border-collapse: collapse;
}

.th {
	background-color: palegoldenrod;
	font-size: 16px;
	font-family: 'JalnanOTF';
	color: #515543;
	text-align: center;
	height: 60px;
}

.td {
	background-color: #FBF5EC;
	font-size: 14px;
	font-family: 'ChosunGu';
	color: #515543;
	font-weight: bold;
	text-align: center;
	line-height: 50px;
}

#stop {
	background-color: peachpuff;
	border: none;
	font-family: 'ChosunGu';
	font-weight: bold;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}

#go {
	background-color: palegoldenrod;
	border: none;
	font-family: 'ChosunGu';
	font-weight: bold;
	height: 20px;
	border-radius: 5px;
	cursor: pointer;
}
.btn {
	border: 2px solid palegoldenrod;
	border-radius: 5px;
	background-color: palegoldenrod;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 102px;
	line-height: 25px;
}
</style>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
	<div style="text-align: center; margin-top: 35px;">
	<input type="button" value="회원관리" class="btn" onclick="location.href='userlist'">
	<input type="button" value="챌린지관리" class="btn" onclick="location.href='chlist'">
	<input type="button" value="게시물관리" class="btn" onclick="location.href='cmlist'">
	</div>
	
	<h2 class="h2">챌린지 목록</h2>

	<div id="ch">
		<table class="table1">
			<tr>
				<th class="th" style="border-radius: 30px 0 0 0;">챌린지 등록번호</th>
				<th class="th">대분류번호</th>
				<th class="th">중분류번호</th>
				<th class="th">소분류번호</th>
				<th class="th">챌주 아이디</th>
				<th class="th">챌주 닉네임</th>
				<th class="th">챌린지 등록일</th>
				<th class="th">챌린지 시작일</th>
				<th class="th">챌린지 종료일</th>
				<th class="th">참여정원 수</th>
				<th class="th">챌린지제목</th>
				<th class="th">챌린지 추천수</th>
				<th class="th">챌린지 상태</th>
				<th class="th">현재 참여인원 수</th>
				<th class="th" style="border-radius: 0 30px 0 0;">관리자권한</th>
			</tr>
			<c:forEach var="ch" items="${listCh }">
				<tr>
					<td class="td">${ch.chg_num }</td>
					<td class="td">${ch.lc_num }</td>
					<td class="td">${ch.mc_num }</td>
					<td class="td">${ch.sc_num }</td>
					<td class="td">${ch.chg_master }</td>
					<td class="td">${ch.master_nickname }</td>
					<td class="td">${ch.chg_regdate }</td>
					<td class="td">${ch.chg_startdate }</td>
					<td class="td">${ch.chg_enddate }</td>
					<td class="td">${ch.chg_capacity }</td>
					<td class="td">${ch.chg_title }</td>

					<td class="td">${ch.chg_like_count }</td>
					<td class="td">${ch.chg_state }</td>


					<td class="td">${ch.chg_now_parti }</td>
					<td class="td"><input type="button" id="stop" value="챌린지중단"
						onclick="location.href='updateCh?chg_num=${ch.chg_num}'">
						<input type="button" id="go" value="포인트회수"
						onclick="location.href=''">
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>
</body>
</html>