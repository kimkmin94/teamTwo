<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
     
	     var categorystr1 ="";
	     var categorystr2 ="";
	     var categorystr3 ="";
	     var category_backstr ="";	     
	     
		 var now = new Date().getTime();    
     $(window).ready(function() { // main이 실행될때
    	 var arr = new Array();        		
         <c:forEach var="titleName" items="${chatbotList}">
                    arr.push({
                    	name:"${titleName.chg_title}"
                    });
         </c:forEach>           
         //alert('arr1 => ' + arr);
         $.each(arr, function(index, item) { // 챌린지제목 길이 자르기용   		
        	 var result = "";
        	 var cutlength = 15;
        	 var machim = "..";
        	 if(item.name.length > cutlength){
        		   result += item.name.substr(0,cutlength)+machim;    		   
        	 }else{
        		  result += item.name;
        	 }        	       	
        	 $('#titleCut'+index).html(result);        	       	 
    	}); 
          
         var arr2 = new Array();
         
         <c:forEach var="timeChg_num" items="${chatbotList}">
                     arr2.push({
                    	 chg_num_dumi:"${timeChg_num.chg_num}" 
                     });
         </c:forEach>
         
         //alert('arr2 =>'+arr2);
         
         var chg_regdate = "";
         var chg_startdate = "";
         var chg_enddate = "";
         var chg_capacity = "";
         var chg_now_parti = "";
         
         $.each(arr2,function(index2, item2) {
			   
        	// alert('chg_num =>' + item2.chg_num_dumi);
        	 
        	 $.ajax({
        		 url:"getChgTimeChk",
        		 data:{chg_num : item2.chg_num_dumi},
        		 dataType:'json',
        		 success : function(data){
        			 //var jsondata = JSON.stringify(data);
    				 //alert('jsondata=>'+jsondata);
    				 $(data).each(
    							function(){
    									
    								chg_regdate = this.chg_regdate;
    			        			chg_startdate = this.chg_startdate;
    			        			chg_enddate = this.chg_enddate;
    			        			chg_capacity = this.chg_capacity;
    			        			chg_now_parti = this.chg_now_parti;
    								
    			        			var wj_chg_startdate = new Date(chg_startdate);
    			    	        	 var wj_chg_regdate = new Date(chg_regdate);
    			    	        	 var wj_chg_enddate = new Date(chg_enddate);
    			        			
    			    	        	 wj_chg_regdate = new Date(wj_chg_regdate.getFullYear(), wj_chg_regdate.getMonth(), wj_chg_regdate.getDate());
     			    	        	wj_chg_startdate = new Date(wj_chg_startdate.getFullYear(), wj_chg_startdate.getMonth(), wj_chg_startdate.getDate());
     			    	        	wj_chg_enddate = new Date(wj_chg_enddate.getFullYear(), wj_chg_enddate.getMonth(), wj_chg_enddate.getDate());
     			    	        	 
      			    	        	 var str_regdate = new Date(chg_regdate).toISOString().slice(0,10); //등록일
      			    	             var str_startdate = new Date(chg_startdate).toISOString().slice(0,10); //시작일
      			    	             var str_enddate = new Date(chg_enddate).toISOString().slice(0,10); //종료일
      			    	             var str_now = new Date(now).toISOString().slice(0,10); //오늘 
    			    	        	
    			    	        	
      			    	           
        			   		      	     
        			   		      	   	 if(str_startdate <= str_now){
        			   		                                    
        			   		           		 if(str_enddate <= str_now){
        			   		           		         newtimeResult = "챌린지종료";
        			   		           		        $('#chatbotListTime'+index2).append("챌린지종료");
        			   		          		   }else{
        			   			          			var distance = now - wj_chg_startdate; //진행중
        			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        			   			          			//alert('distance => ' + distance);
        			   			          			//alert('distance => ' + days);
        			   			    	             $('#chatbotListTime'+index2).append("진행중 D+"+days);	   			    	        	 
        			   		        				}
        			   		           		 
      	   					   		        }else if(str_startdate == str_now){
      	   					   		                  $('#chatbotListTime'+index2).append("D-DAY");
      	   					   		      			}else{
      	   					   		      				
      				   					   		      		if(chg_now_parti >= chg_capacity){
      				   					   		      	$('#chatbotListTime'+index2).append("인원마감");
      				   					   		            }else{
      				   					   		      		var distance = now - wj_chg_startdate; //모집중
      				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      				   					   		            //alert('distance => ' + distance);
      						   			          			//alert('distance => ' + days);
      				   					   		   $('#chatbotListTime'+index2).append("모집중 D"+days);
      				   					   		       	  } 
      	   					   		      				
      	   					   		      			}
        					   		     
    			        		
    			    	       
     			    	        	 
    			    	        	
    			    	        	
    			    	        	   								
    							}
    							
    							//alert('chg_regdate =>' + chg_regdate);
    						 );
        		//	 alert('data 넘어온 값 :' + this.chg_sample_text);
        		//	 alert('data 넘어온 값 :' + this.chg_regdate);
        		 }
        	 });
		}); 
	});
     var strLcText = "";
     var strMcText = "";
     var strScText = "";
     
     function statusChange(statusItem){
    	 strLcText = $(statusItem).text();
    	 var ataGBack = "<a class='buttonCategory_back' onclick='getCategory_Back()'>🠔 대분류 다시 선택</a>";
  	    $('#btaglc_num').html(strLcText);
  	    $('#btaglc_num_arrowsO').html(">");
  	    $('#btaglc_num_arrowsT').html(">");
  	    $('#Category_text').empty();
	    $('#Category_text').html("중분류를 선택하세요.");
	    $('.backCategory').append(ataGBack);
     }
     
     function statusMcChange(statusItem){
    	 strMcText = $(statusItem).text();
    	 var ataGBack = "<a class='buttonCategory_back' onclick='getCategory_Back()'>🠔 중분류 다시 선택</a>";
   	    $('#btagmc_num').html(strMcText);
   	    $('#btagmc_num_arrowsO').html(">");
	    $('#btagmc_num_arrowsT').html(">");
	    $('#Category_text').empty();
	    $('#Category_text').html("소분류를 선택하세요.");
	    $('.backCategory').empty();
	    $('.backCategory').append(ataGBack);
     }
     
     function statusScChange(statusItem){
    	 strScText = $(statusItem).text();
    	 var ataGBack = "<a class='buttonCategory_back' onclick='getCategory_Back()'>🠔 소분류 다시 선택</a>";
   	     $('#btagsc_num').html(strScText);
 	     $('#Category_text').empty();
 	    
 	     $('.backCategory').empty();
	     $('.backCategory').append(ataGBack);
     }
     
     
     function getCategoryLc_num(Vlc_num) { //대분류 선택했을때
		categorystr1 = "";
    	//alert('getCategoryLc_num =>' + Vlc_num);
    	$('#categorylc_num').val(Vlc_num);
	    var textColor = "";
    	if(Vlc_num == 10){
	    	textColor += "#FBF1EB";
	    }
    	if(Vlc_num == 20){
	    	textColor += "#F7FCE0";
	    }
    	if(Vlc_num == 30){
	    	textColor += "#DEEBF7";
	    }
    	if(Vlc_num == 40){
	    	textColor += "#F2F2F2";
	    }
		$.ajax({
			  url:"getCategoryLcNum",
			  data:{lc_num : Vlc_num},
			  dataType:'json',
			  success:function(data){
				   //$('div').remove('.divCategory_menu');
				   $('div.divCategory_menu').empty();
					// var jsondata = JSON.stringify(data);
					// alert('jsondata=>'+jsondata);	
 				  $(data).each(
					 function() {
						 var potoText ="";
						 if(this.subject == "식단/영양"){
							 potoText +="10_eating";
						 }
						 if(this.subject == "운동"){
							 potoText +="pitness";
						 }
						 if(this.subject == "외국어"){
							 potoText +="20_translate";
						 }
						 if(this.subject == "IT/컴퓨터"){
							 potoText +="20_cogwheel";
						 }
						 if(this.subject == "독서"){
							 potoText +="20_read";
						 }
						 if(this.subject == "돈관리"){
							 potoText +="20_management";
						 }
						 if(this.subject == "습관형성"){
							 potoText +="20_books";
						 }
						 if(this.subject == "고시/수험/자격증"){
							 potoText +="20_exam";
						 }
						 if(this.subject == "휴식"){
							 potoText +="30_relaxing";
						 }
						 if(this.subject == "관계"){
							 potoText +="30_networking";
						 }
						 if(this.subject == "반려동물"){
							 potoText +="30_pets";
						 }
						 if(this.subject == "게임"){
							 potoText +="40_gamepad";
						 }
						 if(this.subject == "핸드크래프트"){
							 potoText +="40_handcraft";
						 }
						 if(this.subject == "음악/미술"){
							 potoText +="40_gallery";
						 }
						 if(this.subject == "요리"){
							 potoText +="40_cooking";
						 }
						 if(this.subject == "기타"){
							 potoText +="10_1_dot";
						 }
						 categorystr1 += "<button class='divLcnum_css' onclick='getCategoryMc_num("+Vlc_num+","+ this.mc_num +"); statusMcChange(this); ' style='background-color: "+textColor+";'   >";
						 categorystr1 += "<img alt='' src='../wj/img/"+potoText+".png' width='60px;' height='60px;' style='border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>";
						 categorystr1 += this.subject;
						 categorystr1 += "</div>";
						 categorystr1 += "</button>";						 
					}	  				  				  
				  );
				  $('#category_menu').append(categorystr1);

 		       }
		});
	}
     
     
     function getCategoryMc_num(Vlc_num,Vmc_num) { // 중분류 선택햇을때
 		categorystr2 = "";
     	//alert('getCategoryLc_num =>' + Vmc_num);
     	$('#categorymc_num').val(Vmc_num);
     	var textColor = "";
    	if(Vlc_num == 10){
	    	textColor += "#FBF1EB";
	    }
    	if(Vlc_num == 20){
	    	textColor += "#F7FCE0";
	    }
    	if(Vlc_num == 30){
	    	textColor += "#DEEBF7";
	    }
    	if(Vlc_num == 40){
	    	textColor += "#F2F2F2";
	    }
 		$.ajax({
 			  url:"getCategoryMcNum",
 			  data:{lc_num : Vlc_num, mc_num : Vmc_num},
 			  dataType:'json',
 			  success:function(data){
 				   //$('div').remove('.divCategory_menu');
 				   $('div.divCategory_menu').empty();
 					// var jsondata = JSON.stringify(data);
 					// alert('jsondata=>'+jsondata);	
  				  $(data).each(
 					 function() {
 						 var potoText ="";
 						 if(this.subject == "식단관리"){
 							 potoText += "10_1_diet";
 						 }
 						  if(this.subject == "영양제"){
 							 potoText += "10_1_vial";
						 }
 						  if(this.subject == "물 마시기"){
 							 potoText += "10_1_drink";
						 }
 						 if(this.subject == "기타"){
 							potoText += "10_1_dot";
						 }
 						 if(this.subject == "웨이트"){
 							potoText += "10_2_training";
						 }
 						 if(this.subject == "요가/필라테스"){
 							potoText += "10_2_lotus";
						 }
 						 if(this.subject == "러닝"){
 							potoText += "10_2_running";
						 }
 						 if(this.subject == "홈트레이닝"){
 							potoText += "10_2_workout";
						 }
 						 if(this.subject == "회화"){
 							potoText += "20_1_chat";
						 }
 						 if(this.subject == "시험준비"){
 							potoText += "20_1_exam";
						 }
 						 if(this.subject == "작문"){
 							potoText += "20_1_document";
						 }
 						if(this.subject == "듣기"){
 							potoText += "20_1_listening";
						 }
 						if(this.subject == "독해"){
 							potoText += "20_1_reading";
						 }
 						if(this.subject == "코딩"){
 							potoText += "20_2_data";
						 }
 						if(this.subject == "사진/영상"){
 							potoText += "20_2_photo";
						 }
 						if(this.subject == "소설"){
 							potoText += "20_3_book";
						 }
 						if(this.subject == "수필/에세이"){
 							potoText += "20_3_notes";
						 }
 						if(this.subject == "시집"){
 							potoText += "20_3_poem";
						 }
 						if(this.subject == "자기계발서"){
 							potoText += "20_3_self";
						 }
 						if(this.subject == "절약"){
 							potoText += "20_4_investment";
						 }
 						if(this.subject == "저축"){
 							potoText += "20_4_piggy-bank";
						 }
 						if(this.subject == "경제공부"){
 							potoText += "20_4_economic";
						 }
 						if(this.subject == "습관형성"){
							 potoText +="20_books";
						 }
 						if(this.subject == "고시"){
							 potoText +="20_5_test";
						 }
 						if(this.subject == "수험"){
							 potoText +="20_5_exam";
						 }
 						if(this.subject == "자격증"){
							 potoText +="20_5_certificate";
						 }
 						if(this.subject == "명상"){
							 potoText +="30_1_meditation";
						 }
 						if(this.subject == "수면"){
							 potoText +="30_1_sleep";
						 }
 						if(this.subject == "음악 감상"){
							 potoText +="30_1_romantic-music";
						 }
 						if(this.subject == "영화 감상"){
							 potoText +="30_1_watch-movie";
						 }
 						if(this.subject == "가족"){
							 potoText +="30_2_family";
						 }
 						if(this.subject == "연인/친구"){
							 potoText +="30_2_love";
						 }
 						if(this.subject == "동료"){
							 potoText +="30_2_colleagues";
						 }
 						if(this.subject == "봉사활동"){
							 potoText +="30_2_volunteer";
						 }
 						if(this.subject == "강아지"){
							 potoText +="30_3_dog";
						 }
 						if(this.subject == "고양이"){
							 potoText +="30_3_cat";
						 }
 						if(this.subject == "물고기"){
							 potoText +="30_3_fish";
						 }
 						if(this.subject == "반려식물"){
							 potoText +="30_3_plant";
						 }
 						if(this.subject == "컴퓨터게임"){
							 potoText +="40_1_videogame";
						 }
 						if(this.subject == "보드게임"){
							 potoText +="40_1_confrontation";
						 }
 						if(this.subject == "콘솔게임"){
							 potoText +="40_1_game-console";
						 }
 						if(this.subject == "모바일게임"){
							 potoText +="40_1_mobile";
						 }
 						if(this.subject == "에세이"){
 							potoText += "20_3_notes";
						 }
 						if(this.subject == "시"){
 							potoText += "20_3_poem";
						 }
 						if(this.subject == "자기계발"){
 							potoText += "20_3_self";
						 }
 						if(this.subject == "핸드크래프트"){
							 potoText +="40_handcraft";
						 }
 						if(this.subject == "악기"){
 							potoText += "40_4_viola";
						 }
 						if(this.subject == "노래"){
 							potoText += "40_4_singing";
						 }
 						if(this.subject == "그림그리기"){
 							potoText += "40_4_paint-palette";
						 }
 						if(this.subject == "음식"){
 							potoText += "40_5_rice";
						 }
 						if(this.subject == "베이킹"){
 							potoText += "40_5_bread";
						 }
 						if(this.subject == "커피/주류"){
 							potoText += "40_5_coffee";
						 }
 						 categorystr2 += "<button class='divLcnum_css' onclick='getCategorysc_num("+Vlc_num+","+ Vmc_num +","+ this.sc_num +"); statusScChange(this); ' style='background-color: "+textColor+";' >";
 						 categorystr2 += "<img alt='' src='../wj/img/"+potoText+".png' width='60px;' height='60px;' style='border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>";
						 categorystr2 += this.subject;
						 categorystr2 += "</div>";
 						 categorystr2 += "</button>";						 
 					}	  				  				  
 				  );
 				  $('#category_menu').append(categorystr2);
               
  		       }
 		});
 	} 
     
     
     function getCategorysc_num(Vlc_num,Vmc_num,Vsc_num) { //소분류 선택했을때
    	 categorystr3 = "";
    	 var textColor = "";
     	if(Vlc_num == 10){
 	    	textColor += "#FBF1EB";
 	    }
     	if(Vlc_num == 20){
 	    	textColor += "#F7FCE0";
 	    }
     	if(Vlc_num == 30){
 	    	textColor += "#DEEBF7";
 	    }
     	if(Vlc_num == 40){
 	    	textColor += "#F2F2F2";
 	    }
    	 $('#categorysc_num').val(Vsc_num);
  	     $('div.divCategory_menu').empty();
  	     $('#category_menu').css('background-color',textColor);
  	     categorystr3 += "<div class='divCategoryClick_LastFont'>";
  	     categorystr3 += "<b style='color:#5f5f5f;'>분류 </b>";
  	     categorystr3 += "<b style='color:#5f5f5f;'>선택 완료!</b>";
  	     categorystr3 += "</div>";
  	     categorystr3 += "<div class='submitCategory'>";
  	     categorystr3 += "<button type='submit' class='buttonCategory_search' form='category_search' style='background-color: "+textColor+";'>조회 하기</button>";
  	     categorystr3 += "</div>";
        
  	     $('#category_menu').append(categorystr3);   
	}
       
	    function getCategory_Back() { // 카테고리 뒤로가기 로직
			var lc_num_value = $('#categorylc_num').val();
			var mc_num_value = $('#categorymc_num').val();
			var sc_num_value = $('#categorysc_num').val();
			category_backstr ="";
			//alert('lc_num => ' + lc_num_value);
			//alert('mc_num => ' + mc_num_value);
			//console.log('sc_num => ' + sc_num_value);
			//alert('sc_num =>' + sc_num_value);
			//alert('sc_num_value.length->' + sc_num_value.length);
			if(sc_num_value === null || sc_num_value.length == 0){
				  // alert('sc_num은 널');
					   if(mc_num_value === null || mc_num_value.length == 0){
						    
							   if(lc_num_value === null || lc_num_value.length == 0){
								     alert('뒤로갈수없습니다.');   
							   }else{
								   $('#categorylc_num').val(null);
							 	   $('#btaglc_num').html(null);
							 	   $('#btaglc_num_arrowsO').html(null);
							 	   $('#btaglc_num_arrowsT').html(null);
							 	  $('div.divCategory_menu').empty();
							 	  $('#Category_text').empty();
	                              $('#Category_text').html("대분류를 선택하세요.");
	                      	      $('.backCategory').empty();
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(10); statusChange(this); ' style='background-color: #FBF1EB;'  ><img alt='' src='../wj/img/pitness.png' width='60px;' height='60px;' style=' border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>건강/피트니스</div></button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(20); statusChange(this);' style='background-color: #F7FCE0;'><img alt='' src='../wj/img/studys.png' width='60px;' height='60px;' style=' border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>학습/자기계발</div></button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(30); statusChange(this);' style='background-color: #DEEBF7;'><img alt='' src='../wj/img/cross.png' width='60px;' height='60px;' style=' border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>소셜/힐링</div></button>";
							 	  category_backstr += "<button type='button' class='divLcnum_css' onclick='getCategoryLc_num(40); statusChange(this);' style='background-color: #F2F2F2;'><img alt='' src='../wj/img/rest.png' width='60px;' height='60px;' style=' border-radius: 70%; position: absolute; right: 35px;'><div style='margin-top: 25px;'>취미/기타</div></button>";
							      
							 	 $('#category_menu').append(category_backstr);
							   }
					   }else{
						   $('#categorymc_num').val(null);
					 	      $('#btagmc_num').html(null);
					 	      $('#btagmc_num_arrowsO').html(null);
					 	      $('#btagmc_num_arrowsT').html(null);
                              $('#Category_text').empty();
                              $('#Category_text').html("중분류를 선택하세요.");
                              var ataGBack = "<a class='buttonCategory_back' onclick='getCategory_Back()'>🠔 대분류 다시 선택</a>";
                      	      $('.backCategory').empty();
                     	      $('.backCategory').append(ataGBack);
						   getCategoryLc_num(lc_num_value);
					   }
			}else {
				//alert('sc_num은 널이아님');
				  $('#categorysc_num').val(null);
		 	      $('#btagsc_num').html(null);
                  $('#Category_text').html("소분류를 선택하세요.");
    
                  var ataGBack = "<a class='buttonCategory_back' onclick='getCategory_Back()'>🠔 중분류 다시 선택</a>";
          	     $('.backCategory').empty();
         	     $('.backCategory').append(ataGBack);
         	     $('#category_menu').css('background-color','white');
				getCategoryMc_num(lc_num_value,mc_num_value);				
			}	    	
		}
	    
	    function checking() { // from 태그 보내기전에 null값인 애들 0으로 바꿈
			if(fr_ca.sc_num.value.length == 0){
				 $('#categorysc_num').val(0);
			}
			if(fr_ca.mc_num.value.length == 0){
				 $('#categorymc_num').val(0);
			}
			if(fr_ca.lc_num.value.length == 0){
				 alert('선택하고 검색해주세요.');
				 return false;
			}
			return true;
		}
