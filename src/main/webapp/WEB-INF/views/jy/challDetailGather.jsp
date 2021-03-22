<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${chg_title} : 할수있다람쥐</title>

<link rel="stylesheet" type="text/css" href="km/css/kmStarRating.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

<!-- CSS -->
<style type="text/css">
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'ChosunGu';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.out {
	margin: 0 auto;
	width: 1200px;
}

/* 경민 소통하기 CSS 시작 */
.chattr {
	height: 70px;
}

.chattr1 {
	height: 100px;
}

#chatBox {
	margin: 0 auto;
	width: 600px;
	height: 700px;
}

#chatScroll {
	margin: 0 auto;
	width: 650px;
	height: 700px;
	overflow: auto;
	background-color: #FBF5EC;
}

#ProfScroll {
	margin: 0 auto;
	width: 1105px;
	height: 150px;
	overflow-x: auto;
	margin-left: 65px;
}
/* 스크롤바 */
#ProfScroll::-webkit-scrollbar {
	width: 16px;
}

#ProfScroll::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

#ProfScroll::-webkit-scrollbar-thumb {
	background-color: #D8E4A9;
	border-radius: 10px;
}

#ProfScroll::-webkit-scrollbar-thumb:hover {
	background: #555;
}

#ProfScroll::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 16px;
	height: 16px;
	background: #D8E4A9;
}

#chatScroll::-webkit-scrollbar {
	width: 16px;
}

#chatScroll::-webkit-scrollbar-track {
	background-color: #FBF5EC;
}

#chatScroll::-webkit-scrollbar-thumb {
	background-color: palegoldenrod;
	border-radius: 10px;
}

#chatScroll::-webkit-scrollbar-thumb:hover {
	background: #555;
}

#chatScroll::-webkit-scrollbar-button:start:decrement {
	width: 16px;
	height: 16px;
	background: #FBF5EC;
}

#chatScroll::-webkit-scrollbar-button:end:increment {
	width: 16px;
	height: 16px;
	background: #FBF5EC;
}

.chatForm_others {
	margin: 0 auto;
	float: left;
}

.chatForm_mine {
	margin: 0 auto;
	float: right;
}

.chatUser_image {
	width: 70px;
	height: 70px;
	border-radius: 35px;
	float: left;
	vertical-align: bottom;
	display: inline-block;
	margin-right: 20px;
}

.nickname {
	font-family: 'yg-jalnan';
	font-size: 15px;
	color: #51555a;
}

.text {
	font-family: 'ChosunGu';
	font-size: 15px;
	line-height: 50px;
	background-color: #fcf0c9;
	border-radius: 5px;
	display: inline-block;
}

.text_mine {
	font-family: 'ChosunGu';
	font-size: 15px;
	line-height: 50px;
	background-color: #fcf0c9;
	border-radius: 5px;
	float: right;
}

.time {
	font-family: 'ChosunGu';
	font-size: 10px;
	display: inline-block;
	position: relative;
	top: 13px;
	height: 10px;
	width: 50px;
}

.time_mine {
	font-family: 'ChosunGu';
	font-size: 10px;
	position: relative;
	top: 35px;
	height: 10px;
	width: 50px;
}

.chatWriteForm {
	margin: 0 auto;
	width: 700px;
	position: relative;
	left: -22.5px;
}

#msg {
	width: 600px;
	height: 40px;
	border: 1px solid palegoldenrod;
	position: relative;
	left: 25px;
	top: -0.5px;
	border-radius: 0 0 0 20px;
	font-family: 'ChosunGu';
}

#send {
	width: 50px;
	height: 40px;
	background-color: palegoldenrod;
	color: #515543;
	font-family: 'ChosunGu';
	font-size: 13px;
	border: 1px solid palegoldenrod;
	position: relative;
	left: 19.3px;
	top: -0.4px;
	border-radius: 0 0 20px 0;
	font-weight: bold;
} /* 경민 소통하기 CSS 끝 */

/* 경민 후기 CSS 시작 */
.time1 {
	font-family: 'ChosunGu';
	font-size: 10px;
	display: inline-block;
	position: relative;
	top: -24px;
	height: 10px;
	width: 50px;
}

.reviewWriteForm {
	margin: 30 130 auto;
	width: 986px;
}

#reviewScroll {
	margin: 50 130 auto;
	padding: 20 20 20 20;
	width: 930px;
	height: 700px;
	border-radius: 3px;
}

.reviewForm_others {
	margin: 0 0 20 0;
	float: left;
	border-bottom: 1px solid #8C8C8C;
}

.reviewUser_image {
	width: 70px;
	height: 70px;
	border-radius: 35px;
	float: left;
	vertical-align: bottom;
	display: inline-block;
	margin-right: 20px;
}

.reviewText {
	font-family: 'ChosunGu';
	font-size: 15px;
	line-height: 30px;
	width: 760px;
	display: inline-block;
}

.checked {
	color: orange;
}

.fa-star {
	color: #ffe400;
}

#reviewsend {
	width: 80px;
	height: 40px;
	background-color: palegoldenrod;
	color: #515543;
	font-family: 'ChosunGu';
	font-size: 13px;
	font-weight: bold;
	float: right;
	border: 1px solid palegoldenrod;
	border-radius: 10px;
	margin-top: 15px;
}
/* 경민 후기 CSS 끝 */

/* 지예 CSS 시작*/
table, tr {
	border-radius: 10px 10px 0 0;
}

.Jalnan {
	margin-left: 65px;
	font-family: 'yg-jalnan';
}

.ChosunGu {
	margin-left: 65px;
	font-family: 'ChosunGu';
}

.status {
	margin-left: 65px;
	font-family: 'ChosunGu';
	font-size: 20px;
	background-color: #5B874A;
	border-radius: 5px;
	width: 80px;
	line-height: 30px;
	color: white;
	text-align: center;
	display: inline-block;
}

.tag {
	margin-left: 65px;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	background-color: olivedrab;
	border-radius: 5px;
	width: 90px;
	line-height: 30px;
	color: white;
	text-align: center;
	display: inline-block;
}

.hashtag {
	margin-left: 5px;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	background-color: palegoldenrod;
	border-radius: 5px;
	width: 100px;
	line-height: 30px;
	text-align: center;
	display: inline-block;
}

#hr1 {
	margin-left: 65px;
	border-bottom: 0px;
	width: 92%;
	border-top: 1px solid #BFBFBF;
}

#hr2 {
	margin-left: 65px;
	border-bottom: 0px;
	width: 92%;
	border-top: 1px solid #BFBFBF;
	position: relative;
	bottom: -10px;
}

