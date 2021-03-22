<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐 : 챌린지 등록</title>

<link href="ban/css/makechallenge_css.css" rel="stylesheet">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">


// 뒤로 가기 
function goback(){
	window.history.back();
}


// 첨부파일 용량 체크 (대표이미지)
function size1Check(){

	var size = document.getElementById("file1").files[0].size;
	console.log("대표이미지 size : " + size);

	// 용량 2MB 제한 
	if(size > 1024 * 1024 * 2){
		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
		alert('2MB 이하 파일만 등록 가능하다람 T_T \n\n' + '현재 사진 용량 : ' + (Math.round(size / 1024 / 1024 * 100) / 100) + 'MB');
		$("input[id=file1]").val("");
	}

	// 체크를 통과했다면 종료
	else return;
}

//첨부파일 용량 체크 (인증예시 이미지)
function size2Check(){

	var size2 = document.getElementById("file2").files[0].size;
	console.log("인증예시이미지 size2 : " + size2);

	// 용량 2MB 제한 
	if (size2 > 1024 * 1024 * 2){
		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
		alert('2MB 이하 파일만 등록 가능하다람 T_T \n\n' + '현재 사진 용량 : ' + (Math.round(size2 / 1024 / 1024 * 100) / 100) + 'MB');
		$("input[id=file2]").val("");
	}

	// 체크를 통과했다면 종료
	else return;
}


// 기간 직접입력 버튼 클릭 시 기간 라디오버튼을 모두 무효화 
function selfbtn(){
	$("input[id='rad']").attr('disabled',true);
	$("input[id='rad2']").attr('disabled',true);
	$("input[id='rad3']").attr('disabled',true);
	$("input[id='rad4']").attr('disabled',true);
	$("#capa_self").show(); 
}







/* 기본으로 실행되는 함수들 */

$(function () {


    // 직접입력 숨김, 챌린지 중복체크 숨김, 기간 재설정 메시지 숨김 
    $("#capa_self").hide();
    $("#capa_default").show();
    $("#doubleCheckbtn").hide();

    $("#checkok_msg").hide();
    $("#checkfail_msg").hide();
    $("#duration_msg").hide();


    /* startDate datepicker */

    var today = new Date();
    console.log('오늘 날짜 : ' + today)

    // 오늘부터 5일 뒤 날짜부터 챌린지 시작 가능하게끔 
    var s_minDate = new Date();
    s_minDate.setDate(today.getDate() + 5);
    console.log('챌린지 최소시작일 날짜 : ' + s_minDate);



 	// 챌린지 시작일 
    $("#startDate").datepicker({
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeMonth: true,
        showOn: "both",
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
        buttonImageOnly: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        minDate: s_minDate


    });

    /* endDate datepicker */

    // 챌린지 종료일 
    $("#endDate").datepicker({
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        showMonthAfterYear: true,
        changeMonth: true,
        showOn: "both",
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
        buttonImageOnly: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        minDate: s_minDate


    });


    // 시작일 or 종료일 변경되면 기간 계산을 초기화하고 체크결과 메시지를 숨김
    $("#startDate").change(function () {
        $('#startDate').empty();
        chk_if_none();
        $("#checkok_msg").hide();
        $("#checkfail_msg").hide();

    });
    
    $("#endDate").change(function () {
        $('#endDate').empty();
        chk_if_none();
        $("#checkok_msg").hide();
        $("#checkfail_msg").hide();
    });

	
	// 시작일이 입력되면 종료일이 시작일보다 앞서지 못하도록 제약 
    $('#startDate').datepicker("option", "onClose", function (selectedDate) {
        $("#endDate").datepicker("option", "minDate", selectedDate);
    });
 	// 종료일이 입력되면 시작일이 종료일보다 나중이지 못하도록 제약 
    $('#endDate').datepicker("option", "onClose", function (selectedDate) {
        $("#startDate").datepicker("option", "maxDate", selectedDate);
    });

    // 시작/종료일은 클릭으로만 설정 가능함 
    $("#startDate").attr('readonly', 'readonly');
    $("#endDate").attr('readonly', 'readonly');

    // 시작일과 종료일이 모두 입력되었는지 검사함 
    function chk_if_none() {
        if ($("#startDate").datepicker("getDate") === null || $("#endDate").datepicker("getDate") === null) {
        } else {
            calc_period_gap(); // 모두 입력되었으면 시작일과 종료일 간의 날짜 차이를 계산함 
        }
    }

    // 날짜 차이 계산 함수 
    function calc_period_gap() {
        var start = $("#startDate").datepicker("getDate");
        var end = $("#endDate").datepicker("getDate");
        var days = ((end - start) / (1000 * 60 * 60 * 24)) + 1;

        if (days < 5) { // 5일 조건 
            alert('챌린지는 최소 5일 이상부터 등록이 가능해요!');
            $("#duration").val('등록 불가능!');
            $("#duration_msg").show();
            $('#startDate').datepicker('setDate', null);
            $('#endDate').datepicker('setDate', null);
            $("#submitbtn").hide(); // 등록버튼을 막음 

        } else if (days > 31) { // 31일 조건 
            alert('챌린지는 31일보다 길 수 없습니다!');
            $("#duration").val('등록 불가능!');
            $("#duration_msg").show();
            $('#startDate').datepicker('setDate', null);
            $('#endDate').datepicker('setDate', null);
            $("#submitbtn").hide(); // 등록버튼을 막음 

        } else { // 유효한 기간일 경우 
            $("#duration_msg").hide();
            $("#duration").val(days + '일간 힘내봐요!');
            $("#submitbtn").show();
            $("#doubleCheckbtn").show(); // 기간 중복체크버튼을 띄운다 
        }
    }

});




