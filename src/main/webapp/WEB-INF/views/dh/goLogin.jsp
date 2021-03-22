<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 로그인</title>
</head>
<body>
<c:if test="${login == 1}">
	<c:choose>
		<c:when test="${user_state == 2}">
			<script type="text/javascript">
			alert('관리자 계정입니다');
			location.href="admin";
			</script>
		</c:when>
		<c:when test="${user_state == 1}">
			<script type="text/javascript">
			alert('로그인 성공');
			location.href="mypage?user_id_email=${user_id_email}&page_id_email=${user_id_email}&user_nickname=${user_model.getUser_nickname()}&user_image=${user_model.getUser_image()}";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			alert('아이디 또는 비밀번호가 틀렸습니다.');
			history.back();
			</script>
		</c:otherwise>	
	</c:choose>
</c:if>
<c:if test="${login == 0 }">
<script type="text/javascript">
	alert('아이디 또는 비밀번호가 틀렸습니다.');
	history.back();
</script>	
</c:if>
</body>
</html>