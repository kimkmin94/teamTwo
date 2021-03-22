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
	<c:if test="${result_insert_write == 1 }">
		<script type="text/javascript">
			alert("등록되었습니다");
			location.href="community";
		</script>
	</c:if>
	<c:if test="${result_insert_write != 1 }">
		<script type="text/javascript">
			alert("등록을 실패하였습니다");
			history.back();
		</script>
	</c:if>

</body>
</html>