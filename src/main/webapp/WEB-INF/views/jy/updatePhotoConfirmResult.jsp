<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
</head>
<body>
<c:if test="${confirmEnd == 1 && confirm_state == 1}">
	<script type="text/javascript">
	alert("챌린지 인증사진을 수락했습니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>
<c:if test="${confirmEnd == 1 && confirm_state == 2}">
	<script type="text/javascript">
	alert("챌린지 인증사진을 거절했습니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>
<c:if test="${confirmEnd != 1 }">
	<script type="text/javascript">
	alert("업데이트에 실패했습니다. 다시 시도해주세요.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>
</body>
</html>