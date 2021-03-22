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
	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
	
	<table>
		
		<c:forEach var="challenge" items="${listChallenge}">
			<tr><td><a href="challengeDetail?chg_num=${challenge.chg_num}">${challenge.chg_title}</a></td>
				<td><img src="../upload/mainIMG/${challenge.chg_image}" style="width:100px; height:100px;"></td>
				<td>닉네임 : ${challenge.master_nickname}</td>
				<td>시작일 : ${challenge.chg_startdate}</td>
				<td>종료일 : ${challenge.chg_enddate}</td>
			</tr>
		
		</c:forEach>
		
	
	</table>
	
	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>