#hr3 {
	margin-left: 65px;
	border-bottom: 0px;
	width: 92%;
	border-top: 1px solid #BFBFBF;
}

.info {
	margin-left: 65px;
	background-color: #F2F2F2;
	font-family: 'ChosunGu';
	font-weight: bold;
	width: 92%;
}

.infotitle {
	font-size: 14px;
	width: 150px;
	height: 20px;
}

.infotext {
	font-size: 14px;
	color: #4d593e;
}

.join {
	margin-left: 515px;
	font-family: 'yg-jalnan';
	font-size: 20px;
	background-color: palegoldenrod;
	border-radius: 5px;
	width: 170px;
	line-height: 40px;
	color: #4d593e;
	text-align: center;
	margin-bottom: 10px;
}

.part {
	font-family: 'ChosunGu';
	display: inline-block;
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 18px;
}

#totpart {
	font-family: 'yg-jalnan';
	display: inline-block;
	color: #5B874A;
	font-size: 40px;
	vertical-align: bottom;
}

.agree {
	font-family: 'yg-jalnan';
	font-size: 18px;
	background-color: #D8E4A9;
	border: 0;
	border-radius: 5px;
	width: 70px;
	line-height: 30px;
	margin: 5px;
	cursor: pointer;
}

.td1part {
	font-family: 'ChosunGu';
	font-size: 16px;
	background-color: palegoldenrod;
	color: #515543;
	line-height: 40px;
	font-weight: bold;
}

.td2part {
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	color: #515543;
	line-height: 30px;
}

.td2_1part {
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	color: #515543;
	line-height: 30px;
	text-align: center;
	width: 350px;
}

.td2_2part {
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	color: #515543;
	line-height: 30px;
	width: 350px;
}

.td3part {
	font-family: 'yg-jalnan';
	font-size: 18px;
	color: #9E6D5A;
	line-height: 40px;
}

.tdDotori {
	font-family: 'yg-jalnan';
	font-size: 20px;
	background-color: white;
	color: #515543;
	line-height: 40px;
	width: 200px;
	border-radius: 5px;
	margin: 5px;
}

.chgMenuList {
	font-family: 'ChosunGu';
	font-size: 16px;
	color: white;
	margin-left: 50px;
	text-decoration: none;
	cursor: pointer;
}

.chkImg {
	width: 210px;
	height: 210px;
	display: inline-block;
	margin: 10px;
	cursor: pointer;
	object-fit: cover;
}

 .screen {
	position: relative;
	overflow: hidden;
} 

/* 닉네임, 이미지 부분 */
.screen .top {
	position: absolute;
	bottom: 150%;
	z-index: 1;
	color: #F8CBAD;
	font-size: 20px;
	font-family: 'yg-jalnan';
	/* 자연스러운 애니메이션효과 */
 	transition: all 1s; 
	width: 225px;
	overflow: hidden; /* 오버되면 숨겨라 */
	text-overflow: ellipsis; /* 텍스트가 오버되면  ...으로 변경해라 */
	white-space: nowrap;/* 공백이 있으면 다음줄로 넘기지 말고 한줄로 연결해라 */
} 

/* 날짜부분 */
.screen .bottom {
	position: absolute;
	font-family: 'ChosunGu';
	width: 225px;
	top: 180%;
	z-index: 1; /* 요소들의 수직위치 지정. 숫자가 높을 수록 위, 낮을 수록 아래. */
	color: #fff;
	font-size: 15px;
	transition: all 1s;
}

/* 가상요소 필수값 */
 .screen::after {
	content: ''; 
 	display: block; 
	position: absolute;
 	top: 0;
	left: 0; 
	width: 210px;
	height: 210px;
	/*적색,녹색,청색,투명도*/
	background: rgba(0, 0, 0, 0.5);
	/* 배치순서 속성. position 속성이 정해진 요소에서만 가능. */
	z-index: 0;
	opacity: 0;
	margin: 10px;
 	transition: all .35s;
} 

 .yyy:hover .top {
	bottom: 25%;
}

.yyy:hover .bottom {
	top: 78%;
}
 
.yyy:hover .screen::after {
	opacity: 1;
} 

.photoBtn {
	border: 2px solid palegoldenrod;
    border-radius: 5px;
    background-color: white;
    font-family: 'ChosunGu';
    font-size: 15px;
    font-weight: bold;
    width: 102px;
    line-height: 25px;
}

.photoBtn:hover {
	color: #4d593e;
}

.photoBtn1 {
	border: 2px solid peachpuff;
	border-radius: 5px;
	background-color: peachpuff;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 102px;
	line-height: 25px;
}

.photoBtn1:hover {
	color: #4d593e;
}

.photoBtn2 {
	border: 2px solid palegoldenrod;
	border-radius: 5px;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 206px;
	line-height: 27px;
	margin-left: 10px;
	background-color: palegoldenrod;
}

.photoBtn3 {
	border: 2px solid peachpuff;
	border-radius: 5px;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 206px;
	line-height: 27px;
	margin-left: 10px;
	background-color: peachpuff;
}

.photoBtn4 {
	border: 2px solid palegoldenrod;
	border-radius: 5px;
	font-family: 'ChosunGu';
	font-size: 15px;
	font-weight: bold;
	width: 206px;
	line-height: 27px;
	margin-left: 10px;
}

#file1 {
	border: 1px solid palegoldenrod;
    background-color: palegoldenrod;
    font-family: 'ChosunGu';
    font-size: 13px;
    font-weight: bold;
    width: 250px;
    line-height: 25px;
    color: #4d593e;
}

#topComm {
	width: 650px;
	text-align: center;
	background-color: palegoldenrod;
	line-height: 50px;
	margin: 0 auto;
	border-radius: 20px 20px 0 0;
	font-family: 'JalnanOTF';
	color: #51555a;
}

#pad {
	width: 700px;
	height: 920px;
	background-color: #000000cf;
	margin: 0 auto;
	border-radius: 50px;
}

#padIn {
	position: relative;
	bottom: -4px;
}

#padMid {
	position: relative;
	bottom: -50px;
	background-color: white;
	width: 655px;
	height: 798px;
	margin: 0 auto;
	border-radius: 20px;
}

#padIcon {
	background-color: #4f4d4d;
	width: 100px;
	height: 10;
	border-radius: 4px;
	position: relative;
	bottom: -29px;
	margin: 0 auto;
}

#padIcon2 {
	background-color: #444242;
	width: 50px;
	height: 50px;
	border-radius: 25px;
	position: relative;
	top: -61px;
	margin: 0 auto;
}

.chattr {
	height: 100px;
}

.chattr1 {
	height: 70px;
}

#Paging{
	margin-top: 30px;
    font-family: 'ChosunGu';
    font-weight: bold;
}

