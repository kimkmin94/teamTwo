<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 챌린지 등록</title>
<link href="ban/css/confirmchallenge_css.css?ver=2" rel="stylesheet">

</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>


		<div class = "up_notidiv">
			<span style="font-size: 30px; color: gray; font-family: JalnanOTF;">챌린지
				운영 체크리스트!</span>
			<form>

				<b class="notice_font"> <input type="checkbox" required>챌린지를
					등록하신 ${userinfo.user_nickname }님은 이제부터 '챌주'가 되신답니다.<br /> <input
					type="checkbox" required>챌주는 매일 참여자들의 미션을 확인 후 컨펌해주셔야 해요!<br />
					<input type="checkbox" required>참여자들 간 다양한 소통이 이루어질 수 있도록
					응원해주세요.<br /> <input type="checkbox" required>인증예시에 맞추어 잘
					인증되었는지도 꼭 체크해주세요!<br /> <input type="checkbox" required>그럼,
					앞으로 힘내보아요!<br />

				</b>
			</form>
		</div>


		<div class="bottom_tablediv">

			<br /> <span
				style="font-size: 30px; color: gray; font-family: JalnanOTF;">아래와
				같이 챌린지를 개설합니다.</span>


			<div class="confirmForm">
				<form name="registerChalForm"
					action="registerChal?user_id_email=${userinfo.user_id_email }"
					method="post">

					<!-- 챌린지 정보 hidden으로 보내기  -->
					<input type="hidden" name="chg_num" value="99999"> <input
						type="hidden" name="lc_num" value="${userchallenge.lc_num}">
					<input type="hidden" name="mc_num" value="${userchallenge.mc_num}">
					<input type="hidden" name="sc_num" value="${userchallenge.sc_num}">
					<input type="hidden" name="chg_master"
						value="${userinfo.user_id_email}"> <input type="hidden"
						name="master_nickname" value="${userinfo.user_nickname}">
					<input type="hidden" name="chg_regdate" value="2021-01-01">
					<input type="hidden" name="chg_startdate"
						value=${userchallenge.chg_startdate }> <input
						type="hidden" name="chg_enddate"
						value=${userchallenge.chg_enddate }> <input type="hidden"
						name="chg_capacity" value="${userchallenge.chg_capacity}">
					<input type="hidden" name="chg_title"
						value="${userchallenge.chg_title}"> <input type="hidden"
						name="chg_contents" value="${userchallenge.chg_contents}">
					<input type="hidden" name="chg_image" value="${file1savedName}">
					<input type="hidden" name="chg_like_count" value="0"> <input
						type="hidden" name="chg_state" value="1"> <input
						type="hidden" name="chg_sample_image" value="${file2savedName}">
					<input type="hidden" name="chg_sample_text"
						value="${userchallenge.chg_sample_text}"> <input
						type="hidden" name="chg_now_parti" value="1"> <input
						type="hidden" name="chg_confirm_time" value="보류"> <input
						type="hidden" name="q_cnum_1" value="${q_cnum_1 }"> <input
						type="hidden" name="q_cnum_2" value="${q_cnum_2 }"> <input
						type="hidden" name="q_cnum_3" value="${q_cnum_3 }"> <input
						type="hidden" name="hash1" value="${hash1 }"> <input
						type="hidden" name="hash2" value="${hash2 }"> <input
						type="hidden" name="hash3" value="${hash3 }">



					<div class="titleAndInfo">
						<span
							style="font-size: 20px; color: #9f6e54; font-family: JalnanOTF;">"${userchallenge.chg_title }"</span><br />
						<b class="notice_font"> 챌린지 시작일은
							${userchallenge.chg_startdate } 입니다! <br />
						</b>


					</div>

					<br /> <br />
 
					<table>
						<tr height="30px">
							<td width="40px"><img src="ban/img/team.png" width="25px"></td>
							<td width="100px">모집정원</td>
							<td>${userchallenge.chg_capacity }명</td>
						</tr>

						<tr height="30px">
							<td><img src="ban/img/list.png" width="25px"></td>
							<td width="100px">챌린지 분류</td>
							<td>${first_ctg}>${second_ctg} > ${third_ctg}</td>
						</tr>

						<tr height="30px">
							<td><img src="ban/img/calendar.png" width="25px"></td>
							<td width="100px">챌린지 기간</td>
							<td>${userchallenge.chg_startdate }부터
								${userchallenge.chg_enddate } 까지 (${duration }일간)</td>
						</tr>
						<tr height="30px">
							<td><img src="ban/img/hashtag.png" width="25px"></td>
							<td width="100px">해시태그</td>
							<td><input type="text" class="tagTextbox" value="${hash1 }"
								readonly> <input type="text" class="tagTextbox"
								value="${hash2 }" readonly> <input type="text"
								class="tagTextbox" value="${hash3 }" readonly></td>
						</tr>

					</table>




					<br /> <br />
					<button id="submit" class="submit_btn">좋아요, 등록해주세요!</button>

				</form>
			</div>
		</div>

	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>
</body>
</html>