<%
String context = request.getContextPath();
%>


// 챌린지 내용이 100자를 넘지 않도록 유효성 검사 
$(document).ready(function(){
   $('#textarea_chg_contents').on('keyup', function(){
      $('#chg_contents_count').html("("+$(this).val().length+" / 100)");
      
      if($(this).val().length > 100) {
         $(this).val($(this).val().substring(0, 100));
         $('#chg_contents_count').html("(100 / 100)");
      }
   })
});

//인증 설명이 50자를 넘지 않도록 유효성 검사 
$(document).ready(function(){
   $('#text_explain').on('keyup', function(){
      $('#text_explain_count').html("("+$(this).val().length+" / 50)");
      
      if($(this).val().length > 50) {
         $(this).val($(this).val().substring(0, 50));
         $('#text_explain_count').html("(50 / 50)");
      }
   })
});


// 날짜를 yyyy-mm-dd 형식으로 만들어주는 함수 
function getFormatDate(date){
	var g_year = date.getFullYear();
	var g_month = (1 + date.getMonth());
	g_month = g_month >= 10 ? g_month : '0' + g_month;
	var g_day = date.getDate();
	g_day = g_day >= 10 ? g_day : '0' + g_day;
	return g_year + '-' + g_month + '-' + g_day;
}


//중복체크 버튼을 누르면 실행됨
//시작일, 종료일, 이메일을 따서 아작스로 넘김 
function duration_chk(){
	console.log('챌린지기간 중복체크 실행');
	
    var user_id_email = "${userinfo.user_id_email}";
    var f_selectedstart = getFormatDate($("#startDate").datepicker("getDate"));
    var f_selectedend = getFormatDate($("#endDate").datepicker("getDate"));

    
    
    $.ajax({ 
        url:"<%=context%>/doubleCheck" ,
        data:{user_id_email:user_id_email, selectedstart:f_selectedstart, selectedend:f_selectedend},
        dataType:'text',
        success:function(data){
	        	 var jsondata = JSON.stringify(data); 
	        	 
	        	 
	        	 if (data == 'impossible'){
	        		   alert('이 기간으로는 등록할 수 없어요!');
	        		   document.makeChalForm.duration_hidden.value = "duration_nochk"; // duration_nochk상태
	        		   document.makeChalForm.duration_impossible.value = jsondata; // 가부값 부여

	        		   console.log('중복체크 여부 : ' + document.makeChalForm.duration_hidden.value);
	        		   console.log('중복으로 불가능 : ' + document.makeChalForm.duration_impossible.value);
	        		   
	        		   $("#checkfail_msg").show();
	                   $('#startDate').datepicker('setDate', null);
	                   $('#endDate').datepicker('setDate', null);
	        	 } else {
	        		   alert('해당 기간으로 등록 가능해요!');
	        		   document.makeChalForm.duration_hidden.value = "durationChk"; // durationChk상태
	        		   document.makeChalForm.duration_impossible.value = jsondata; // 가부값 부여 
	        		   console.log('중복체크 여부 : ' + document.makeChalForm.duration_hidden.value);
	        		   console.log('중복이 없어 등록 가능 : ' + document.makeChalForm.duration_impossible.value);
	        		   $("#checkok_msg").show();
	        	 }
       }            
    });

    
}

