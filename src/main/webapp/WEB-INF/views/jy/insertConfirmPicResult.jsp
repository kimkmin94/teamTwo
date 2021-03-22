<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
</head>
<body>
<c:if test="${photoResult == 1}">
	<script type="text/javascript">
	alert("챌린지 인증사진이 업로드되었습니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	

	</script>	
</c:if>
<c:if test="${photoResult == 0}">
	<script type="text/javascript">
	alert("챌린지 인증사진 업로드에 실패하였습니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>
<c:if test="${photoResult == 2}">
	<script type="text/javascript">
	alert("챌린지 인증사진파일을 첨부해주세요!");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>
</body>
</html>