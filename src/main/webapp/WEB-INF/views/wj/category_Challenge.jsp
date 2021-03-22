<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<script type="text/javascript">
      var listcount;
      var Vlc_num;
      var Vmc_num;
      var Vsc_num;
      var liststr = "";
      var listpagestr = "";
     
      var chg_regdate = "";
      var chg_startdate = "";
      var chg_enddate = "";
      var chg_capacity = "";
      var chg_now_parti = "";
      var timeResult = "";
      var newtimeResult = "";
      var count ="";
      var now = new Date();
     $(window).ready(function() {
		 
    	 var category_search_count1 = $('#category_search_count1').val();
    	if(category_search_count1 == 0){
    		$('.divLoveChallengeList').empty();
    	    $('.divListPage').empty();
    	    $('.choiceVdiv').empty();
    	}else{

   		 Vlc_num = $('#lc_num').val();
   		 Vmc_num = $('#mc_num').val();
   		 Vsc_num = $('#sc_num').val();
       	 $.ajax({
       		 url:"category_ajax_listCount",
       		 data:{lc_num : Vlc_num, mc_num : Vmc_num, sc_num : Vsc_num},
       		 dataType:'json',
       		 success:function(data){ 
       			 /* var jsondata = JSON.stringify(data);
   	    			alert('jsondata=>'+jsondata); */
       			 $(data).each(function() {
       				 listcount = this.count;
       				 $('#count').val(listcount);
           			 $.ajax({
           		  		   url:"category_ajax",
           		  		   data:{lc_num : ${lc_num},mc_num : ${mc_num}, sc_num : ${sc_num}, count : listcount},
           		  		   dataType:'json',
           		  		   success:function(data){
           		  			   $(data).each(function(index,item) {    
           		  				 var result = "";
           		  	        	 var cutlength = 15;
           		  	        	 var machim = "..";
           		  	        	 if(item.chg_title.length > cutlength){
           		  	        		   result += item.chg_title.substr(0,cutlength)+machim;    		   
           		  	        	 }else{
           		  	        		  result += item.chg_title;
           		  	        	 }        	    
           		  				     		  	        									
   			        			 var wj_chg_startdate = new Date(item.chg_startdate);
   			    	        	 var wj_chg_regdate = new Date(item.chg_regdate);
   			    	        	 var wj_chg_enddate = new Date(item.chg_enddate);
   			    	        	 
   			    	        	 
   			    	        	 
  			    	        	wj_chg_regdate = new Date(wj_chg_regdate.getFullYear(), wj_chg_regdate.getMonth(), wj_chg_regdate.getDate());
  			    	        	wj_chg_startdate = new Date(wj_chg_startdate.getFullYear(), wj_chg_startdate.getMonth(), wj_chg_startdate.getDate());
  			    	        	wj_chg_enddate = new Date(wj_chg_enddate.getFullYear(), wj_chg_enddate.getMonth(), wj_chg_enddate.getDate());
  			    	        	 
   			    	        	 var str_regdate = new Date(item.chg_regdate).toISOString().slice(0,10); //등록일
   			    	             var str_startdate = new Date(item.chg_startdate).toISOString().slice(0,10); //시작일
   			    	             var str_enddate = new Date(item.chg_enddate).toISOString().slice(0,10); //종료일
   			    	             var str_now = new Date(now).toISOString().slice(0,10); //오늘 
   			    	            // alert('str_ => ' +str_regdate);
   			    	            // alert('str_ => ' +str_startdate);
   			    	             //alert('str_ => ' +str_enddate);
   			    	             //alert('str_ => ' +str_now);
   			   		      	    // alert(wj_chg_regdate);
   			   		      	     
   			   		      	   	 if(str_startdate <= str_now){
   			   		                                    
   			   		           		 if(str_enddate <= str_now){
   			   		           		         timeResult = "챌린지종료";
   			   		          		   }else{
   			   			          			var distance = now - wj_chg_startdate; //진행중
   			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
   			   			          			//alert('distance => ' + distance);
   			   			          			//alert('distance => ' + days);
   			   			    	        	 timeResult = "진행중 D+"+days;		   			    	        	 
   			   		        				}
   			   		           		 
	   					   		        }else if(str_startdate == str_now){
	   					   		        		 timeResult = "D-DAY";
	   					   		      			}else{
	   					   		      				
				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
				   					   		    	        timeResult = "모집마감";
				   					   		            }else{
				   					   		      		var distance = now - wj_chg_startdate; //모집중
				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				   					   		           // alert('distance => ' + distance);
						   			          			//alert('distance => ' + days);
				   					   		        	timeResult = "모집중 D"+days;
				   					   		       	  } 
	   					   		      				
	   					   		      			}
   					   		       
           		  	        	 
           		  				   if(listcount == 0){
           		  					   liststr += "리스트가 없습니다.";
           		  				   }else{
           		  					   liststr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
           		  					   liststr += "<div class='divChatbotListImg'>";
           		  					   liststr += "<a href='challengeDetail?chg_num="+item.chg_num+"'><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
           		  					   liststr += "<div class='chatbotUser_count'>";
           		  					   liststr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
           		  					   liststr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
           		  					   liststr += "</div></div>";
           		  					liststr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+timeResult+"</div></div>";
           		  					   liststr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+" class='divChatbotListTitleFont'>"+result+"</a></div>";
           		  					   
           		  					   if (item.hashtag_text == null ) {
            		  					   } else {
                 		  					   var hashtag = item.hashtag_text.split(",");
               		  					   for( var i in hashtag){
               		  						    liststr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
               		  					   }
         		  						   
           		  					   }
             		  					   liststr += "</div></div>";
           		  					   
           		  					   
           		  				   }
           		  				 //console.log('liststr=>'+liststr);   
           						});
             		    			

    		  				      $('#challengeList').append(liststr);
    		  				    $.ajax({
    	        				 url:"category_ajax_page",
    	        				 data:{count : listcount},
    	        				 dataType:'json',
    	        				 success:function(data){
    	        					   var choiceN = $('input:checkbox[name="choiceV"]:checked').val();
    	        					   var orderN = $('input:checkbox[name="orderV"]:checked').val();
    	        					   console.log(choiceN);
    	        					 $(data).each(function(index,item) {
    	        						    if(item.startPage > item.blockSize){
    	        						    	listpagestr += "<a onclick='pagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
    	        						    }
    									   for(var k=item.startPage; k<=item.endPage; k++){
    										  listpagestr += "<a onclick='pagingAction("+k+","+choiceN+","+orderN+")'>["+k+"]</a>";
    									  } 
    									   if(item.endPage < item.pageCnt){
    										   listpagestr += "<a onclick='pagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
    									   }
    								});
    	        					 $('#ListPaging').append(listpagestr);
    	        				 }
    	        			 }); 
           		  		   }
           		  	 }); 
           			 
   				});
       		 }
       	 }); // ajax검색
    	} // else 부분
    	   	 
	});
      function pagingAction(Vpage,Vchoice,Vorder) {
    	 
    		 
    		 
    		 Vlcn = $('#lc_num').val();
     		 Vmcn = $('#mc_num').val();
     		 Vscn = $('#sc_num').val();
     		 //Vcnt = $('#count').val();
     		 
     			 Vchoice = $('input[name="choiceV"]:checked').val();
     			 Vorder = $('input[name="orderV"]:checked').val();
     		 
     		  console.log("새로운초이스값  input 체크용=> " + Vchoice);
     		 $.ajax({
     			 url:"countNew",
     			 data:{choice : Vchoice , lc_num : Vlcn , mc_num : Vmcn , sc_num : Vscn},
     			 dataType:'json',
     			 success:function(data){
     				 $(data).each(function(){
     					 var Vcnt = this.count;
     					 $('#challengeList').empty();
     			 		 $('#ListPaging').empty();
     			 		 var listpagingstr= "";
     				     var listnewpagestr = "";
     				     // 변수선언하는것도 function안에 선언해줘야 잘먹네요
     			 		 $.ajax({
     			 			 url:"category_challenge_paging",
     			 			 data:{lc_num : Vlcn , mc_num : Vmcn , sc_num : Vscn , count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
     			 			 dataType:'json',
     			 			 success:function(data){
     			 				 console.log("Vcnt => " +Vcnt);
     			 				 $(data).each(function(index , item) {
     			 					 
     			 					 var newresult = "";
     				  	        	 var newcutlength = 15;
     				  	        	 var newmachim = "..";
     				  	        	 if(item.chg_title.length > newcutlength){
     				  	        		   newresult += item.chg_title.substr(0,newcutlength)+newmachim;    		   
     				  	        	 }else{
     				  	        		  newresult += item.chg_title;
     				  	        	 }        	    
     				  				     		  	        									
     				  	        	var wj_chg_startdate = new Date(item.chg_startdate);
      			    	        	 var wj_chg_regdate = new Date(item.chg_regdate);
      			    	        	 var wj_chg_enddate = new Date(item.chg_enddate);
      			    	        	 
      			    	        	 
      			    	        	 
     			    	        	wj_chg_regdate = new Date(wj_chg_regdate.getFullYear(), wj_chg_regdate.getMonth(), wj_chg_regdate.getDate());
     			    	        	wj_chg_startdate = new Date(wj_chg_startdate.getFullYear(), wj_chg_startdate.getMonth(), wj_chg_startdate.getDate());
     			    	        	wj_chg_enddate = new Date(wj_chg_enddate.getFullYear(), wj_chg_enddate.getMonth(), wj_chg_enddate.getDate());
     			    	        	 
      			    	        	 var str_regdate = new Date(item.chg_regdate).toISOString().slice(0,10); //등록일
      			    	             var str_startdate = new Date(item.chg_startdate).toISOString().slice(0,10); //시작일
      			    	             var str_enddate = new Date(item.chg_enddate).toISOString().slice(0,10); //종료일
      			    	             var str_now = new Date(now).toISOString().slice(0,10); //오늘 
      			    	            // alert('str_ => ' +str_regdate);
      			    	            // alert('str_ => ' +str_startdate);
      			    	             //alert('str_ => ' +str_enddate);
      			    	             //alert('str_ => ' +str_now);
      			    	       
      			   		      	    // alert(wj_chg_regdate);
      			   		      	     
      			   		      	   	 if(str_startdate <= str_now){
      			   		                                    
      			   		           		 if(str_enddate <= str_now){
      			   		           		newtimeResult = "챌린지종료";
      			   		          		   }else{
      			   			          			var distance = now - wj_chg_startdate; //진행중
      			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      			   			          			//alert('distance => ' + distance);
      			   			          			//alert('distance => ' + days);
      			   			          		newtimeResult = "진행중 D+"+days;		   			    	        	 
      			   		        				}
      			   		           		 
   	   					   		        }else if(str_startdate == str_now){
   	   					   		   newtimeResult = "D-DAY";
   	   					   		      			}else{
   	   					   		      				
   				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
   				   					   		      	newtimeResult = "모집마감";
   				   					   		            }else{
   				   					   		      		var distance = now - wj_chg_startdate; //모집중
   				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
   				   					   		            //alert('distance => ' + distance);
   						   			          			//alert('distance => ' + days);
   						   			          	newtimeResult = "모집중 D"+days;
   				   					   		       	  } 
   	   					   		      				
   	   					   		      			}
      					   		       
     			    	        	 
     			    	        	 
     			    	        	 if(Vcnt == 0){
     			    	        		 listnewpagestr += "리스트가 없습니다.";
     				  				   }else{
     				  					 listnewpagestr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
     				  					listnewpagestr += "<div class='divChatbotListImg'>";
     				  					listnewpagestr += "<a href='challengeDetail?chg_num="+item.chg_num+"><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
     				  					listnewpagestr += "<div class='chatbotUser_count'>";
     				  					listnewpagestr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
     				  					listnewpagestr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
     				  					listnewpagestr += "</div></div>";
     				  					listnewpagestr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+newtimeResult+"</div></div>";
     				  					listnewpagestr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+" class='divChatbotListTitleFont'>"+newresult+"</a></div>";
     				  					
     				  					   if (item.hashtag_text == null ) {
     				  					   } else {
     					  					   var hashtag = item.hashtag_text.split(",");
     					  					   for( var i in hashtag){
     					  						 listnewpagestr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
     					  					   }
     			  						   
     				  					   }
     				  					 listnewpagestr += "</div></div>";
     				  					   
     				  					   
     				  				   }
     				  				 //console.log('liststr=>'+liststr);   
     								});		    			
     							      $('#challengeList').append(listnewpagestr);
     			 			 } 			 
     			 		 });
     			 		 
     			 		$.ajax({
     						 url:"category_challenge_newpage",
     						 data:{count : Vcnt, page : Vpage},
     						 dataType:'json',
     						 success:function(data){
     							 $(data).each(function(index,item) {
     								    if(item.startPage > item.blockSize){
     								    	listpagingstr += "<a onclick='pagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
     								    }
     								   for(var k=item.startPage; k<=item.endPage; k++){
     									   listpagingstr += "<a onclick='pagingAction("+k+","+Vchoice+","+Vorder+")'>["+k+"]</a>";
     								  } 
     								   if(item.endPage < item.pageCnt){
     									   listpagingstr += "<a onclick='pagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
     								   }
     							});
     							 $('#ListPaging').append(listpagingstr);
     						 }
     					 });
     					  
     				 });
     			 }
     		 });
    		 
    	
    	  
    	 
 		 
 		 
	}
      function pagingAction(Vpage,Vchoice,Vorder) {
     	 
 		 
 		 
 		 Vlcn = $('#lc_num').val();
  		 Vmcn = $('#mc_num').val();
  		 Vscn = $('#sc_num').val();
  		 //Vcnt = $('#count').val();
  		 
  			 Vchoice = $('input[name="choiceV"]:checked').val();
  			 Vorder = $('input[name="orderV"]:checked').val();
  		 
  		  console.log("새로운초이스값  input 체크용=> " + Vchoice);
  		 $.ajax({
  			 url:"countNew",
  			 data:{choice : Vchoice , lc_num : Vlcn , mc_num : Vmcn , sc_num : Vscn},
  			 dataType:'json',
  			 success:function(data){
  				 $(data).each(function(){
  					 var Vcnt = this.count;
  					 $('#challengeList').empty();
  			 		 $('#ListPaging').empty();
  			 		 var listpagingstr= "";
  				     var listnewpagestr = "";
  				     // 변수선언하는것도 function안에 선언해줘야 잘먹네요
  			 		 $.ajax({
  			 			 url:"category_challenge_paging",
  			 			 data:{lc_num : Vlcn , mc_num : Vmcn , sc_num : Vscn , count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
  			 			 dataType:'json',
  			 			 success:function(data){
  			 				 console.log("Vcnt => " +Vcnt);
  			 				 $(data).each(function(index , item) {
  			 					 
  			 					 var newresult = "";
  				  	        	 var newcutlength = 15;
  				  	        	 var newmachim = "..";
  				  	        	 if(item.chg_title.length > newcutlength){
  				  	        		   newresult += item.chg_title.substr(0,newcutlength)+newmachim;    		   
  				  	        	 }else{
  				  	        		  newresult += item.chg_title;
  				  	        	 }        	    
  				  				     		  	        									
  				  	        	var wj_chg_startdate = new Date(item.chg_startdate);
  			    	        	 var wj_chg_regdate = new Date(item.chg_regdate);
  			    	        	 var wj_chg_enddate = new Date(item.chg_enddate);
  			    	        	 
  			    	        	 
  			    	        	 
 			    	        	wj_chg_regdate = new Date(wj_chg_regdate.getFullYear(), wj_chg_regdate.getMonth(), wj_chg_regdate.getDate());
 			    	        	wj_chg_startdate = new Date(wj_chg_startdate.getFullYear(), wj_chg_startdate.getMonth(), wj_chg_startdate.getDate());
 			    	        	wj_chg_enddate = new Date(wj_chg_enddate.getFullYear(), wj_chg_enddate.getMonth(), wj_chg_enddate.getDate());
 			    	        	 
  			    	        	 var str_regdate = new Date(item.chg_regdate).toISOString().slice(0,10); //등록일
  			    	             var str_startdate = new Date(item.chg_startdate).toISOString().slice(0,10); //시작일
  			    	             var str_enddate = new Date(item.chg_enddate).toISOString().slice(0,10); //종료일
  			    	             var str_now = new Date(now).toISOString().slice(0,10); //오늘 
  			    	            // alert('str_ => ' +str_regdate);
  			    	            // alert('str_ => ' +str_startdate);
  			    	             //alert('str_ => ' +str_enddate);
  			    	             //alert('str_ => ' +str_now);
  			    	        	 
  			   		      	    // alert(wj_chg_regdate);
  			   		      	     
  			   		      	   	 if(str_startdate <= str_now){
  			   		                                    
  			   		           		 if(str_enddate <= str_now){
  			   		           		         newtimeResult = "챌린지종료";
  			   		          		   }else{
  			   			          			var distance = now - wj_chg_startdate; //진행중
  			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  			   			          			//alert('distance => ' + distance);
  			   			          			//alert('distance => ' + days);
  			   			    	        	 newtimeResult = "진행중 D+"+days;		   			    	        	 
  			   		        				}
  			   		           		 
	   					   		        }else if(str_startdate == str_now){
	   					   		        		 newtimeResult = "D-DAY";
	   					   		      			}else{
	   					   		      				
				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
				   					   		    	        newtimeResult = "모집마감";
				   					   		            }else{
				   					   		      		var distance = now - wj_chg_startdate; //모집중
				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				   					   		            //alert('distance => ' + distance);
						   			          			//alert('distance => ' + days);
				   					   		        	newtimeResult = "모집중 D"+days;
				   					   		       	  } 
	   					   		      				
	   					   		      			}
  					   		       
  			    	        	 if(Vcnt == 0){
  			    	        		 listnewpagestr += "리스트가 없습니다.";
  				  				   }else{
  				  					 listnewpagestr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
  				  					listnewpagestr += "<div class='divChatbotListImg'>";
  				  					listnewpagestr += "<a href='challengeDetail?chg_num="+item.chg_num+"'><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
  				  					listnewpagestr += "<div class='chatbotUser_count'>";
  				  					listnewpagestr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
  				  					listnewpagestr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
  				  					listnewpagestr += "</div></div>";
  				  				listnewpagestr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+newtimeResult+"</div></div>";
  				  					listnewpagestr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+newresult+"</a></div>";
  				  					
  				  					   if (item.hashtag_text == null ) {
  				  					   } else {
  					  					   var hashtag = item.hashtag_text.split(",");
  					  					   for( var i in hashtag){
  					  						 listnewpagestr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
  					  					   }
  			  						   
  				  					   }
  				  					 listnewpagestr += "</div></div>";
  				  					   
  				  					   
  				  				   }
  				  				 //console.log('liststr=>'+liststr);   
  								});		    			
  							      $('#challengeList').append(listnewpagestr);
  			 			 } 			 
  			 		 });
  			 		 
  			 		$.ajax({
  						 url:"category_challenge_newpage",
  						 data:{count : Vcnt, page : Vpage},
  						 dataType:'json',
  						 success:function(data){
  							 $(data).each(function(index,item) {
  								    if(item.startPage > item.blockSize){
  								    	listpagingstr += "<a onclick='pagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
  								    }
  								   for(var k=item.startPage; k<=item.endPage; k++){
  									   listpagingstr += "<a onclick='pagingAction("+k+","+Vchoice+","+Vorder+")'>["+k+"]</a>";
  								  } 
  								   if(item.endPage < item.pageCnt){
  									   listpagingstr += "<a onclick='pagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
  								   }
  							});
  							 $('#ListPaging').append(listpagingstr);
  						 }
  					 });
  					  
  				 });
  			 }
  		 });
 		 
 	
 	  
 	 
		 
		 
	}
     