</script>
<style type="text/css">
 
 a:link{color:black;  text-decoration: none;}
 a:visited{color:black;  text-decoration: none;}
 a:hover{color:black;  text-decoration: none;}
 
 
      .divsearch {
    /*  margin-left: 400px; */
     width:830px;
     height:300px;
     background-color: #fcf0c9;
     background-image: url("../wj/img/searchBackground.png");
     background-repeat: no-repeat;
     background-size: cover;
 }
 
 .divWantChallengeSearch{
     margin-top: 80px;
     margin-left:170px;
     text-align:center;
     padding-top:80px;
     width: 500px;
     height: 40px;
     font-size:30px;
     font-family: 'yg-jalnan';
     color:black;
 }
 
 .divWantChallengeSearchBu{
     width: 200px;
     height: 20px;
     margin-left:340px;
     text-align:center;
     font-size:18px;
     border:2px black;
     font-family: 'ChosunGu';
     font-weight: bold;
     color:#9f6e54;
 }
 
 .search{
    display: inline-block;
    margin-top: 35px;
 }
 
 input::-webkit-input-placeholder{ 
      text-align: center;
      color:#d3d3d3;
      font-size: 22px;
 }
 
 .aMoretag{
   color:#9f6e54;
   font-size:10px;
   font-family: 'ChosunGu';
 }
 
 .divLoveChallenge{
    /* margin-left: 400px; */
    width:830px;
    border-radius: 3px;
 }
 
 .divLoveChallengeBasicImg{
     display: inline-block;
     vertical-align: bottom;
     width:30px;
     margin-top:5px;
     border-radius: 3px;
     border:1px bold black;
     height: 30px;
 }
 
 .divLoveChallengeFont{
    display:inline-block;
    vertical-align:top;
    font-size: 25px;
    height:25px;
    font-family: 'yg-jalnan';
 }
 
 .divLoveChallengeList{
/*     margin-left: 400px; */
    width:830px;
 }
 
 .divChatbotListBase{
    display:inline-block;
    vertical-align : top;
    width: 250px;
    height: 300px;
    margin-top : 20px;
    margin-right: 16.5px;
 }
 
 .divChatbotListImg{
    position: relative;
    vertical-align: top;
    width:  249px;
    height: 180px;
 }
 
 .chatbotUser_count{
    
    position: absolute;
    width:70px;
    height: 25px;
    background-color: black;
    border-radius: 30px;
    top: 10px;
    right: 10px;
 }
 
 .divChatbotUser_count_img{
    margin-top:2.5px;
    margin-left:6px;
    display:inline-block;
    width:20px; 
    height:20px;
 }
 
 .chatbotUser_count_img{
    width:20px; 
    height:20px;
    
 }
 
 .divChatbotUser_count{
     display: inline-block;
     vertical-align:top;
     padding-top:5.5px;
     width: 30px;
     height: 25px;
     color: white;
    font-family: 'ChosunGu';
    font-size: 15px;
 }
 
 .divChatbotListTitle{
    width: 249px;
    height: 30px;
    text-align : left;
    margin-left: 4px;
 }
 
 .divChatbotListTitleFont{
   font-family:'ChosunGu';
   font-weight:bold;
    font-size:16px;
 }
 
  .divChatbotListImgsize{
     width: 249px;
     height: 180px;
     border-radius: 10px;
  }
  
  .chatbotListTimeFont{
      margin-left : 4px;
      text-align : left;
      font-size: 12px;
      margin-top:6px;
      margin-bottom:6px;
      font-family: 'ChosunGu';
      font-weight:bold;
      color:#808080;
  }
 
 .divHashtag{
     display: inline-block;
     margin-left:7px;
     width: 70px;
     height: 20px;
     font-size: 12px;
     background-color: #e2e2e2;
     padding-top : 10px;
     text-align: center;
     font-family: 'ChosunGu';
     color: #808080;
     font-weight: bold;
 }
 
 .divCategory{
   /*  margin-left: 400px; */
    width:830px;
 }
 
 .divCategoryBasicImg{
     display: inline-block;
     vertical-align: bottom;
     width:30px;
     margin-top:5px;
     height: 30px;
 }
 
 .divCategoryFont{
    display:inline-block;
    vertical-align:top;
    font-size: 25px;
    height:25px;
    font-family: 'yg-jalnan';
 }
 
 .Category_plus{
    /*  margin-left: 400px; */
     padding-bottom:40px;
     width: 830px;    
     border-radius:10px;
     border:1px solid black;
     border-color: #f7ceb6;
 }
 
 .choiceCategory_this{
    width:830px;
    margin-left: 20px;
    margin-top: 20px;
    margin-bottom: 40px;
 }
 
 .choiceCategory_thisFont{
    display:inline-block;
    font-size: 18px;
    font-family: 'yg-jalnan';
 }
 
 .divCategory_menu{
    width:780px;
    margin-left: 20px;
 }
 
 .divLcnum_css{
    display: inline-block;
    vertical-align: top;
    width:130px;
    height:130px;
    margin-bottom: 20px;
    margin-right: 20px;
    border-radius: 70%;
    font-family: 'ChosunGu';
    font-weight:bold;
    font-size: 12px;
    background-color: #f6f6f6;
    text-align: center;
    line-height: 100px;
    border: 0;
    outline: none;
    position: relative;
    padding-top: 10px;
 }
 
 
 .divCategory_choice{
    width:830px;
    font-family: 'ChosunGu';
    font-weight:bold;
    padding-bottom:40px;
    font-size: 15px;
 }
 
 .divCategoryClick_LastFont{
    display:inline-block;
    width: 400px;
    height:70px;
    margin-top: 50px;
    margin-left:50px;
    font-family: 'ChosunGu';
    font-weight:bold;
    font-size: 20px;
 }
 
 .divLastFont{
    display: inline-block;
 }
 
 .buttonCategory_back{
    width: 100px;
    height: 30px;
    font-family: 'ChosunGu';
    font-weight:bold;
    font-size: 15px;
    color: #808080;
    margin-left: 30px;
 }
 
 .buttonCategory_search{
    width: 200px;
    height: 40px;
    border-radius:30px;
    background-color:white;
    font-family: 'ChosunGu';
    font-weight:bold;
    font-size: 20px;
    border: 0;
    outline: none;
 }
 
 .submitCategory{
     display:inline-block;
     margin-left:60px;
     width: 130px;
     height: 30px;
 }
 
 .divPointandLikeTop3{
    /* margin-left: 400px; */
    width:830px;
 }
 
 .divPointBox{
     width: 350px;
     height: 200px;
     margin-top: 10px;
 }
 
 .divPointRankTle{
     width: 350px;
     height: 40px;
 }
 
 .divPointRankImg{
     display: inline-block;
     width: 40px;
     height: 40px;
 }
 
 .divPointRankNick{
     display: inline-block;
     vertical-align:top;
     width: 180px;
     height: 30px;
     font-family: 'ChosunGu';
    font-weight:bold;
    padding-top: 10px;
    font-size: 12px;
 }
 
 .divPointBlance{
     display: inline-block;
     vertical-align:top;
     width: 108px;
     height: 30px;
     font-family: 'ChosunGu';
     font-weight:bold;
     padding-top: 10px;
     font-size: 12px;
 }
 
 .divPointRankTop3{
    display: inline-block;
    vertical-align:top;
    width: 350px;
    height: 200px;
 }
 
 .divLikeTop3{
    display: inline-block;
    vertical-align:top;
    width: 350px;
    height: 200px;
    margin-left: 90px;
 }
 
 .divPointRankTop3BasicImg{
     display: inline-block;
     vertical-align: bottom;
     width:30px;
     margin-top:5px;
     height: 30px;
 } 
 .divPointRankTop3Font{
    display:inline-block;
    vertical-align:top;
    font-size: 25px;
    height:25px;
    font-family: 'yg-jalnan';
 }
 
 .divPointRankTop3more{
    display:inline-block;
    width:50px;
    margin-left:20px;
    font-size: 15px;
    color: #d3d3d3;
 }
 
 .divLikeTop3BasicImg{
     display: inline-block;
     vertical-align: bottom;
     width:30px;
     margin-top:5px;
     height: 30px;
 }
 
 .divLikeTop3Font{
    display:inline-block;
    vertical-align:top;
    font-size: 25px;
    height:25px;
    margin-bottom:5px;
    font-family: 'yg-jalnan';
 }
 
 .divLikeTop3more{
    display:inline-block;
    width:50px;
    margin-left:20px;
    padding-top:22px;
    vertical-align:bottom;
    font-size: 15px;
    color: #d3d3d3;
 }
 
 .divPointRankTop3List{
    /* 추후에 point list용 div만들예정 */
 }
 
 .divPointRankTop3Listblank{
    /* 추후에 point list용 div만들예정 */
 }
 
 .divLikeTop3List{
    /* 추후에 like list용 div만들예정 */
 }
 
 .divLikeTop3Listblank{
    /* 추후에 like list용 div만들예정 */
 }
 
 
