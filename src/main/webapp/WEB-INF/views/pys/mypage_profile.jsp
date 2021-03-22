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
      
    <div><!-- Main Menu 부분 (챌린지 만들기 / 커뮤니티 / 랭킹 )start -->
       <div class="divNav">
            <div class="divNavbutton"><a href="#" class="divNavAtag">챌린지등록</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">커뮤니티</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">랭킹</a></div>
            <div class="divNavbutton"><a href="#" class="divNavAtag">미정</a></div>
       </div>
    </div><!-- Main Menu 부분 (챌린지 만들기 / 커뮤니티 / 랭킹 )end -->
     
     <hr style=" border-bottom: 0px; text-align: left; width: 92%; border-top: 1px solid black;" >
     <div style="margin-top: 30px;"></div>
     
     <div class="standard">
	
		<div class="profile">
			<div class="profile_text_3">
			<div class="profile_text_2">
			<div class="profile_text_1">
				<div class="profile_img_3">
				<div class="profile_img_2">
				<div class="profile_img_1" style="background-image: url(upload/profileIMG/${userlist.get(0).getUser_image() })">
				</div>
				</div>
				</div>
				<div class="profile_whiteSpace_1">
				</div>
				${userlist.get(0).getUser_nickname() }
				<br>
				<a class="profile_Onelineintroduction">${userlist.get(0).getUser_intro() }</a>
				<c:choose>
					<c:when test="${user_id_email == page_id_email }">
						<form action="mypage_profile" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="submit" class="edit_OR_follow" value="프로필편집">
						</form>
					</c:when>
					<c:when test="${follow_Did eq '0'}">
						<form action="mypage_follow" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="hidden" name="page_id_email" value="${page_id_email}">
						<input type="hidden" name="follow_Did" value="${follow_Did}">
						<input type="submit" class="edit_OR_follow" value="팔로우하기">
						</form>
					</c:when>
					<c:otherwise>
						<form action="mypage_follow" method="post">
						<input type="hidden" name="user_id_email" value="${user_id_email}">
						<input type="hidden" name="page_id_email" value="${page_id_email}">
						<input type="hidden" name="follow_Did" value="${follow_Did}">
						<input type="submit" class="edit_OR_follow" value="팔로우해지">
						</form>
					</c:otherwise>
				</c:choose>
				<div class="followers_following_num">
				${follower }
				</div>
				<div class="followers_following">
				팔로워
				</div>
				<div class="followers_following_num">
				${following }
				</div>
				<div class="followers_following">
				팔로잉
				</div>
			</div>
			</div>
			</div>	
		</div>
		
		<div class="main">
		아이디 : ${userlist.get(0).getUser_id_email()} <br>
		비밀번호 : <br>
		닉네임 : ${userlist.get(0).getUser_nickname()} <br>
		이름 : ${userlist.get(0).getUser_name()} <br>
		생년월일 : ${userlist.get(0).getUser_birth()} <br>
		전화번호 : ${userlist.get(0).getUser_phone()} <br>
		성별 : ${userlist.get(0).getUser_gender()} <br>
		프로필사진 : ${userlist.get(0).getUser_image()} <br>
		한줄소개 : ${userlist.get(0).getUser_intro()} <br>
		가입일 : ${userlist.get(0).getUser_regdate()} <br>
		</div>
		
	</div>
	
	<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>