#currentPage{
    cursor: pointer;
    display: inline-block;
    width: 30px;
    line-height: 30px;
    background-color: palegoldenrod;
    margin: 2px;
    border-radius: 50%;
}

#currentPage:hover {
	background-color: peachpuff;
}
    
</style>

<!-- 자바 스크립트 -->
<script type="text/javascript">
   
   //-- 경민 소통하기 스크립트 시작 --//
   /* 채팅스크롤바 */
   $('#chatScroll').scrollTop($('#chatScroll').prop('scrollHeight'));
   
   //-- 지예 시작 --//
   /* 신청 동의서 */
   function agreeChk(warning) {
      if(warning.chkButton.disabled==true) {
         warning.chkButton.disabled=false
      }else {
         warning.chkButton.disabled=true
      }
   }
   
   $(function () {
      $("#joinChallButton").click(function (e) {
         $("#joinChall").show();
         
      });
   });
   
   /* Chg_State별 화면구현 */
    $(function () {
      var chg_state = "${chg_state}";
      var user_id_email = "${user_id_email}";
      var masterid = "${master.user_id_email}"; //챌주아이디
      var myChgState = "${myChgState}"; //나의 이 챌린지참여여부 (미참여 0, 참여1)
      var countMyReview = "${countMyReview}"; //후기 작성여부(미작성 0, 작성 1)
     
      /* 모집중 */
      if(chg_state == 1) {
         $("#joinChall").hide();
         $("#reviewButton").hide();
         $("#todayRandom").hide();
         $("#dotoriBar").hide();
         $(".navDown").hide();
         
         if(myChgState == 1 || user_id_email === masterid) {
            $("#joinChallButton").hide();
         } 
   
         
       /* 모집마감 */   
      }else if(chg_state == 2) {
         
         $("#joinChall").hide();
         $("#reviewButton").hide();
         $("#todayRandom").hide();
         $("#dotoriBar").hide();
         $('#joinChallButton').hide();
         $(".navDown").hide();
      
       /* 진행중 */
      }else if(chg_state == 3) {
         $("#joinChall").hide();
         $("#joinChallButton").hide();
         $("#reviewButton").hide();
         $("#navReview").hide();
         $("#reviewBoard").hide();
         $("#chatBoard").hide();
      
         if(myChgState == 0) {
            $("#dotoriBar").hide();
            $("#send").attr("disabled","disabled");
            
         }
      
       /* 챌린지 종료 */
      }else if(chg_state == 4) {
         $("#joinChall").hide();
         $("#todayRandom").hide();   
         $('#joinChallButton').hide();
         $("#chatBoard").hide();
         $("#confirmSample").hide();
         $("#confirmBoard").hide();
         $("#send").attr("disabled","disabled");
         if(countMyReview == 1) {
             $(".reviewForm").hide();
             
          }
         if(myChgState == 0) {
            $("#dotoriBar").hide();
            $(".reviewForm").hide();
           
            
         }
         
        
        /* 모집인원 미달 */
      } else if(chg_state == 5) {
         $("#joinChall").hide();
         $("#todayRandom").hide();   
         $('#joinChallButton').hide();
         $("#dotoriBar").hide();
         $("#reviewButton").hide();
         $("#confirmSample").hide();
         $(".navDown").hide();
      
        /* 강제종료 */   
      } else if(chg_state == -1) {
         alert("강제종료된 챌린지입니다. 리스트로 돌아갑니다.");
      
      } else {
         alert("해당하는 state가 없습니다.")
      }
   }); 
    
   
    // D-DAY 계산하기 
    $(function () {
       
       var chg_num = "${chg_num}";
       
       var chg_regdate ="";
       var chg_startdate ="";
       var chg_enddate ="";
       var chg_capacity ="";
       var chg_now_parti ="";
       var chg_state = "${chg_state}";
       
       $.ajax({
             url:"<%=context%>/challTimeChk",
             data : {
                   chg_num : chg_num, //보낼변수
             },
             dataType : 'json', /* json(리스트) text(값1개) xml */
             success : function(data) {
                var jsondata = JSON.stringify(data); 
                
                //쪼개기
                $(data).each(
                  function(){
                     chg_regdate = this.chg_regdate; //등록일
                     chg_startdate = this.chg_startdate; //시작일
                     chg_enddate = this.chg_enddate; //종료일
                     chg_capacity = this.chg_capacity; //참여정원
                     chg_now_parti = this.chg_now_parti; //현재참여인원
                     
                  }       
                );
       
              
        //현재시간가져오기 = sysdate와 동일      
        var now = new Date(); 
        
       
        //시간을 Date형식으로 바꿔서 저장 ([계산가능]디데이 계산용.. 비교는 불가.. 정확히 말하자면 '==' 비교 불가..)
        var d_regdate = new Date(chg_regdate); //등록일
        var d_startdate = new Date(chg_startdate); //시작일
        var d_enddate = new Date(chg_enddate); //종료일
        var d_now = new Date(); //오늘
        
        d_regdate = new Date(d_regdate.getFullYear(), d_regdate.getMonth(), d_regdate.getDate());
        d_startdate = new Date(d_startdate.getFullYear(), d_startdate.getMonth(), d_startdate.getDate());
        d_enddate = new Date(d_enddate.getFullYear(), d_enddate.getMonth(), d_enddate.getDate());
        d_now = new Date(d_now.getFullYear(), d_now.getMonth(), d_now.getDate());
        
      
        
        if(chg_state == 1) {
        	 var distance = d_now - d_startdate; ; //모집중
             var days = Math.floor(distance / (1000 * 60 * 60 * 24));
              $('#challState').append("모집중 D"+days);
        }else if(chg_state == 2){
        	 $('#challState').append("인원마감");
             $('#challState').css('background-color', 'goldenrod');
        }else if(chg_state == 3){
        	 var distance = d_now - d_startdate; //진행중
             var days = Math.floor(distance / (1000 * 60 * 60 * 24));
             $('#challState').append("챌린지 "+(days+1)+"일차");
        }else if(chg_state == 4){
        	 $('#challState').append("챌린지종료");
             $('#challState').css('background-color', 'darksalmon');
        }else if(chg_state == 5){
        	 $('#challState').append("인원미달종료");
             $('#challState').css('background-color', 'darksalmon');
        }else {
        	alert("잠시 후 다시 시도해주세요.");
        }
		
        
        //기간 나타내기
        var str_startdate = new Date(chg_startdate).toISOString().slice(0,10); //시작일
        var str_enddate = new Date(chg_enddate).toISOString().slice(0,10); //종료일

          
         /* 신청서에 기입될 총 챌린지 기간  */
	     var distance = d_enddate - d_startdate; //챌린지 기간
         var days = Math.floor(distance / (1000 * 60 * 60 * 24));
          $('#totDate').append(str_startdate+" ~ "+str_enddate+" (총 "+(days+1)+"일)");
          
             }
     });
    });



   // 배팅관련
   $(document).ready(function() {
      
      /* 문자가 들어간 경우 */
        $("#batt").on("keyup", function() {
           $(this).val($(this).val().replace(/[^0-9]/g, ""));
           
        });
        

        $("#batt").on("change", function() {
          
             var dotori = parseInt($(this).val()); //내가 입력한 도토리
             
             if (isNaN(dotori) == true) {
                dotori = 0;
             }
             
             var haveDotori = parseInt(document.getElementById('point_balance').value); //내가 보유한 열매
             var imgDotori ="<img src='../jy/img/dotori.png' style='width:20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;'>"
           
             
          if (dotori > haveDotori) {
               
               /* 보유열매 이상으로 입력시 최대 보유열매로 바꿔주면서 10의 단위로 넣어주기 */
                haveDotori = Math.floor(haveDotori/10)*10;
                $(this).val(haveDotori); 
                $("#battAfter").empty(); //이전 기록 비우기
                $('#battAfter').append(imgDotori+" "+(haveDotori-haveDotori)+" 열매");
                
                var dotori100 = haveDotori+(haveDotori*0.5);
                  var dotori85up = haveDotori;
                var dotori85down = haveDotori*0.5;
                
                /* 콤마찍기 */ 
                dotori100 = dotori100.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                  dotori85up = dotori85up.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                dotori85down = dotori85down.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                $("#100").empty(); $('#100').append(dotori100+" 열매");
                $("#85up").empty(); $('#85up').append(dotori85up+" 열매");
                $("#85down").empty(); $('#85down').append(dotori85down+" 열매");
                    
             }  else {
                
                /* 10의 단위로 바꿔주기 */
                dotori = Math.floor(dotori/10)*10;
                $(this).val(dotori); 
                $("#battAfter").empty();//이전 기록 비우기 
                
                var remainDotori = haveDotori-dotori;
                remainDotori = remainDotori.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
               $('#battAfter').append(imgDotori+" "+(remainDotori)+" 열매");
           
             
                var dotori100 = dotori+(dotori*0.5);
                  var dotori85up = dotori;
                var dotori85down = dotori*0.5;
                
                /* 콤마찍기 */ 
                dotori100 = dotori100.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                  dotori85up = dotori85up.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                dotori85down = dotori85down.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                
                
                $("#100").empty(); $('#100').append(dotori100+" 열매");
                $("#85up").empty(); $('#85up').append(dotori85up+" 열매");
                $("#85down").empty(); $('#85down').append(dotori85down+" 열매");
             }  
             
          });

     });
   
   /* 배팅 포인트 체크*/
   function battChk() {
      var value = parseInt($("#batt").val());
      
         if(0 < value) {
            
             $('#point_minus').val(value); //input 태그에 value값 넣기.
             $('#batting_point').val(value);
              
      
             var chg_startdate = document.getElementById('chg_startdate').value;
             var chg_enddate = document.getElementById('chg_enddate').value;
             chg_startdate = new Date(chg_startdate);
             chg_enddate = new Date(chg_enddate);
             var days = chg_enddate-chg_startdate;
             days = Math.floor(days / (1000 * 60 * 60 * 24))+1;
             $('#chg_days').val(days); //input태그에 챌린지 일자 넣기.
         
            return true; //true일 경우에만 action으로 넘어간다.
            
         }else {
            alert("값이 0보다 커야 합니다.");
            
            return false; 
      }
          
   }
   
   //인증게시판 클릭시
   function clickConfirm(){
      
      $("#reviewBoard").hide();
      $("#chatBoard").hide();
      $("#confirmBoard").show();
   
   }
   
   //후기 클릭시
   function clickReview(){
      
      $("#confirmBoard").hide();
      $("#chatBoard").hide();
      $("#reviewBoard").show();
      
      
   }
   
   //소통하기 클릭시
   function clickChat(){
      
      $("#confirmBoard").hide();
      $("#reviewBoard").hide();
      $("#chatBoard").show();
      
   }
   
   
   function paging(currentPage) {
      
      var chg_num = "${chg_num}";
      var user_id_email = "${user_id_email}";
      var masterid = "${master.user_id_email}";
      var user_nickname = "${user_nickname}";
      var user_image = "${user_image}";
      
      /* alert("chg_num!!"+chg_num);
      alert("currentPage!!"+currentPage); */
      
      $.ajax({
            url:"<%=context%>/listConfirm",
            data : {
                  chg_num : chg_num, //보낼변수
                  currentPage : currentPage,
            },
            dataType : 'json', /* json(리스트) text(값1개) xml */
            success : function(data) {
               var jsondata = JSON.stringify(data); 
              console.log(jsondata);
               var jsondata1 = JSON.stringify(data.pg);
               console.log(jsondata1);
               var timefmt = '';
            
               var a = '';
               var b = '';
               var pg = data.pg;
               var photochk = data.photochk;
               var totalCnt = data.totalCnt;
               
        	
         
               
               $.each(photochk, function(key, value) {
                  
                    var upload_timestamp = value.upload_timestamp;
                    /* alert(upload_timestamp.getHours()); */
                    var wow = new Date(upload_timestamp).toLocaleString().slice(0,19);
                   
                    
                    upload_timestamp = new Date(upload_timestamp);
                    timefmt = upload_timestamp.getFullYear()+'-'+(upload_timestamp.getMonth()+1)+'-'+upload_timestamp.getDate()+' '+upload_timestamp.getHours()+':'+upload_timestamp.getMinutes()+':'+upload_timestamp.getSeconds();
                    
      
                      a += "<div class='yyy' style='display: inline-block; text-align: center;' > "
                      a += "<div class='screen' style='margin-right: 6px;' onclick='window.open("+'"photoPop?confirm_image='+value.confirm_image+'","photochk","scrollbars=yes,width=650,height=650,top=10,left=20")'+"'>"; 
                      a += "<div class='top' style='color:white;'>"+value.user_nickname+"<p><img src='../upload/profileIMG/"+value.user_image+"' style='width:70px; height:70px; border-radius:35px;'></div>";
                      a += "<div class='bottom' style='color:white;'>"+timefmt+"</div>"; 
                      a += "<img class='chkImg' src='../upload/confirmPic/"+value.confirm_image+"' ></div>";
                      
                     
            
                  /* 마스터 기준에서 보이는 수락/거절 버튼  */
                  if(user_id_email == masterid){
                     a += "<div>";
                  if(value.confirm_state == 0){
                     a += '<form action="photoConfirm" name="confirm_state1" method="post" style="position: relative; left: -3px;">';
                     a += '<input type="submit" class="photoBtn" style="display: inline-block; text-decoration: none; cursor:pointer;"  name="confirm_state1" value="수락">';
                     a += '<input type="submit" class="photoBtn1" style="display: inline-block; text-decoration: none; margin-left: 6px; cursor:pointer;" name="confirm_state1" value="거절">';
                     a += '<input type="hidden" name="photochk_num" value="'+value.photochk_num+'">';
                     a += '<input type="hidden" name="chg_num" value="'+chg_num+'">';
                     a += '<input type="hidden" name="user_id_email" value="'+user_id_email+'">'; 
                     a += '<input type="hidden" id="user_nickname" name="user_nickname" value="'+user_nickname+'">';
                     a += '<input type="hidden" id="user_image" name="user_image" value="'+user_image+'"></form>';
                  }
                  if(value.confirm_state == 1) {
                     a += '<div class="photoBtn2">수락함</div>';}
                  if(value.confirm_state == 2){
                     a += '<div class="photoBtn3">거절함</div>';}
                  a += '</div>';
                  }
                  
                  if(user_id_email != masterid){
                     if(value.confirm_state == 0) {
                     a += '<div class="photoBtn4">대기중</div>';}
                     if(value.confirm_state == 1) {
                     a += '<div class="photoBtn2">수락함</div>';}
                     if(value.confirm_state == 2) {
                     a += '<div class="photoBtn3">거절함</div>';}
                     
                  }
               
         
                  a += '</div>';

            });
			   
               var startPage = 0;
               var pageBlock =0;
               var endPage =0;
               var totalPage =0;
               
               $(data.pg).each(
                       function(){
                     	  startPage = this.startPage; //등록일
                     	  endPage = this.endPage; //시작일
                          pageBlock = this.pageBlock; //종료일
                          totalPage= this.totalPage; //참여정원
                       }
                       );

             
             	var pageMinus = startPage - pageBlock;
             	var pagePlus = startPage + pageBlock;
             	  
                  if(startPage > pageBlock){
                     b += "<div style='cursor: pointer; display: inline-block;' onclick='paging("+pageMinus+")'>◀</div>";
             
                  }
         
                  for(var i = startPage; i <= endPage; i++){
                     b += "<div style='cursor: pointer; display: inline-block;' onclick='paging("+i+")'>"+i+" </div>";
                  }
      

	               if(endPage < totalPage){
	             	 b += "<div style='cursor: pointer; display: inline-block;' onclick='paging("+pagePlus+")'>▶</div>";
            
         }
               console.log(a);
               console.log(b);
               $('.yyy').remove();
               $('#zzz').append(a);
               $('#Paging').empty();
               $('#Paging').append(b);
             

               
            }
      });
   
   };

   
	// 첨부파일 용량 체크
   function sizeCheck(){

   	var size = document.getElementById("file1").files[0].size;
   	console.log("size : " + size);

   	// 용량 2MB 제한 
   	if(size > 1024 * 1024 * 2){
   		// 용량 초과시 경고후 해당 파일의 용량도 보여줌
   		alert('2MB 이하 파일만 등록 가능하다람 T_T \n\n' + '현재 사진 용량 : ' + (Math.round(size / 1024 / 1024 * 100) / 100) + 'MB');
   		// 올리려 시도했던 파일정보를 날려버림 
   		$("input[id=file1]").val("");
   	}

   	// 체크를 통과했다면 종료
   	else return;
   }