</style>
</head>
<body>

	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
 
 <div class="out" style="margin: 0 auto; width: 1200px; position: relative; right:-190px;">

    <div><!-- Search 부분 (제목 / 작성자 / 내용)start -->
       <form action="mainSearch" method="post">
         <input type="hidden" name="user_id_email" value="${user_id_email}"> <!-- 이거 세션으로 보낼때 나오는거라서 빼셔도됩니다 -->
         <input type="hidden" name="user_nickname" value="${user_nickname}">
         <input type="hidden" name="user_image" value="${user_image}">
       <div class="divsearch">
       <div class="divWantChallengeSearch">원하는 챌린지를 검색해보세요</div>
       <div class="divWantChallengeSearchBu">(제목, 챌주, 해시태그 등)</div>
       <div class="search"><input type="text" name="mainSearchName" required="required" placeholder="검색창" style=" font-size:15px;  width: 450px; height: 40px; margin-left:170px; border: 2px solid #9f6e54; border-radius:10px; outline:none; font-family:'ChosunGu'; "></div>
       <div class="search"><input type="submit" value="검색!" style="width: 65px; height: 40px; border:0; background: #9f6e54; color: white; border-radius: 10px; font-weight: bold; font-family:'ChosunGu' " ></div>
       </div>
       </form>
    </div><!-- Search 부분 (제목 / 작성자 / 내용)end -->
    
    <div style="margin-top: 120px;"></div>
    
    <div><!-- 추천 챌린지 부분 (우재님을 위한 추천 챌린지)start -->
         
         <div class="divLoveChallenge">
         <div class="divLoveChallengeBasicImg"></div>
         <div class="divLoveChallengeFont"><b style="color:#9f6e54;">${user_nickname}</b>
                                           <b style="color:#9f6e54; font-family: 'ChosunGu'; font-weight: bold; font-size: 18px; ">님을 위한 </b>
                                           <b style="color:#9f6e54;  font-family: 'ChosunGu'; font-weight: bold; font-size: 18px; ">추천 </b>
                                           <b style="color:#9f6e54;  font-family: 'ChosunGu'; font-weight: bold; font-size: 18px;">챌린지</b>
                                           </div>
         </div>
    </div><!-- 추천 챌린지 부분 (우재님을 위한 추천 챌린지)end -->
      
      <div style="margin-top: 20px;"></div>
      
      <div>
         
         
          <div class="divLoveChallengeList">
                 <c:choose>
                  <c:when test="${chatbotList.size() > 0 }">
                   <c:forEach var="chatbotList" items="${chatbotList}" varStatus="status">
                            <div class="divChatbotListBase" id="chatbotList${status.index}">
                                 <div class="divChatbotListImg">
                                    <a href="challengeDetail?chg_num=${chatbotList.chg_num}"><img class="divChatbotListImgsize" alt="" src="upload/mainIMG/${chatbotList.chg_image}"></a>
                                    <div class="chatbotUser_count">
                                         <div class="divChatbotUser_count_img"><a href="challengeDetail?chg_num=${chatbotList.chg_num}"><img alt="" src="teamtwo/img/wj_board_user_icon.png" class="chatbotUser_count_img"></a></div>
                                         <div class="divChatbotUser_count">${chatbotList.chg_now_parti}명</div>
                                    </div>
                                 </div>
                                  <div class="chatbotListTimeFont"><div id="chatbotListTime${status.index}"></div></div>
                                  <div class="divChatbotListTitle"><a href="challengeDetail?chg_num=${chatbotList.chg_num}" id="titleCut${status.index}" class="divChatbotListTitleFont"></a></div>
                                  
                                 <c:if test="${chatbotList.hashtag_text != null}">
                                   <c:set var="hashtag" value="${fn:split(chatbotList.hashtag_text,',')}"/>
                                  <c:forEach var="hashtag_text" items="${hashtag}" varStatus="status2">
                                         <div class="divHashtag">${hashtag_text}</div>
                                  </c:forEach>
                                 </c:if>
                                  
                                  
                                  
                            </div>
                   </c:forEach>
                   </c:when>
                   <c:otherwise>
                         <div style="width: 250px; height: 300px; margin-top : 20px; margin-right: 16.5px; ">
                          <img alt="" src="../wj/img/noChallenge.png" style="object-fit: contain; width:250px; height:300px; margin-left: 300px;">
                         </div>
                   </c:otherwise>
                   </c:choose>
          </div>
            
      </div>
      
      <div style="margin-top: 30px;"></div>
      
    <div> <!-- Categori title부분 (카테고리별로 보기)start -->
         <div class="divCategory">
         <div class="divCategoryBasicImg"></div>
         <div class="divCategoryFont"><b style="color:#9f6e54;">카테고리</b>
                                      <b style="color:#9f6e54; font-family: 'ChosunGu'; font-weight: bold; font-size: 18px; ">별 추천 챌린지</b></div>
         </div>
    </div> <!-- Categori title부분 (카테고리별로 보기)end -->
       
       <div style="margin-top: 10px;"></div>
       
       <div class="Category_plus">
       <div>
         <div class="choiceCategory_this">
          <div class="choiceCategory_thisFont">
                                        <b id="btaglc_num"  style="color:#5f5f5f"></b>
                                        <b id="btaglc_num_arrowsO" style="color:black"></b>
                                        <b id="btaglc_num_arrowsT" style="color:#5f5f5f"></b>
                                        <b id="btagmc_num" style="color:#5f5f5f"></b>
                                        <b id="btagmc_num_arrowsO" style="color:black"></b>
                                        <b id="btagmc_num_arrowsT" style="color:#5f5f5f"></b>
                                        <b id="btagsc_num"  style="color:#5f5f5f"></b>
                                        <b id="Category_text" style="color:black; font-family: 'ChosunGu'; font-weight: bold; font-size: 18px; ">대분류를 선택해주세요.</b>
                                        </div>
         </div>
       </div>
       
       <div style="margin-top: 10px;"></div>
       
    <div><!-- Category Menu 부분 (코딩 / 다이어트 / 운동 / 저축 )start -->
         <div class="divCategory_menu" id="category_menu">
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(10); statusChange(this); " style="background-color: #FBF1EB;">
              <img alt="" src="../wj/img/pitness.png" width="60px;" height="60px;" style=" border-radius: 70%; position: absolute; right: 35px;"><div style="margin-top: 25px;">건강/피트니스</div></button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(20); statusChange(this); " style="background-color: #F7FCE0;">
              <img alt="" src="../wj/img/studys.png" width="60px;" height="60px;" style=" border-radius: 70%; position: absolute; right: 35px;"><div style="margin-top: 25px;">학습/자기계발</div></button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(30); statusChange(this);" style="background-color: #DEEBF7;">
              <img alt="" src="../wj/img/cross.png" width="60px;" height="60px;" style=" border-radius: 70%; position: absolute; right: 35px;"><div style="margin-top: 25px;">소셜/힐링</div></button>
         <button type="button" class="divLcnum_css" onclick="getCategoryLc_num(40); statusChange(this);" style=" background-color:#F2F2F2; ">
              <img alt="" src="../wj/img/rest.png" width="60px;" height="60px;" style=" border-radius: 70%; position: absolute; right: 35px;"><div style="margin-top: 25px;">취미/기타</div></button>
           <div class="submitCategory"></div>
        </div>
        
        <div class="divCategory_choice">
                                        <form action="category_searchs" method="post" name="fr_ca" id="category_search" onsubmit="return checking()">
                                                <input type="hidden" name="user_id_email" value="${user_id_email}">
                                                <input type="hidden" name="user_nickname" value="${user_nickname}">
                                                <input type="hidden" name="user_image" value="${user_image}">
                                                <input type="hidden" name="lc_num" id="categorylc_num">
		                                        <input type="hidden" name="mc_num" id="categorymc_num">
		                                        <input type="hidden" name="sc_num" id="categorysc_num">
                                        </form>                                       
                                        <div class="backCategory"></div>
                                        <!-- <a class="buttonCategory_back" onclick="getCategory_Back()">대분류 다시 선택</a> -->
                                        <!-- <div class="submitCategory"><button type="submit" class="buttonCategory_search" form="category_search">카테고리 검색</button></div> -->
                                        </div>
                                                                          
    </div><!-- Categori Menu 부분 (코딩 / 다이어트 / 운동 / 저축 )end -->
   </div>
       <div style="margin-top: 30px;"></div>
       
    <div><!-- Point Rank Top3 (더보기를 누르면 랭킹으로 이동) / Like Board Top3 (더보기를 누르면 커뮤니티로 이동) 부분 start -->
         <div class="divPointandLikeTop3">
              <div class="divPointRankTop3">
                  <div class="divPointRankTop3BasicImg"></div>
                  <div class="divPointRankTop3Font"><b style="color:#9f6e54;">열매 랭킹</b>
                                                    <b style="color:#daa35b;"> TOP3</b></div>
                  <div class="divPointRankTop3more"><a href="showrank" class="aMoretag">more..</a></div>
                  <div class="divPointBox">
                   <c:choose>
                    <c:when test="${pointList.size() > 0}">
                       <c:forEach var="pointList" items="${pointList}" varStatus="status">
                             <div class="divPointRankTle">
                             <div class="divPointRankImg">
                                <c:choose>
                                   <c:when test="${status.index+1 == 1}"><img alt="" src="ban/img/medal.png" width="30px;" height="30px;"></c:when>
                                   <c:when test="${status.index+1 == 2}"><img alt="" src="ban/img/medal2.png" width="30px;" height="30px;"></c:when>
                                   <c:when test="${status.index+1 == 3}"><img alt="" src="ban/img/medal3.png" width="30px;" height="30px;"></c:when>
                                </c:choose>
                             </div>
                             <div class="divPointRankNick">${pointList.user_nickname}</div>
                             <div class="divPointBlance">${pointList.point_balance}열매</div>
                             </div>
                       </c:forEach>
                    </c:when>
                    <c:otherwise></c:otherwise>  
                    </c:choose>                   
                  </div>
              </div>
              
              <div class="divLikeTop3">
                  <div class="divLikeTop3BasicImg"></div>
                  <div class="divLikeTop3Font"><b style="color:#9f6e54;">인기 게시물</b>
                                               <b style="color:#daa35b;"> TOP3</b></div>
                  <div class="divLikeTop3more"><a href="community" class="aMoretag">more..</a></div>
                  <div class="divPointBox">
                   <c:choose>
                    <c:when test="${commList.size() > 0}">
                       <c:forEach var="commList" items="${commList}" varStatus="status">
                             <div class="divPointRankTle">
                             <div class="divPointRankImg">
                                <c:choose>
                                   <c:when test="${status.index+1 == 1}"><img alt="" src="ban/img/medal.png" width="30px;" height="30px;"></c:when>
                                   <c:when test="${status.index+1 == 2}"><img alt="" src="ban/img/medal2.png" width="30px;" height="30px;"></c:when>
                                   <c:when test="${status.index+1 == 3}"><img alt="" src="ban/img/medal3.png" width="30px;" height="30px;"></c:when>
                                </c:choose>
                             </div>
                             <div class="divPointRankNick">${commList.b_title}</div>
                             <div class="divPointBlance">${commList.b_nickname}</div>
                             </div>
                       </c:forEach>
                    </c:when>
                    <c:otherwise></c:otherwise>  
                    </c:choose>                   
                  </div>
                  </div>
              </div>
    </div><!-- Point Rank Top3 (더보기를 누르면 랭킹으로 이동) / Like Board Top3 (더보기를 누르면 커뮤니티로 이동) 부분 end -->

    </div><!-- out div 끝 --> 
      <div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>

</body>
</html>