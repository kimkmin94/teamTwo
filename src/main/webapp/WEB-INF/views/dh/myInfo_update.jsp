<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 프로필수정</title>
</head>
<body>
<c:if test="${update == 1 }">
	<script type="text/javascript">
		alert('성공');
		location.href = "mypage?user_id_email=${user_id_email}&page_id_email=${user_id_email}&user_nickname=${user_nickname}&user_image=${user_image}";
	</script>
</c:if>
<c:if test="${update < 1 }">
	<script type="text/javascript">
		alert('실패');
		history.back();
	</script>
</c:if>
</body>
</html>