// 시작일이나 종료일이 바뀔 때 실행됨. duration_nochk 상태로 값을 바꾸어줌 
function duration_changed(){
	console.log('시작일 또는 종료일이 변경됨')
	document.makeChalForm.duration_hidden.value = "duration_nochk";
	console.log('중복체크 여부 : ' + document.makeChalForm.duration_hidden.value);
}


// 중분류와 소분류 처리 
$(document).ready(function(){
   $("#mc_numdiv").hide(); 
   $("#sc_numdiv").hide(); 

   
   // 대분류가 선택되면, 그 값을 ajax로 컨트롤러에 보내어 적합한 중분류를 받아옴 
   $("#lc_num").change(function(){
      var lc_num = document.getElementById("lc_num");
      <!-- 선택한 값을 저장 -->
      var selected_lc_num = lc_num.options[lc_num.selectedIndex].value;
      console.log("lc_num : " + selected_lc_num);
      

      $("#mc_numdiv").show(); 
      $("#sc_numdiv").hide(); 
      
      $.ajax({ 
          url:"<%=context%>/readCategory2" ,
          data:{lc_num : selected_lc_num},
          dataType:'json',
          success:function(data){
            str    = "<option value='0' selected>== 중분류 ==</option>";
            str2   = "";

            // 받아온 중분류를 옵션으로 나열 
             $(data).each(
                function(){
                   str2 = "<option value='" + this.mc_num + "'>" + this.subject + "</option>";
                   str += str2;
                }      
             );
            $("#mc_num").empty(); 
            $("#sc_num").empty();
            $('#mc_num').append(str);   
         }            
      });
      
      
   // 중분류가 선택되면, 그 값을 ajax로 컨트롤러에 보내어 적합한 소분류를 받아옴 
      $("#mc_num").change(function(){
         var lc_num = document.getElementById("lc_num");
         <!-- 선택한 값을 저장 -->
         var selected_lc_num = lc_num.options[lc_num.selectedIndex].value;
         var mc_num = document.getElementById("mc_num");
         <!-- 선택한 값을 저장 -->
         var selected_mc_num = mc_num.options[mc_num.selectedIndex].value;
         console.log("lc_num & mc_num : " + selected_lc_num + " and " + selected_mc_num);
         

         $("#sc_numdiv").show(); 
         
      
         
         $.ajax({ 
             url:"<%=context%>/readCategory3" ,
             data:{mc_num : selected_mc_num, lc_num : selected_lc_num},
             dataType:'json',
             success:function(data){
               str    = "<option value='0' selected>== 소분류 ==</option>";
               str2   = "";

          	  // 받아온 소분류를 옵션으로 나열 
                $(data).each(
                   function(){
                      str2 = "<option value='" + this.sc_num + "'>" + this.subject + "</option>";
                      str += str2;
                   }      
                );
               $("#sc_num").empty();
               $('#sc_num').append(str);   
            }            
         });

      });   
      
   });
   
});


// 최종 유효성 검사 : 중복체크가 실행되었고 / 실제 중복이 없고 / 대중소분류가 선택되어있을 때만 등록이 가능 
function finalcheck(){
	
	console.log('최종 유효성검사 finalcheck() 실행');
	
	if(document.makeChalForm.duration_hidden.value == 'duration_nochk'){
		alert('챌린지 기간 중복체크를 진행해주세요!');
		return false;
	}
	
	if(document.makeChalForm.duration_impossible.value == 'impossible'){
		alert('챌린지 기간을 변경해주세요!');
		return false;
	}
	
	
	 if (lc_num.options[lc_num.selectedIndex].value == 0){
		 alert('챌린지 대분류를 선택하세요!');
		 return false;
	 } else if (mc_num.options[mc_num.selectedIndex].value == 0){
		 alert('챌린지 중분류를 선택하세요!');
		 return false;
	 } else if (sc_num.options[sc_num.selectedIndex].value == 0){
		 alert('챌린지 소분류를 선택하세요!');
		 return false;
	 }

	
}

</script>



