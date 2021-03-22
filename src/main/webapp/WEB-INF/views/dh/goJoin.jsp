<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 회원가입</title>
</head>
<body>
	<c:choose>
		<c:when test="${join == 1 && point == 1 }">
			<script type="text/javascript">
				alert('회원가입 완료');
				location.href = 'myType?user_id_email=${id}';
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('회원가입 실패');
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>