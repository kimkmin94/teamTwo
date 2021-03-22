<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 관리자</title>
<style type="text/css">
h2 {
	font-family: 'JalnanOTF';
	text-align: center;
}

table {
	width: 1600px;
	margin: 0 auto;
	border-collapse: collapse;
}

th {
	background-color: palegoldenrod;
	font-size: 18px;
	font-family: 'JalnanOTF';
	color: #515543;
	text-align: center;
	height: 60px;
}

td {
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
		<input type="button" value="회원관리" class="btn"
			onclick="location.href='userlist'"> <input type="button"
			value="챌린지관리" class="btn" onclick="location.href='chlist'"> <input
			type="button" value="게시물관리" class="btn"
			onclick="location.href='cmlist'">
	</div>

	<h2>회원 목록</h2>
	<div id="user">
		<table>
			<tr>
				<th style="border-radius: 30px 0 0 0;">이메일</th>
				<th>닉네임</th>
				<th>비밀번호</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>성별</th>
				<th>프사</th>
				<th>한줄소개</th>
				<th>가입일</th>
				<th>회원상태</th>
				<th>회원실명</th>
				<th style="border-radius: 0 30px 0 0;">계정상태</th>
			</tr>
			<c:forEach var="user_info" items="${listUser }">
				<tr>
					<td>${user_info.user_id_email }</td>
					<td>${user_info.user_nickname }</td>
					<td>${user_info.user_password }</td>
					<td>${user_info.user_birth }</td>
					<td>${user_info.user_phone }</td>
					<td>${user_info.user_gender }</td>
					<td>${user_info.user_image }</td>
					<td>${user_info.user_intro }</td>
					<td>${user_info.user_regdate }</td>
					<td>${user_info.user_state }</td>
					<td>${user_info.user_name }</td>
					<td><input type="button" id="stop" value="계정중지"
						onclick="location.href='userUpdate?user_id_email=${user_info.user_id_email}'">
						<input type="button" id="go" value="계정활성화"
						onclick="location.href='userUpdate2?user_id_email=${user_info.user_id_email}'"></td>
				</tr>
				<c:set var="num" value="${num + 1 }"></c:set>
			</c:forEach>
		</table>
	</div>

	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>
</body>
</html>