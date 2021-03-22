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
	width: 1800px;
	margin: 0 auto;
	border-collapse: collapse;
}

th {
	background-color: palegoldenrod;
	font-size: 16px;
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
	<h2>게시물 목록</h2>
	<div id="comm">
		<table>
			<tr>
				<th style="border-radius: 30px 0 0 0;">게시물 등록번호</th>
				<th>게시물 작성자</th>
				<th>게시물 닉네임</th>
				<th>게시물 작성일</th>
				<th>게시물 추천수</th>
				<th>게시물 조회수</th>
				<th>게시물 제목</th>
				<th>게시물 분류</th>
				<th>게시물 상태</th>
				<th style="border-radius: 0 30px 0 0;">수정</th>
			</tr>
			<c:forEach var="cm" items="${listCm }">
				<tr>
					<td>${cm.b_num }</td>
					<td>${cm.b_id_email }</td>
					<td>${cm.b_nickname }</td>
					<td>${cm.b_regdate }</td>
					<td>${cm.b_like_count }</td>
					<td>${cm.b_view_count }</td>
					<td>${cm.b_title }</td>
					<td>${cm.b_c_num }</td>

					<td>${cm.b_state }</td>
					<td><input type="button" id="stop" value="삭제"
						onclick="location.href='updateForm?b_num=${cm.b_num}'">
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