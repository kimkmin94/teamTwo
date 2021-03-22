<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
</head>
<body>
<c:if test="${resultPoint == 1 && resultPart == 1}">
	<script type="text/javascript">
	alert("챌린지 신청이 완료되었습니다. 챌린지 리스트로 돌아갑니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";

	</script>	
</c:if>
<c:if test="${resultPoint != 1 || resultPart != 1}">
	<script type="text/javascript">
	alert("챌린지 신청에 실패하였습니다. 챌린지 리스트로 돌아갑니다.");
	location.href="challengeDetail?chg_num=${chg_num}&&user_id_email=${user_id_email}&&user_nickname=${user_nickname}&&user_image=${user_image}";
	</script>	
</c:if>

</body>
</html>