</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>

	<div class="wrapper">

		<form name="makeChalForm"
			action="confirmChal?user_id_email=${userinfo.user_id_email }"
			method="post" enctype="multipart/form-data"
			onsubmit="return finalcheck()">


			<!--  챌린지 등록 시작 -->

			<b class="makeChalTitleFont">어떤 챌린지를 만들어볼까요?</b><br /> <br />
			<table class="maintable">

				<tr height=40px>
					<td colspan="2"><b class="subTitleFont">챌린지 주요 정보</b></td>
				</tr>


				<tr height=40px>
					<!--  챌린지명 -->
					<td>챌린지명</td>
					<td><input type="text" size="80" name="chg_title"
						required="required" maxlength="50" class="title_textbox"
						placeholder="챌린지명을 입력하세요! (최대 50자)"></td>
				</tr>

				<tr height=40px>
					<!--  정적카테고리 -->
					<td>카테고리</td>
					<td>

						<div class="category_div">
							<select name="lc_num" id="lc_num" class="select150">
								<option value="0" selected>== 대분류 ==</option>
								<c:forEach var="list" items="${category1 }" varStatus="status">
									<option value="${list.lc_num }">${list.subject }</option>
								</c:forEach>
							</select>
						</div>


						<div id="mc_numdiv" class="category_div">
							<select name="mc_num" id="mc_num" class="select150">


							</select>
						</div>


						<div id="sc_numdiv" class="category_div">
							<select name="sc_num" id="sc_num" class="select150">


							</select>
						</div>

					</td>

				</tr>

				<tr height=50px>
					<!--  챗봇추천분류 -->
					<td>챌린지 성격</td>
					<td>
						<!-- 테이블 안의 테이블 시작 -->
						<table class="subtable">
							<tr>
								<td><b class='contentFont'>어떤 의미가 있나요?</b></td>
								<td><select name="q_cnum_1" class="select225"
									required="required">
										<option value="1">미래를 위한 투자</option>
										<option value="2">마음 돌보기</option>
										<option value="3">습관 형성</option>
										<option value="4">티끌모아 태산</option>
								</select></td>
							</tr>
							<tr>
								<td><b class='contentFont'>주로 언제 이루어질 활동인가요?</b></td>
								<td><select name="q_cnum_2" class="select225"
									required="required">
										<option value="1">아침 (06~11시)</option>
										<option value="2">낮 (11~18시)</option>
										<option value="3">저녁 (18~20시)</option>
										<option value="4">밤 (20~0시)</option>
										<option value="5">새벽 (0~6시)</option>
										<option value="6">하루종일</option>
								</select></td>
							</tr>
						</table>
					</td>
				<tr height=40px>
					<!--  대표이미지 -->
					<td>대표이미지</td>
					<td>
						<!-- <input type="hidden" name="chg_image" value="chg_image" /> -->
						<input type="file" name="file1" required="required" id="file1"
						onchange="size1Check();"
						accept="image/png, image/jpeg, image/jpg, image/gif"
						required="required" /> <br /> <img src="ban/img/notice2.png"
						width="15px;" height="15px;"><b class="explainFont">5MB
							이하의 png, jpg, gif / 등록된 이미지는 수정이 불가능하니 신중하게 등록해주세요!</b>
					</td>
				</tr>


				<tr height=50px>
					<!--  챌린지소개 -->
					<td>챌린지 소개</td>
					<td><textarea name="chg_contents" cols="65" rows="3"
							required="required" id="textarea_chg_contents"
							placeholder="100글자 이하로 챌린지를 소개해주세요.&#13;&#10;(예시: 하루 한 번 할수있다람쥐에 접속하는 챌린지입니다.)"></textarea>

						<div id="chg_contents_count" class="count_text">(0 / 100)</div></td>

				</tr>

			</table>
			<div class="empty"></div>



			<table class="maintable">
				<tr height=40px>
					<td colspan="2"><b class="subTitleFont">챌린지 상세 정보</b></td>
				</tr>

				<tr height=40px>
					<!--  참여가능인원수 -->
					<td>챌린지 정원</td>
					<!--  음수 안 되게 로직 걸기  -->
					<td>
						<div id="capa_default">
							<label><input type="radio" name="chg_capacity" id="rad"
								value="10">10명</label> <label><input type="radio"
								name="chg_capacity" id="rad2" value="30">30명</label> <label><input
								type="radio" name="chg_capacity" id="rad3" value="50">50명</label>
							<label><input type="radio" name="chg_capacity" id="rad4"
								value="70">70명</label><br />
							<button id="capa_self_btn" class="button_by" type="button"
								onclick="selfbtn()">직접설정</button>
						</div>
						<div id="capa_self">
							<input type="number" class="numberbox" name="chg_capacity"
								min="5" max="100" value="5">명
						</div>


					</td>
				</tr>


				<tr height=40px>
					<!--  챌린지시작일자 -->
					<td>챌린지 시작일</td>
					<td><input type="text" id="startDate" name="chg_startdate"
						onchange="duration_changed()" class="datepic_textbox"
						placeholder="시작일을 입력하세요!"></td>
				</tr>


				<tr height=30px>
					<!--  챌린지종료일자 -->
					<td>챌린지 종료일</td>
					<td><input type="text" id="endDate" name="chg_enddate"
						onchange="duration_changed()" class="datepic_textbox"
						placeholder="종료일을 입력하세요!"></td>
				</tr>


				<tr height=30px>
					<td>챌린지 기간</td>
					<td><div id="datesbetween">
							<input type="text" id="duration" placeholder="챌린지 기간 (자동입력)"
								class="datepic_textbox" readonly>
						</div>

						<div id="duration_msg">
							<img src="ban/img/notice2.png" width="15px;" height="15px;"><b
								class="explainFont">기간을 다시 설정해주세요.</b>
						</div>


						<div id="doubleCheckbtn">
							<button type="button" class="redbutton" onclick="duration_chk()">챌린지기간
								중복체크</button>

							<span id="checkok_msg"><b class="explainFont"></b>체크 완료!
								등록 가능한 기간입니다!</span> <span id="checkfail_msg"><b
								class="explainFont"></b>기간내 다른 챌린지가 있어요 ㅠㅠ</span>




						</div> <input type="hidden" name="duration_hidden" id="duration_hidden"
						value="duration_nochk"> <input type="hidden" name="duration_impossible"
						id="duration_impossible" value="impossible"></td>

				</tr>




				<tr height=40px>
					<!--  태그 -->
					<td>태그</td>
					<td><input type="text" placeholder="태그1"
						class="hashtag_textbox" id="hash1" name="hash1"
						required="required"><input type="text" placeholder="태그2"
						class="hashtag_textbox" id="hash2" name="hash2"
						required="required"><input type="text" placeholder="태그3"
						class="hashtag_textbox" id="hash3" name="hash3"
						required="required">

						<div>
							<img src="ban/img/notice2.png" width="15px;" height="15px;">
							<b class="explainFont">해시태그는 3개까지만 등록 가능해요!</b>
						</div></td>
				</tr>

				<tr height=40px>
					<!--  인증예시 이미지 -->
					<td>인증예시 이미지</td>
					<td>
						<!-- <input type="hidden" name="chg_sample_image"
						value="chg_sample_image" /> --> <input type="file" name="file2"
						required="required" id="file2" onchange="size2Check();"
						accept="image/png, image/jpeg, image/jpg, image/gif"
						required="required" /> <br /> <img src="ban/img/notice2.png"
						width="15px;" height="15px;"><b class="explainFont">2MB
							이하의 png, jpg, gif / 등록된 이미지는 수정이 불가능하니 신중하게 등록해주세요!</b>
					</td>
				</tr>



				<tr height=40px>
					<!--  인증방법 -->
					<td>인증방법 설명</td>
					<td><input type="text" size="80" name="chg_sample_text"
						required="required" class="explain_textbox" id="text_explain"
						placeholder="50글자 이하로 인증사진 촬영방법을 설명해주세요.">

						<div id="text_explain_count" class="smallTextbox">(0 / 50)</div></td>
				</tr>



				<tr>
					<td></td>
					<td></td>
				</tr>



			</table>

			<div class="empty"></div>

			<div class="two_buttons">

				<div id="cancelbtn" class="cancelbtn">
					<button id="cancel" type="button" class="button_by"
						onclick="goback();">뒤로가기</button>
				</div>
				<div id="submitbtn" class="submitbtn">

					<button id="submit" class="button_by">등록</button>
				</div>
			</div>
		</form>



	</div>
	<!-- makeChal div class 종료 -->

	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>


</body>
</html>