</script>
<style type="text/css">

a:link{color:black;  text-decoration: none;}
  a:visited{color:black;  text-decoration: none;}
  a:hover{color:black;  text-decoration: none;}
  .divNoChallenge{
        margin-left: 400px;
        width:800px;
    }

  .divSearchChallenge{
    margin-left: 400px;
    width:800px;
 }
 
 .divSearchChallengeFont{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }

  .choiceVdiv{
    margin-left : 400px;
    width:830px;
    font-family: 'ChosunGu';
  }

  .divLoveChallengeList{
    margin-left: 400px;
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
    font-family: 'ChosunGu';
    font-weight:bold;
    font-size:16px;
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
      margin-top:6px;
      margin-bottom:6px;
      font-size: 12px;
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
 
 
 .divListPage{
     margin-left: 400px;
    width:830px;
    text-align: center;
 }
 
 .choicediv{
    display: inline-block;
    vertical-align: top;
 }
 
 .orderdiv{
    display: inline-block;
    vertical-align: top;
    margin-left:300px;
 }
 
</style>
</head>
<body>
  	<div style="height: 70px; margin: 0 0 15px 0;">
		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
	</div>
	
      <input type="hidden" name="lc_num" id="lc_num" value="${lc_num}">
      <input type="hidden" name="mc_num" id="mc_num" value="${mc_num}">
      <input type="hidden" name="sc_num" id="sc_num" value="${sc_num}">
      <input type="hidden" name="count" id="count">
      <input type="hidden" name="category_search_count1" id="category_search_count1" value="${category_search_count1}">
      
      <div class="divSearchChallenge">
        <div class="divSearchChallengeFont"><b style="color:#ebd39f;">카테고리 </b>
                                           <b style="color:#9f6e54;">검색 </b>
                                           </div>
     </div>
      <div style="margin-top: 10px;"></div>
      
      <c:if test="${category_search_count1 == 0}">
          <div class="divNoChallenge">
             <img alt="" src="../wj/img/noChallenge.png" width="700px;" height="700px;">
     </div>
     </c:if>
      
      <div class="choiceVdiv">
         <div class="choicediv">
             <input type="radio" id="choiceV" name="choiceV" value="1" checked="checked" onclick=" pagingAction(1,1,0);"> 전체
             <input type="radio" id="choiceV" name="choiceV" value="2" onclick=" pagingAction(1,2,0); "> 모집중
             <input type="radio" id="choiceV" name="choiceV" value="3" onclick=" pagingAction(1,3,0); "> 진행중
             <input type="radio" id="choiceV" name="choiceV" value="4" onclick=" pagingAction(1,4,0); "> 종료
         </div>
         <div class="orderdiv">
             <input type="radio" id="orderV"  name="orderV" value="0" checked="checked" onclick=" pagingAction(1,2,0); ">일반
             <input type="radio" id="orderV" name="orderV" value="1" onclick=" pagingAction(1,2,1); ">최신순
             <input type="radio" id="orderV" name="orderV" value="2" onclick=" pagingAction(1,2,2); ">추천순
         </div>
      </div>
      <div class="divLoveChallengeList" id="challengeList"></div>
       <div class="divListPage" id="ListPaging"></div>
      <div><%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %></div>
      
</body>
</html>