</script>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>

	<div class="out">
	
		<!-- 제목, 모집상태 -->
		<div class="Jalnan" style="font-size: 40px; margin-top: 50px;">${chall.chg_title}</div>
		<!-- 디데이 로직이 들어올 곳 -->
		<div class="tag" id="challState"></div>
		

		<!-- 해시태그 -->
		<c:forEach var="ht2" items="${ht2}">
			<div class="hashtag" style="">#${ht2.hashtag_text}</div>
		</c:forEach>
		<p>

		<!-- 챌린지 소개 -->
		<div class="ChosunGu" style="font-size: 16px; font-weight: bold; color: #4d593e;">${chall.chg_contents}</div>
		<hr id="hr1">

		<!-- 배팅보상률 안내  -->
		<table class="info" style="margin-bottom: 50px;">
			<tr>
				<td class="infotitle">&nbsp;100% 성공</td>
				<td class="infotext">배팅 열매 전액 페이백 + 상금(배팅 열매의 50%지급)</td>
			</tr>
			<tr>
				<td class="infotitle">&nbsp;85%이상 성공</td>
				<td class="infotext">배팅 열매 전액 페이백</td>
			</tr>
			<tr>
				<td class="infotitle">&nbsp;85%미만 성공</td>
				<td class="infotext">배팅 열매의 50% 페이백</td>
			</tr>
			<tr>
				<td colspan="2" style="font-size: 12px; color: #949494; height:30px; position: relative; bottom: -4px; left: -3px;">&nbsp;
				<img src="../jy/img/warning.png" style="width: 15px; height: 15px; vertical-align: bottom;">&nbsp;참가비가 높을수록 받는 열매도 많아져요.</td>
			</tr>
		</table>


		<!-- 챌린지 마스터 프사, 닉네임 -->
		<div style="text-align: center;">
			<img src="../jy/img/crown.png" style="width: 50px; height: 40px; vertical-align: bottom;">
		</div>
		<div style="text-align: center;">
			<img src="../upload/profileIMG/${master.user_image}" style="width: 100px; height: 100px; border-radius: 50px;">
		</div>
		<div
			style="text-align: center; font-family: 'yg-jalnan'; font-size: 25px; color: #000000cf;">${master.user_nickname}</div>
		<div class="join" id="joinChallButton" style="cursor: pointer;" onmouseover="this.style.color='black';" onmouseout="this.style.color='#4d593e';">챌린지 함께하기</div>


		<!-- 챌린지 기간 -->
		<input type="hidden" id="chg_startdate" name="chg_startdate" value="${chall.chg_startdate}">
		<input type="hidden" id="chg_enddate" name="chg_enddate" value="${chall.chg_enddate}">
		<div style="font-family: 'ChosunGu'; font-size: 13px; font-weight: bold; color: gray; text-align: center; margin-bottom: 50px;">챌린지기간 : ${chall.chg_startdate} ~ ${chall.chg_enddate}</div>


		<!-- 챌린지 참여신청서 -->
		<div id="joinChall" style="text-align: center;">
			<table
				style="margin-left: 180px; width: 70%; border: 1px solid palegoldenrod; text-align: center;">
				<tr style="background-color: palegoldenrod;">
					<td colspan="4"
						style="font-family: 'yg-jalnan'; font-size: 21px; color: #515543; text-align: center;">챌린지
						신청서</td>
				</tr>
				<tr>
					<td class="td1part">챌린지 명</td>
					<td class="td2part" colspan="2">${chall.chg_title}</td>
				</tr>
				<tr>
					<td class="td1part">챌린지 기간</td>
					<td class="td2part" id="totDate" colspan="2"></td>
				</tr>
				<tr>
					<td class="td1part">내 보유 열매</td>
					<td class="td3part" colspan="2">
						<img src="../jy/img/dotori.png" style="width: 20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;">
						<fmt:formatNumber value="${point_balance}" pattern="#,###" />&nbsp;열매
					</td>
				</tr>

				<tr>
					<td class="td1part">배팅 할 열매</td>
					<td class="td2part" colspan="2">
						<form name="batting">
							<input type="number" id="batt" name="batt" min="10" max="${point_balance}" step="10" style="border: 2px solid #8080008a; position: relative; top: 6px; border-radius: 5px; width: 250px; line-height: 25px; font-family: 'ChosunGu'; font-size: 15px; text-align: center; font-weight: bold;" placeholder="배팅 할 열매를 기입하세요.">
							<div style="font-size: 11px; color: brown; height: 10px;">※열매는 10단위로 사용가능합니다.</div>
						</form>
					</td>
				</tr>

				<tr>
					<td class="td1part" style="width: 300px;">배팅 후 예상 보유 열매</td>
					<td class="td3part" id="battAfter" style="width: 300px;"
						colspan="2"><img src="../jy/img/dotori.png"
						style="width: 20px; height: 22px; vertical-align: bottom; margin-bottom: 10px;">
						<fmt:formatNumber value="${point_balance}" pattern="#,###" />&nbsp;열매
					</td>
				</tr>

				<tr>
					<td rowspan="3" class="td1part">얻을 수 있는 열매</td>
					<td class="td2_1part">100% 성공</td>
					<td class="td2_2part" id="100"><fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td>
				</tr>
				<tr>
					<td class="td2_1part">85%이상 성공</td>
					<td class="td2_2part" id="85up"><fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td>
				</tr>
				<tr>
					<td class="td2_1part">85%미만 성공</td>
					<td class="td2_2part" id="85down"><fmt:formatNumber value="0" pattern="#,###" />&nbsp;열매</td>
				</tr>
			</table>

			<div style="text-align: center; font-family: 'ChosunGu';">
				<form name="warning" action="insertChallJoinBatt" method="post" onsubmit="return battChk()">
					<div style="color: red; margin: 5px;">※ 신청 후 취소가 불가하며, 챌린지를 포기하더라도 열매는 환급되지 않습니다.</div>
					<div>
						<input type="checkbox" name="agree" onclick="agreeChk(warning)">위의 내용을 충분히 이해했으며, 이에 동의합니다.
					</div>
					<!-- 챌린지 넘버 -->
					<input type="hidden" id="chg_num" name="chg_num" value="${chg_num}">
					<!-- 이메일(아이디) -->
					<input type="hidden" id="user_id_email" name="user_id_email" value="${user_id_email}">
					<!-- 내 보유열매 -->
					<input type="hidden" id="point_balance" name="point_balance" value="${point_balance}">
					<!-- 차감포인트 -->
					<input type="hidden" id="point_minus" name="point_minus" value="">
					<!-- 배팅포인트 -->
					<input type="hidden" id="batting_point" name="batting_point" value="">
					<!-- 챌린지기간 -->
					<input type="hidden" id="chg_days" name="chg_days" value="">
					
<%-- 					<input type="hidden" id="user_nickname" name="user_nickname" value="${user_nickname}"> 
					<input type="hidden" id="user_image" name="user_image" value="${user_image}">  --%>
					<input class="agree" type="submit" name="chkButton" value="확 인" disabled="disabled">
				</form>
			</div>
		</div>


		<!-- 현재 참여인원 수 -->
		<div
			style="margin-left: 65px; height: 50px; position: relative; bottom: -14px;">
			<div class="part">현재&nbsp;</div><div id="totpart">${totpart}</div><div class="part">명 참여중</div>
		</div>
		<hr id="hr2">

		<!-- 참여자 프로필 사진 -->
		<div id="ProfScroll">
			<table>
				<tr style="vertical-align: bottom;">
					<td>
						<div style="width: 125px; display: inline-block;">
							<div style="text-align: center;">
								<img src="../jy/img/crown.png"
									style="width: 40px; height: 30px; vertical-align: bottom;">
							</div>
							<div style="text-align: center;">
								<img src="../upload/profileIMG/${master.user_image}"
									style="width: 70px; height: 70px; border-radius: 35px; object-fit: cover;">
							</div>

							<form action="mypage" style="margin: 0; text-align: center;">
								<input type="hidden" name="page_id_email" value="${master.user_id_email}"> 
								<input type="submit" style="background-color: white; border: none; font-family: 'yg-jalnan'; font-size: 15px; cursor: pointer; color: #000000cf;" value="${master.user_nickname}">
							</form>

						</div>
					</td>
					<c:forEach var="user" items="${user}">
						<td>
							<div style="width: 125px; display: inline-block;">
								<div style="text-align: center;">
									<img src="../upload/profileIMG/${user.user_image}"
										style="width: 70px; height: 70px; border-radius: 35px; object-fit: cover;">
								</div>

								<form action="mypage" style="margin: 0; text-align: center;">
									<input type="hidden" name="page_id_email" value="${user.user_id_email}"> 
									<input type="submit" style="background-color: white; border: none; font-family: 'yg-jalnan'; font-size: 15px; cursor: pointer; color: #000000cf;" value="${user.user_nickname}">
								</form>
							</div>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<hr id="hr3">

		<!-- 도토리바 -->
		<div id="dotoriBar" style="font-family: 'ChosunGu'; font-size: 15px;">
			<table
				style="margin-left: 65px; width: 92%; border: 1px solid #FFEACD; background-color: #FFEACD; text-align: center;">
				<tr>
					<td class="tdDotori" style="background-color: #D8E4A9;">나의 진행현황</td>
					<td>

						<div
							style="width: 100%; height: 45px; background-color: white; position: relative; border-radius: 5px;">
							<div style="width: 98%;">
								<div class="myChgBar" style="float:left; width:${myPercent}% ; background-color: #9E8173; top: 14px; position: relative;">
									<fmt:formatNumber value="${myPercent }" pattern="0'%'"></fmt:formatNumber>
								</div>
							</div>

							<c:if test="${myPercent!=0}">
								<div style="float: left; width: 2%;">
									<img style="width: 35px; left: -15px; position: relative;" src="/pys/img/도토리.png">
								</div>
							</c:if>
						</div> <c:if test="${myPercent==0}">
							<div style="float: left; width: 2%; position: relative;"></div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="tdDotori" style="background-color: #D8E4A9;">챌린지 진행현황</td><td>

						<div
							style="width: 100%; height: 45px; background-color: white; position: relative; border-radius: 5px;">
							<div style="width: 98%; ">
								<div class="myDayBar"
									style="float:left; width:${chgPercent}% ; background-color: #9E8173; top: 14px; position: relative;">
									<fmt:formatNumber value="${chgPercent }" pattern="0'%'"></fmt:formatNumber>
								</div>
							</div>

							<c:if test="${chgPercent!=0}">
								<div style="float: left; width: 2%;">
									<img style="width: 35px; left: -15px; position: relative;"
										src="/pys/img/도토리.png">
								</div>
							</c:if>

						</div> <c:if test="${chgPercent==0}">
							<div style="float: left; width: 2%;"></div>
						</c:if>
					</td>
				</tr>
			</table>
		</div>

		<!-- 오늘의 랜덤문구 -->
		<div id="todayRandom">
			<table
				style="margin-left: 180px; margin-top: 50px; width: 70%; background-color: palegoldenrod; text-align: center;">
				<tr>
					<td
						style="font-family: 'yg-jalnan'; font-size: 21px; color: #515543; text-align: center;">오늘의
						랜덤문구</td>
				</tr>
				<tr
					style="background-color: white; font-family: 'ChosunGu'; line-height: 70px;">
					<td style="font-weight: bold; color: #515543;">${today_phrase }</td>
				</tr>

			</table>
		</div>

		<!-- 챌린지 인증방법 -->
		<div id="confirmSample">
		
				<table
					style="margin-left: 180px; margin-top: 50px; margin-bottom: 50px; background-color: palegoldenrod; width: 70%;">
					<tr>
						<td colspan="2"
							style="font-family: 'yg-jalnan'; font-size: 21px; color: #515543; text-align: center;">챌린지 	인증방법</td>
					</tr>
					<tr style="background-color: white; text-align: center;">
						<td style="background-color: palegoldenrod;"><img
							src="../upload/exIMG/${chall.chg_sample_image}"
							style="width: 200px; height: 200px;"
							onclick="window.open('photoPop?confirm_image=${chall.chg_sample_image}','photochk','scrollbars=yes,width=650,height=650,top=10,left=20');"></td>
						<td
							style="font-family: 'ChosunGu'; color: #515543; font-weight: bold;">${chall.chg_sample_text}</td>
					</tr>
				</table>
		
		</div>



		<!-- 하단메뉴바 -->
		<div class="navDown">
			<nav class="divNav"
				style="width: 1105px; line-height: 50px; background-color: #9E8173; border-radius: 5px; margin-left: 63px; margin-top: 40px;">
				<a id="navReview" class="chgMenuList" onclick="clickReview()"
					onmouseover="this.style.color='black';"
					onmouseout="this.style.color='white';">후기</a> <a id="navConfirm" class="chgMenuList" onclick="clickConfirm()" onmouseover="this.style.color='black';"
					onmouseout="this.style.color='white';">인증게시판</a> <a id="navChat"
					class="chgMenuList" onclick="clickChat()"
					onmouseover="this.style.color='black';"
					onmouseout="this.style.color='white';">소통하기</a>
			</nav>

			<!-- 지예 인증게시판 -->
			<div id="confirmBoard" style="text-align: center; width: 80%; margin-left: 131px;">
				<div style="font-family: 'yg-jalnan'; margin-top: 20px; font-size: 25px;">챌린지 인증</div>


				<form id="form1" action="confirmPicSave" method="post" enctype="multipart/form-data">
					
					<!-- 마스터 아이디거나 참여아이디면 보이기 -->
					<c:if test="${user_id_email == master.user_id_email || myChgState == 1}">
					
						<!-- 오늘 인증안했으면 보이기  -->
						<c:if test="${todayCnt == 0}">
							<input type="file" name="file1" required="required" id="file1" onchange="sizeCheck();" accept="image/png, image/jpeg, image/jpg, image/gif" required="required" />
							<input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/">
							<input type="hidden" name="chg_num" value="${chg_num}">
							<input type="hidden" name="parti_id_email" value="${user_id_email}">
							<input type="hidden" id="user_nickname" name="user_nickname" value="${user_nickname}">
							<input type="hidden" id="user_image" name="user_image" value="${user_image}">
							<input type="submit" class="photoBtn">
						</c:if>
					</c:if>
				</form>


				<div style="text-align: left; margin-left: 12px;">
					<div id="zzz" style="display: inline-block;">
						<c:forEach var="pk" items="${photochk}">

							<div class="yyy" style="display: inline-block; text-align: center;">

								<div class="screen"
									onclick="window.open('photoPop?confirm_image=${pk.confirm_image}','photochk','scrollbars=yes,width=650,height=650,top=10,left=20');">
									<div class="top" style="color: white;">${pk.user_nickname}<p>
											<img src="../upload/profileIMG/${pk.user_image}" style="width: 70px; height: 70px; border-radius: 35px;">
									</div>
									<div class="bottom" style="color: white;">
										<fmt:formatDate value="${pk.upload_timestamp}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
									</div>
									<img class="chkImg" src="../upload/confirmPic/${pk.confirm_image}">
								</div>

								<!-- 마스터 기준에서 보이는 수락/거절 버튼 -->
								<c:if test="${user_id_email == master.user_id_email}">
									<div>
										<c:if test="${pk.confirm_state == 0}">
											<form action="photoConfirm" name="confirm_state1" method="post">
												<input type="submit" class="photoBtn"
													style="display: inline-block; text-decoration: none; cursor: pointer;" name="confirm_state1" value="수락"> 
													<input type="submit" class="photoBtn1" style="display: inline-block; text-decoration: none; cursor: pointer;" name="confirm_state1" value="거절"> 
													<input type="hidden" name="photochk_num" value="${pk.photochk_num}"> 
													<input type="hidden" name="chg_num" value="${chg_num}"> 
													<input type="hidden" name="user_id_email" value="${pk.parti_id_email}">
											</form>
										</c:if>
										<c:if test="${pk.confirm_state == 1}">
											<div class="photoBtn2">수락함</div>
										</c:if>
										<c:if test="${pk.confirm_state == 2}">
											<div class="photoBtn3">거절함</div>
										</c:if>
									</div>
								</c:if>

								<!-- 마스터 외 유저에게 보이는 상태버튼 -->
								<c:if test="${user_id_email != master.user_id_email}">
									<c:if test="${pk.confirm_state == 0}">
										<div class="photoBtn4">대기중</div>
									</c:if>
									<c:if test="${pk.confirm_state == 1}">
										<div class="photoBtn2">수락함</div>
									</c:if>
									<c:if test="${pk.confirm_state == 2}">
										<div class="photoBtn3">거절함</div>
									</c:if>
								</c:if>

							</div>
						</c:forEach>
					</div>

				</div>


				<div id="Paging">
					<c:if test="${pg.startPage > pg.pageBlock}">
						<div style="cursor: pointer; display: inline-block;" onclick="paging(${pg.startPage-pg.pageBlock})">◀</div>
					</c:if>
					<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
						<div id="currentPage" onclick="paging(${i})">${i}</div>
					</c:forEach>
	
					<c:if test="${pg.endPage < pg.totalPage}">
						<div style="cursor: pointer; display: inline-block;" onclick="paging(${pg.startPage+pg.pageBlock})">▶</div>
					</c:if>
				</div>
			</div>



			<!-- 경민 소통하기 시작 -->
			<div id="chatBoard" style="position: relative; bottom: -50px;">
				<div id="padIcon"></div>
				<!-- padicon -->
				<div id="pad">
					<div id="padMid">
						<div id="padIn">
							<div id="topComm">소통하기(${countChat})</div>
							<div id="chatScroll">
								<div>
									<div id="chatBox">
										<c:forEach var="ccb" items="${chgChatBox }" varStatus="status">
											<c:if test="${ccb.chat_id_email != user_id_email }">
												<div class="chattr" style="vertical-align: top;">
													<div style="padding-top: 10px;">

														<!-- 남이 쓴 채팅 -->
														<div class="chatForm_others">
															<div class="chatUser_image">
																<img src="../upload/profileIMG/${ccb.user_image }"
																	style="width: 70px; height: 70px; border-radius: 35px;">
															</div>
															<div style="display: inline-block;">
																<div class="nickname">${ccb.user_nickname }</div>
																<div style="display: inline-block;"></div>
																<div class="text">&nbsp;&nbsp;${ccb.chat_contents }&nbsp;&nbsp;</div>
																<div class="time">
																	<fmt:formatDate value="${ccb.chat_timestamp }"
																		type="time" timeStyle="short" />
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:if>

											<!-- 내가 쓴 채팅 -->

											<c:if test="${ccb.chat_id_email == user_id_email }">
												<div class="chattr1" style="vertical-align: top;">
													<div style="padding-top: 10px;">
														<div class="chatForm_mine">


															<div class="time_mine" style="display: inline-block;">
																<fmt:formatDate value="${ccb.chat_timestamp }"
																	type="time" timeStyle="short" />
															</div>
															<div class="text_mine" style="display: inline-block;">&nbsp;&nbsp;${ccb.chat_contents }&nbsp;&nbsp;</div>


														</div>
													</div>
												</div>
											</c:if>




										</c:forEach>

									</div>
								</div>
							</div>
							<!-- chatScroll -->
							<div class="chatWriteForm">
								<form id="chatForm" action="insertChat">
									<input type="hidden" name="chat_id_email"
										value="${user_id_email}"> <input type="hidden"
										name="chg_num" value="${chg_num}"> <input type="text"
										name="chat_contents" id="msg"> <input type="submit"
										id="send" value="전송">
								</form>
							</div>
						</div>
						<!-- padIn -->
					</div>
					<!-- padMid -->
				</div>
				<!-- pad테두리 -->
				<div id="padIcon2"></div>
			</div>
			<!-- 경민 소통하기 끝 -->


			<!-- 경민 후기 -->
			<div id="reviewBoard">

				<div class="reviewWriteForm">
					<div
						style="font-family: 'yg-jalnan'; font-size: 25px; margin-bottom: 20px;">챌린지
						참가 후기(${countReview})</div>
					<div class="reviewForm">
						<form id="reviewForm" action="updateReview">

							<div class="rating-css">
								<div class="star-icon">
									<input type="radio" name="review_score" id="rating1" value="1">
									<label for="rating1" class="fa fa-star"></label> <input
										type="radio" name="review_score" id="rating2" value="2">
									<label for="rating2" class="fa fa-star"></label> <input
										type="radio" name="review_score" id="rating3" value="3"
										checked> <label for="rating3" class="fa fa-star"></label>
									<input type="radio" name="review_score" id="rating4" value="4">
									<label for="rating4" class="fa fa-star"></label> <input
										type="radio" name="review_score" id="rating5" value="5">
									<label for="rating5" class="fa fa-star"></label>
								</div>
							</div>
							<br> <input type="hidden" name="chg_num" value="${chg_num }">
							<input type="hidden" name="user_id_email"
								value="${user_id_email}">

							<textarea name="review_contents"
								style="margin-top: 15px; width: 986px; height: 120px; padding: 10px;">
         
         					</textarea>
							<input type="submit" id="reviewsend" value="후기남기기">

						</form>
					</div>
				</div>
				<div id="reviewScroll" style="overflow: auto;">
					<table id="reviewBox">
						<c:forEach var="crb" items="${chgReviewBox }" varStatus="status">
							<tr>
								<td>
									<div class="reviewForm_others">
										<div class="reviewUser_image">
											<img src="../upload/profileIMG/${crb.user_image }"
												style="width: 70px; height: 70px; border-radius: 35px;">
										</div>
										<div style="display: inline-block;">
											<div class="nickname">${crb.user_nickname }</div>
											<div class="starScore">
												<c:if test="${crb.review_score ==1}">
													<span class="fa fa-star"></span>
												</c:if>
												<c:if test="${crb.review_score ==2}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</c:if>
												<c:if test="${crb.review_score ==3}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</c:if>
												<c:if test="${crb.review_score ==4}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</c:if>
												<c:if test="${crb.review_score ==5}">
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
													<span class="fa fa-star"></span>
												</c:if>
											</div>
										</div>
										<div style="display: inline-block;">
											<div class="time1">
												<fmt:formatDate value="${crb.review_timestamp }" type="date"
													timeStyle="short" />
											</div>
										</div>
										<div class="reviewText">&nbsp;&nbsp;${crb.review_contents }&nbsp;&nbsp;</div>


									</div>
							</tr>
						</c:forEach>

					</table>

				</div>

			</div>
			<!-- 경민 후기 끝 -->
		</div>




	</div>
	<!-- out div 끝 -->

	<div>
		<%@ include file="/WEB-INF/views/teamtwo/footer.jsp"%>
	</div>


</body>
</html>