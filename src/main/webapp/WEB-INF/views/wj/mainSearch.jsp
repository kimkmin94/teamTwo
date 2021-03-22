<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<script type="text/javascript">
     var titlecount;
     var hashtagcount;
     var mastercount;
     var contentcount;
     var listcount;
     var Vlc_num;
     var Vmc_num;
     var Vsc_num;
     var liststr = "";
     var contentliststr = "";
     var masterliststr = "";
     var hashtagliststr = "";
     var listpagestr = "";
     var contentlistpagestr = "";
     var masterlistpagestr = "";
     var hashtaglistpagestr = "";
    
     var chg_regdate = "";
     var chg_startdate = "";
     var chg_enddate = "";
     var chg_capacity = "";
     var chg_now_parti = "";
     var timeResult = "";
     var contenttimeResult = "";
     var mastertimeResult = "";
     var hashtagtimeResult = "";
     var newtimeResult = "";
     var contentnewtimeResult = "";
     var masternewtimeResult = "";
     var hashtagnewtimeResult = "";
     var count ="";
     var now = new Date().getTime();
     $(window).ready(function() {
    	 
    	 var searchAllCnt = $('#searchAllCnt').val();
    	 //alert('searchAllCnt =>' + searchAllCnt);
    	 if(searchAllCnt == 0){
    		 $('.choiceVdiv1').empty();
			 $('.divSearchChallenge1').empty();
			 $('.choiceVdiv2').empty();
			 $('.divSearchChallenge2').empty();
			 $('.choiceVdiv3').empty();
			 $('.divSearchChallenge3').empty();
			 $('.choiceVdiv4').empty();
			 $('.divSearchChallenge4').empty();			 
			 $('.divLoveChallengeList').empty();
		     $('.divListPage').empty();			 
    	 }else{
    		 
    		 var VsearchName = $('#searchname').val();
        	 
        	 $.ajax({
        		 url:"searchAjax_maintitlecount",
        		 data:{searchName : VsearchName},
        		 dataType:'json',
        		 success:function(data){
        			 $(data).each(function() {
    					 titlecount = this.count;
    					 
    					 if(titlecount == 0){
        					 $('.choiceVdiv1').empty();
        					 $('.divSearchChallenge1').empty();
        				 }else{
        					 $('#searchtitlecount').val(titlecount);
        					 //alert('title count =>' + titlecount);
        					 $.ajax({
        						 url:"searchAjax_maintitle",
        						 data:{searchName : VsearchName , count : titlecount},
        						 dataType:'json',
        						 success:function(data){
        							// var jsondata = JSON.stringify(data);
        				    			//alert('jsondata=>'+jsondata);
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
                		  					   liststr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+result+"</a></div>";
                		  					   
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
         		  				    
         		  				      
        						 }
        					 }); // mainTitle list 처리
        					 
        					 $.ajax({
        	        				 url:"searchAjax_maintitle_page",
        	        				 data:{count : titlecount},
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
        	        			 }); // maintitle page 부분
        				 } //else부분
    					 
    					 
    				});
        		 }
        	 }); // mainTitle부분
                 // maincontent부분
        	 $.ajax({ 
        		 url:"searchAjax_maincontentcount",
        		 data:{searchName : VsearchName},
        		 dataType:'json',
        		 success:function(data){
        			 $(data).each(function() {
        				 contentcount = this.count;
        				 
        				 if(contentcount == 0){
        					 $('.choiceVdiv2').empty();
        					 $('.divSearchChallenge2').empty();
        				 }else{
        					 $('#searchcontentcount').val(contentcount);
        					 //alert('title count =>' + titlecount);
        					 $.ajax({
        						 url:"searchAjax_maincontent",
        						 data:{searchName : VsearchName , count : contentcount},
        						 dataType:'json',
        						 success:function(data){
        							// var jsondata = JSON.stringify(data);
        				    			//alert('jsondata=>'+jsondata);
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
          			   		           		contenttimeResult = "챌린지종료";
          			   		          		   }else{
          			   			          			var distance = now - wj_chg_startdate; //진행중
          			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
          			   			          		
          			   			          		contenttimeResult = "진행중 D+"+days;		   			    	        	 
          			   		        				}
          			   		           		 
       	   					   		        }else if(str_startdate == str_now){
       	   					   		   contenttimeResult = "D-DAY";
       	   					   		      			}else{
       	   					   		      				
       				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
       				   					   		      	contenttimeResult = "모집마감";
       				   					   		            }else{
       				   					   		      		var distance = now - wj_chg_startdate; //모집중
       				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
       				   					   		          
       						   			          	contenttimeResult = "모집중 D"+days;
       				   					   		       	  } 
       	   					   		      				
       	   					   		      			}
          					   		       
                		  	        	 
                		  				   if(listcount == 0){
                		  					 contentliststr += "리스트가 없습니다.";
                		  				   }else{
        	        		  					 contentliststr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
        	        		  					contentliststr += "<div class='divChatbotListImg'>";
        	        		  					contentliststr += "<a href='challengeDetail?chg_num="+item.chg_num+"'><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
        	        		  					contentliststr += "<div class='chatbotUser_count'>";
        	        		  					contentliststr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
        	        		  					contentliststr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
        	        		  					contentliststr += "</div></div>";
        	        		  					contentliststr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+contenttimeResult+"</div></div>";
        	        		  					contentliststr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+result+"</a></div>";
        	        		  					
        	        		  				   if (item.hashtag_text == null ) {
                 		  					   } else {
                      		  					   var hashtag = item.hashtag_text.split(",");
                    		  					   for( var i in hashtag){
                    		  						 contentliststr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
                    		  					   }
              		  						   
                		  					   }
        	        		  				 contentliststr += "</div></div>";
                		  					   
                		  					   
                		  				   }
                		  				 //console.log('liststr=>'+liststr);   
                						});
                  		    			

         		  				      $('#contentchallengeList').append(contentliststr);
         		  				    
         		  				      
        						 }
        					 }); // maincontent list 처리
        					 
        					 $.ajax({
        	        				 url:"searchAjax_maincontent_page",
        	        				 data:{count : contentcount},
        	        				 dataType:'json',
        	        				 success:function(data){
        	        					   var choiceN = $('input:checkbox[name="contentchoiceV"]:checked').val();
        	        					   var orderN = $('input:checkbox[name="contentorderV"]:checked').val();
        	        					   console.log(choiceN);
        	        					 $(data).each(function(index,item) {
        	        						    if(item.startPage > item.blockSize){
        	        						    	contentlistpagestr += "<a onclick='contentpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
        	        						    }
        									   for(var k=item.startPage; k<=item.endPage; k++){
        										   contentlistpagestr += "<a onclick='contentpagingAction("+k+","+choiceN+","+orderN+")'>["+k+"]</a>";
        									  } 
        									   if(item.endPage < item.pageCnt){
        										   contentlistpagestr += "<a onclick='contentpagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
        									   }
        								});
        	        					 $('#contentListPaging').append(contentlistpagestr);
        	        				 }
        	        			 }); // maincontent page 부분
        				 }//else 부분
    					 
    				});
        		 }
        	 }); // maincontent부분
        	 
        	  // mainhashtag부분
        	 $.ajax({  
        		 url:"searchAjax_mainhashtagcount",
        		 data:{searchName : VsearchName},
        		 dataType:'json',
        		 success:function(data){
        			 $(data).each(function() {
        				 hashtagcount = this.count;
        				 
        				 if(hashtagcount == 0){
        					 $('.choiceVdiv3').empty();
        					 $('.divSearchChallenge3').empty();
        				 }else{
        					 $('#searchhashtagcount').val(hashtagcount);
        					 //alert('title count =>' + titlecount);
        					 $.ajax({
        						 url:"searchAjax_mainhashtag",
        						 data:{searchName : VsearchName , count : hashtagcount},
        						 dataType:'json',
        						 success:function(data){
        							 //var jsondata = JSON.stringify(data);
        				    			//alert('jsondata=>'+jsondata);
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
         			   		           		hashtagtimeResult = "챌린지종료";
         			   		          		   }else{
         			   			          			var distance = now - wj_chg_startdate; //진행중
         			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
         			   			          			//alert('distance => ' + distance);
         			   			          			//alert('distance => ' + days);
         			   			          		hashtagtimeResult = "진행중 D+"+days;		   			    	        	 
         			   		        				}
         			   		           		 
      	   					   		        }else if(str_startdate == str_now){
      	   					   		   hashtagtimeResult = "D-DAY";
      	   					   		      			}else{
      	   					   		      				
      				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
      				   					   		      	hashtagtimeResult = "모집마감";
      				   					   		            }else{
      				   					   		      		var distance = now - wj_chg_startdate; //모집중
      				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      				   					   		            //alert('distance => ' + distance);
      						   			          			//alert('distance => ' + days);
      						   			          	hashtagtimeResult = "모집중 D"+days;
      				   					   		       	  } 
      	   					   		      				
      	   					   		      			}
         					   		       
                		  				   if(listcount == 0){
                		  					 hashtagliststr += "리스트가 없습니다.";
                		  				   }else{
                		  					 hashtagliststr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
                		  					hashtagliststr += "<div class='divChatbotListImg'>";
                		  					hashtagliststr += "<a href='challengeDetail?chg_num="+item.chg_num+"' ><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
                		  					hashtagliststr += "<div class='chatbotUser_count'>";
                		  					hashtagliststr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
                		  					hashtagliststr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
                		  					hashtagliststr += "</div></div>";
                		  					hashtagliststr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+hashtagtimeResult+"</div></div>";
                		  					hashtagliststr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+result+"</a></div>";
                		  					
        	        		  				   if (item.hashtag_text == null ) {
                 		  					   } else {
                      		  					   var hashtag = item.hashtag_text.split(",");
                    		  					   for( var i in hashtag){
                    		  						 hashtagliststr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
                    		  					   }
              		  						   
                		  					   }
        	        		  				 hashtagliststr += "</div></div>";
                		  					   
                		  					   
                		  				   }
                		  				 //console.log('liststr=>'+liststr);   
                						});
                  		    			

         		  				      $('#hashtagchallengeList').append(hashtagliststr);
         		  				    
         		  				      
        						 }
        					 }); // mainhashtag list 처리
        					 
        					 $.ajax({
        	        				 url:"searchAjax_mainhashtag_page",
        	        				 data:{count : hashtagcount},
        	        				 dataType:'json',
        	        				 success:function(data){
        	        					   var choiceN = $('input:checkbox[name="hashtagchoiceV"]:checked').val();
        	        					   var orderN = $('input:checkbox[name="hashtagorderV"]:checked').val();
        	        					   console.log(choiceN);
        	        					 $(data).each(function(index,item) {
        	        						    if(item.startPage > item.blockSize){
        	        						    	hashtaglistpagestr += "<a onclick='hashtagpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
        	        						    }
        									   for(var k=item.startPage; k<=item.endPage; k++){
        										   hashtaglistpagestr += "<a onclick='hashtagpagingAction("+k+","+choiceN+","+orderN+")'>["+k+"]</a>";
        									  } 
        									   if(item.endPage < item.pageCnt){
        										   hashtaglistpagestr += "<a onclick='hashtagpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
        									   }
        								});
        	        					 $('#hashtagListPaging').append(hashtaglistpagestr);
        	        				 }
        	        			 }); // mainhashtag page 부분
        				 }//else부분			 
    				});
        		 }
        	 }); // mainhashtag부분
        	 
        	    // mainmaster 부분
        	 $.ajax({  
        		 url:"searchAjax_mainmastercount",
        		 data:{searchName : VsearchName},
        		 dataType:'json',
        		 success:function(data){
        			 $(data).each(function() {
        				 mastercount = this.count;
        				 
        				 if(mastercount == 0){
        					 $('.choiceVdiv4').empty();
        					 $('.divSearchChallenge4').empty();
        				 }else{
        					 $('#searchmastercount').val(mastercount);
        					 //alert('title count =>' + titlecount);
        					 $.ajax({
        						 url:"searchAjax_mainmaster",
        						 data:{searchName : VsearchName , count : mastercount},
        						 dataType:'json',
        						 success:function(data){
        							// var jsondata = JSON.stringify(data);
        				    			//alert('jsondata=>'+jsondata);
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
         			   		           		mastertimeResult = "챌린지종료";
         			   		          		   }else{
         			   			          			var distance = now - wj_chg_startdate; //진행중
         			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
         			   			          			//alert('distance => ' + distance);
         			   			          			//alert('distance => ' + days);
         			   			          		newtimeResult = "진행중 D+"+days;		   			    	        	 
         			   		        				}
         			   		           		 
      	   					   		        }else if(str_startdate == str_now){
      	   					   		   mastertimeResult = "D-DAY";
      	   					   		      			}else{
      	   					   		      				
      				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
      				   					   		      	newtimeResult = "모집마감";
      				   					   		            }else{
      				   					   		      		var distance = now - wj_chg_startdate; //모집중
      				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      				   					   		            //alert('distance => ' + distance);
      						   			          			//alert('distance => ' + days);
      						   			          	mastertimeResult = "모집중 D"+days;
      				   					   		       	  } 
      	   					   		      				
      	   					   		      			}
         					   		       
                		  	        	 
                		  				   if(listcount == 0){
                		  					 masterliststr += "리스트가 없습니다.";
                		  				   }else{
                		  					 masterliststr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
                		  					masterliststr += "<div class='divChatbotListImg'>";
                		  					masterliststr += "<a href='challengeDetail?chg_num="+item.chg_num+"' ><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
                		  					masterliststr += "<div class='chatbotUser_count'>";
                		  					masterliststr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
                		  					masterliststr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
                		  					masterliststr += "</div></div>";
                		  					masterliststr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+mastertimeResult+"</div></div>";
                		  					masterliststr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+result+"</a></div>";
                		  					
        	        		  				   if (item.hashtag_text == null ) {
                 		  					   } else {
                      		  					   var hashtag = item.hashtag_text.split(",");
                    		  					   for( var i in hashtag){
                    		  						 masterliststr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
                    		  					   }
              		  						   
                		  					   }
        	        		  				 masterliststr += "</div></div>";
                		  					   
                		  					   
                		  				   }
                		  				 //console.log('liststr=>'+liststr);   
                						});
                  		    			

         		  				      $('#masterchallengeList').append(masterliststr);
         		  				    
         		  				      
        						 }
        					 }); // mainmaster list 처리
        					 
        					 $.ajax({
        	        				 url:"searchAjax_mainmaster_page",
        	        				 data:{count : mastercount},
        	        				 dataType:'json',
        	        				 success:function(data){
        	        					   var choiceN = $('input:checkbox[name="masterchoiceV"]:checked').val();
        	        					   var orderN = $('input:checkbox[name="masterorderV"]:checked').val();
        	        					   console.log(choiceN);
        	        					 $(data).each(function(index,item) {
        	        						    if(item.startPage > item.blockSize){
        	        						    	masterlistpagestr += "<a onclick='masterpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
        	        						    }
        									   for(var k=item.startPage; k<=item.endPage; k++){
        										   masterlistpagestr += "<a onclick='masterpagingAction("+k+","+choiceN+","+orderN+")'>["+k+"]</a>";
        									  } 
        									   if(item.endPage < item.pageCnt){
        										   masterlistpagestr += "<a onclick='masterpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
        									   }
        								});
        	        					 $('#masterListPaging').append(masterlistpagestr);
        	        				 }
        	        			 }); // mainmaster page 부분
        				 }//else부분
        				 
    					 
    				});
        		 }
        	 }); // mainmaster부분
    		 
    		 
    	 } // else 부분
    	 
    	 
	});
function pagingAction(Vpage,Vchoice,Vorder) {
     	 
 		 
 		 
 		 Vsearchtitle = $('#searchname').val();
  		
  		 
  			 Vchoice = $('input[name="choiceV"]:checked').val();
  			 Vorder = $('input[name="orderV"]:checked').val();
  		 
  		  console.log("새로운초이스값  input 체크용=> " + Vchoice);
  		 $.ajax({
  			 url:"countsearchTitleNew",
  			 data:{searchName : Vsearchtitle , choice : Vchoice},
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
  			 			 url:"searchTitle_paging",
  			 			 data:{searchName : Vsearchtitle, count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
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
  						 url:"searchtitle_newpage",
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
 		 
 	
 	  
 	 
		 
		 
	} // maintitle부분
	
	function contentpagingAction(Vpage,Vchoice,Vorder) {
    	 
		 
		 
		    var Vsearchcontent = $('#searchname').val();
 		
 		 
 			 Vchoice = $('input[name="contentchoiceV"]:checked').val();
 			 Vorder = $('input[name="contentorderV"]:checked').val();
 		 
 		  console.log("새로운초이스값  input 체크용=> " + Vchoice);
 		 $.ajax({
 			 url:"countsearchcontentNew",
 			 data:{searchName : Vsearchcontent , choice : Vchoice},
 			 dataType:'json',
 			 success:function(data){
 				 $(data).each(function(){
 					 var Vcnt = this.count;
 					 $('#contentchallengeList').empty();
 			 		 $('#contentListPaging').empty();
 			 		 var contentlistpagingstr= "";
 				     var contentlistnewpagestr = "";
 				     // 변수선언하는것도 function안에 선언해줘야 잘먹네요
 			 		 $.ajax({
 			 			 url:"searchcontent_paging",
 			 			 data:{searchName : Vsearchcontent, count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
 			 			 dataType:'json',
 			 			 success:function(data){
 			 				 console.log("Vcnt => " +Vcnt);
 			 				 $(data).each(function(index , item) {
 			 					 
 			 					 var contentnewresult = "";
 				  	        	 var newcutlength = 15;
 				  	        	 var newmachim = "..";
 				  	        	 if(item.chg_title.length > newcutlength){
 				  	        		contentnewresult += item.chg_title.substr(0,newcutlength)+newmachim;    		   
 				  	        	 }else{
 				  	        		contentnewresult += item.chg_title;
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
 			   		           		contentnewtimeResult = "챌린지종료";
 			   		          		   }else{
 			   			          			var distance = now - wj_chg_startdate; //진행중
 			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
 			   			          			//alert('distance => ' + distance);
 			   			          			//alert('distance => ' + days);
 			   			          		contentnewtimeResult = "진행중 D+"+days;		   			    	        	 
 			   		        				}
 			   		           		 
	   					   		        }else if(str_startdate == str_now){
	   					   		   contentnewtimeResult = "D-DAY";
	   					   		      			}else{
	   					   		      				
				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
				   					   		      	contentnewtimeResult = "모집마감";
				   					   		            }else{
				   					   		      		var distance = now - wj_chg_startdate; //모집중
				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				   					   		            //alert('distance => ' + distance);
						   			          			//alert('distance => ' + days);
						   			          	contentnewtimeResult = "모집중 D"+days;
				   					   		       	  } 
	   					   		      				
	   					   		      			}
 					   		       
 			    	        	 if(Vcnt == 0){
 			    	        		contentlistnewpagestr += "리스트가 없습니다.";
 				  				   }else{
 				  					contentlistnewpagestr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
 				  					contentlistnewpagestr += "<div class='divChatbotListImg'>";
 				  					contentlistnewpagestr += "<a href='challengeDetail?chg_num="+item.chg_num+"' ><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
 				  					contentlistnewpagestr += "<div class='chatbotUser_count'>";
 				  					contentlistnewpagestr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
 				  					contentlistnewpagestr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
 				  					contentlistnewpagestr += "</div></div>";
 				  					contentlistnewpagestr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+contentnewtimeResult+"</div></div>";
 				  					contentlistnewpagestr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+contentnewresult+"</a></div>";
 				  					
 				  					   if (item.hashtag_text == null ) {
 				  					   } else {
 					  					   var hashtag = item.hashtag_text.split(",");
 					  					   for( var i in hashtag){
 					  						contentlistnewpagestr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
 					  					   }
 			  						   
 				  					   }
 				  					contentlistnewpagestr += "</div></div>";
 				  					   
 				  					   
 				  				   }
 				  				 //console.log('liststr=>'+liststr);   
 								});		    			
 							      $('#contentchallengeList').append(contentlistnewpagestr);
 			 			 } 			 
 			 		 });
 			 		 
 			 		$.ajax({
 						 url:"searchcontent_newpage",
 						 data:{count : Vcnt, page : Vpage},
 						 dataType:'json',
 						 success:function(data){
 							 $(data).each(function(index,item) {
 								    if(item.startPage > item.blockSize){
 								    	contentlistpagingstr += "<a onclick='contentpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
 								    }
 								   for(var k=item.startPage; k<=item.endPage; k++){
 									  contentlistpagingstr += "<a onclick='contentpagingAction("+k+","+Vchoice+","+Vorder+")'>["+k+"]</a>";
 								  } 
 								   if(item.endPage < item.pageCnt){
 									  contentlistpagingstr += "<a onclick='contentpagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
 								   }
 							});
 							 $('#contentListPaging').append(contentlistpagingstr);
 						 }
 					 });
 					  
 				 });
 			 }
 		 });
		 
	
	  
	 
		 
		 
	} // content paging 부분
	
	
	function hashtagpagingAction(Vpage,Vchoice,Vorder) {
   	 
		 
		 
	    var Vsearchhashtag = $('#searchname').val();
		
		 
			 Vchoice = $('input[name="hashtagchoiceV"]:checked').val();
			 Vorder = $('input[name="hashtagorderV"]:checked').val();
		 
		  console.log("새로운초이스값  input 체크용=> " + Vchoice);
		 $.ajax({
			 url:"countsearchhashtagNew",
			 data:{searchName : Vsearchhashtag , choice : Vchoice},
			 dataType:'json',
			 success:function(data){
				 $(data).each(function(){
					 var Vcnt = this.count;
					 $('#hashtagchallengeList').empty();
			 		 $('#hashtagListPaging').empty();
			 		 var hashtaglistpagingstr= "";
				     var hashtaglistnewpagestr = "";
				     // 변수선언하는것도 function안에 선언해줘야 잘먹네요
			 		 $.ajax({
			 			 url:"searchhashtag_paging",
			 			 data:{searchName : Vsearchhashtag, count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
			 			 dataType:'json',
			 			 success:function(data){
			 				 console.log("Vcnt => " +Vcnt);
			 				 $(data).each(function(index , item) {
			 					 
			 					 var hashtagnewresult = "";
				  	        	 var newcutlength = 15;
				  	        	 var newmachim = "..";
				  	        	 if(item.chg_title.length > newcutlength){
				  	        		hashtagnewresult += item.chg_title.substr(0,newcutlength)+newmachim;    		   
				  	        	 }else{
				  	        		hashtagnewresult += item.chg_title;
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
 			   		           		hashtagnewtimeResult = "챌린지종료";
 			   		          		   }else{
 			   			          			var distance = now - wj_chg_startdate; //진행중
 			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
 			   			          			//alert('distance => ' + distance);
 			   			          			//alert('distance => ' + days);
 			   			          		hashtagnewtimeResult = "진행중 D+"+days;		   			    	        	 
 			   		        				}
 			   		           		 
	   					   		        }else if(str_startdate == str_now){
	   					   		   hashtagnewtimeResult = "D-DAY";
	   					   		      			}else{
	   					   		      				
				   					   		      		if(item.chg_now_parti >= item.chg_capacity){
				   					   		      	hashtagnewtimeResult = "모집마감";
				   					   		            }else{
				   					   		      		var distance = now - wj_chg_startdate; //모집중
				   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				   					   		            //alert('distance => ' + distance);
						   			          			//alert('distance => ' + days);
						   			          	hashtagnewtimeResult = "모집중 D"+days;
				   					   		       	  } 
	   					   		      				
	   					   		      			}
 					   		       
			    	        	 if(Vcnt == 0){
			    	        		 hashtaglistnewpagestr += "리스트가 없습니다.";
				  				   }else{
				  					 hashtaglistnewpagestr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
				  					hashtaglistnewpagestr += "<div class='divChatbotListImg'>";
				  					hashtaglistnewpagestr += "<a href='challengeDetail?chg_num="+item.chg_num+"' ><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
				  					hashtaglistnewpagestr += "<div class='chatbotUser_count'>";
				  					hashtaglistnewpagestr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
				  					hashtaglistnewpagestr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
				  					hashtaglistnewpagestr += "</div></div>";
				  					hashtaglistnewpagestr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+hashtagnewtimeResult+"</div></div>";
				  					hashtaglistnewpagestr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+hashtagnewresult+"</a></div>";
				  					
				  					
				  					
				  					   if (item.hashtag_text == null ) {
				  					   } else {
					  					   var hashtag = item.hashtag_text.split(",");
					  					   for( var i in hashtag){
					  						 hashtaglistnewpagestr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
					  					   }
			  						   
				  					   }
				  					 hashtaglistnewpagestr += "</div></div>";
				  					   
				  					   
				  				   }
				  				 //console.log('liststr=>'+liststr);   
								});		    			
							      $('#hashtagchallengeList').append(hashtaglistnewpagestr);
			 			 } 			 
			 		 });
			 		 
			 		$.ajax({
						 url:"searchhashtag_newpage",
						 data:{count : Vcnt, page : Vpage},
						 dataType:'json',
						 success:function(data){
							 $(data).each(function(index,item) {
								    if(item.startPage > item.blockSize){
								    	hashtaglistpagingstr += "<a onclick='hashtagpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
								    }
								   for(var k=item.startPage; k<=item.endPage; k++){
									   hashtaglistpagingstr += "<a onclick='hashtagpagingAction("+k+","+Vchoice+","+Vorder+")'>["+k+"]</a>";
								  } 
								   if(item.endPage < item.pageCnt){
									   hashtaglistpagingstr += "<a onclick='hashtagpagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
								   }
							});
							 $('#hashtagListPaging').append(hashtaglistpagingstr);
						 }
					 });
					  
				 });
			 }
		 });
	 

  
 
	 
	 
} // hashtagpaging 부분
       
function masterpagingAction(Vpage,Vchoice,Vorder) {
  	 
	 
	 
    var Vsearchmaster = $('#searchname').val();
	
	 
		 Vchoice = $('input[name="masterchoiceV"]:checked').val();
		 Vorder = $('input[name="masterorderV"]:checked').val();
	 
	  console.log("새로운초이스값  input 체크용=> " + Vchoice);
	 $.ajax({
		 url:"countsearchmasterNew",
		 data:{searchName : Vsearchmaster , choice : Vchoice},
		 dataType:'json',
		 success:function(data){
			 $(data).each(function(){
				 var Vcnt = this.count;
				 $('#masterchallengeList').empty();
		 		 $('#masterListPaging').empty();
		 		 var masterlistpagingstr= "";
			     var masterlistnewpagestr = "";
			     // 변수선언하는것도 function안에 선언해줘야 잘먹네요
		 		 $.ajax({
		 			 url:"searchmaster_paging",
		 			 data:{searchName : Vsearchmaster, count : Vcnt , page : Vpage , choice : Vchoice , order : Vorder },
		 			 dataType:'json',
		 			 success:function(data){
		 				 console.log("Vcnt => " +Vcnt);
		 				 $(data).each(function(index , item) {
		 					 
		 					 var masternewresult = "";
			  	        	 var newcutlength = 15;
			  	        	 var newmachim = "..";
			  	        	 if(item.chg_title.length > newcutlength){
			  	        		masternewresult += item.chg_title.substr(0,newcutlength)+newmachim;    		   
			  	        	 }else{
			  	        		masternewresult += item.chg_title;
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
			   		           		masternewtimeResult = "챌린지종료";
			   		          		   }else{
			   			          			var distance = now - wj_chg_startdate; //진행중
			   			    	        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			   			          			//alert('distance => ' + distance);
			   			          			//alert('distance => ' + days);
			   			          		masternewtimeResult = "진행중 D+"+days;		   			    	        	 
			   		        				}
			   		           		 
 					   		        }else if(str_startdate == str_now){
 					   		   masternewtimeResult = "D-DAY";
 					   		      			}else{
 					   		      				
			   					   		      		if(item.chg_now_parti >= item.chg_capacity){
			   					   		      	newtimeResult = "모집마감";
			   					   		            }else{
			   					   		      		var distance = now - wj_chg_startdate; //모집중
			   					   		        	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			   					   		            //alert('distance => ' + distance);
					   			          			//alert('distance => ' + days);
					   			          	masternewtimeResult = "모집중 D"+days;
			   					   		       	  } 
 					   		      				
 					   		      			}
					   		       
		    	        	 if(Vcnt == 0){
		    	        		 masterlistnewpagestr += "리스트가 없습니다.";
			  				   }else{
			  					 masterlistnewpagestr += "<div class='divChatbotListBase' id='chatbotList"+index+"'>";
			  					masterlistnewpagestr += "<div class='divChatbotListImg'>";
			  					masterlistnewpagestr += "<a href='challengeDetail?chg_num="+item.chg_num+"' ><img class='divChatbotListImgsize' alt='' src='upload/mainIMG/"+item.chg_image+"'></a>";
			  					masterlistnewpagestr += "<div class='chatbotUser_count'>";
			  					masterlistnewpagestr += "<div class='divChatbotUser_count_img'><img alt='' src='teamtwo/img/wj_board_user_icon.png' class='chatbotUser_count_img'></div>";
			  					masterlistnewpagestr += "<div class='divChatbotUser_count'>"+item.chg_now_parti+"명</div>";
			  					masterlistnewpagestr += "</div></div>";
			  					masterlistnewpagestr += "<div class='chatbotListTimeFont'><div id='chatbotListTime'>"+masternewtimeResult+"</div></div>";
			  					masterlistnewpagestr += "<div class='divChatbotListTitle'><a href='challengeDetail?chg_num="+item.chg_num+"' class='divChatbotListTitleFont'>"+masternewresult+"</a></div>";
			  					
			  					   if (item.hashtag_text == null ) {
			  					   } else {
				  					   var hashtag = item.hashtag_text.split(",");
				  					   for( var i in hashtag){
				  						 masterlistnewpagestr += "<div class='divHashtag'>"+hashtag[i]+"</div>";
				  					   }
		  						   
			  					   }
			  					 masterlistnewpagestr += "</div></div>";
			  					   
			  					   
			  				   }
			  				 //console.log('liststr=>'+liststr);   
							});		    			
						      $('#masterchallengeList').append(masterlistnewpagestr);
		 			 } 			 
		 		 });
		 		 
		 		$.ajax({
					 url:"searchmaster_newpage",
					 data:{count : Vcnt, page : Vpage},
					 dataType:'json',
					 success:function(data){
						 $(data).each(function(index,item) {
							    if(item.startPage > item.blockSize){
							    	masterlistpagingstr += "<a onclick='masterpagingAction("+item.startPage-item.blockSize+","+choiceN+","+orderN+")'>[이전]</a>";
							    }
							   for(var k=item.startPage; k<=item.endPage; k++){
								   masterlistpagingstr += "<a onclick='masterpagingAction("+k+","+Vchoice+","+Vorder+")'>["+k+"]</a>";
							  } 
							   if(item.endPage < item.pageCnt){
								   masterlistpagingstr += "<a onclick='masterpagingAction("+item.startPage+item.blockSize+","+choiceN+","+orderN+")'>[다음]</a>";
							   }
						});
						 $('#masterListPaging').append(masterlistpagingstr);
					 }
				 });
				  
			 });
		 }
	 });
 



 
 
} // hashtagpaging 부분
       
</script>
<style type="text/css">
   
   a:link{color:black;  text-decoration: none;}
  a:visited{color:black;  text-decoration: none;}
  a:hover{color:black;  text-decoration: none;}
   
   
    .divNoChallenge{
     /*    margin-left: 400px; */
        width:800px;
    }
    
    
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
 
  .divSearchChallenge1{
   /*  margin-left: 400px; */
    width:800px;
 }
 
 .divSearchChallengeFont1{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divSearchChallenge2{
/*     margin-left: 400px; */
    width:800px;
 }
 
 .divSearchChallengeFont2{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divSearchChallenge3{
  /*   margin-left: 400px; */
    width:800px;
 }
 
 .divSearchChallengeFont3{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divSearchChallenge4{
  /*   margin-left: 400px; */
    width:800px;
 }
 
 .divSearchChallengeFont4{
    font-size: 25px;
    font-family: 'yg-jalnan';
 }
 
 .divSearchChallengeList{
  /*   margin-left: 400px; */
    width:830px;
 }
 
 .divSearchListBase{
    display:inline-block;
    vertical-align : top;
    width: 250px;
    height: 300px;
    margin-top : 20px;
    margin-right: 16.5px;
 }
 
 .divSearchListImg{
    position: relative;
    vertical-align: top;
    width:  249px;
    height: 180px;
 }
 
 .SearchUser_count{
    
    position: absolute;
    width:70px;
    height: 25px;
    background-color: black;
    border-radius: 30px;
    top: 10px;
    right: 10px;
 }
 
 .divSearchUser_count_img{
    margin-top:2.5px;
    margin-left:6px;
    display:inline-block;
    width:20px; 
    height:20px;
 }
 
 .SearchUser_count_img{
    width:20px; 
    height:20px;
    
 }
 
 .divSearchUser_count{
     display: inline-block;
     vertical-align:top;
     padding-top:5.5px;
     width: 30px;
     height: 25px;
     color: white;
    font-family: 'ChosunGu';
    font-size: 15px;
 }
 
 .divSearchListTitle{
    width: 249px;
    height: 30px;
 }
 
 .divSearchListTitleFont{
   font-family:'yg-jalnan';
    font-size:16px;
 }
 
  .divSearchListImgsize{
     width: 249px;
     height: 180px;
  }
 
 .choiceVdiv1{
/*     margin-left : 400px; */
    width:830px;
    font-family: 'ChosunGu';
  }
  .choiceVdiv2{
/*     margin-left : 400px; */
    width:830px;
    font-family: 'ChosunGu';
  }
  .choiceVdiv3{
/*     margin-left : 400px; */
    width:830px;
    font-family: 'ChosunGu';
  }
  .choiceVdiv4{
/*     margin-left : 400px; */
    width:830px;
    font-family: 'ChosunGu';
  }
  .divLoveChallengeList{
/*     margin-left : 400px; */
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
    /*  margin-left: 400px; */
    width:830px;
    text-align: center;
 }
 
 .choicediv1{
    display: inline-block;
    vertical-align: top;
 }
 
 .orderdiv1{
    display: inline-block;
    vertical-align: top;
    margin-left:300px;
 }
 
 .choicediv2{
    display: inline-block;
    vertical-align: top;
 }
 
 .orderdiv2{
    display: inline-block;
    vertical-align: top;
    margin-left:300px;
 }
 .choicediv3{
    display: inline-block;
    vertical-align: top;
 }
 
 .orderdiv3{
    display: inline-block;
    vertical-align: top;
    margin-left:300px;
 }
 .choicediv4{
    display: inline-block;
    vertical-align: top;
 }
 
 .orderdiv4{
    display: inline-block;
    vertical-align: top;
    margin-left:300px;
 }  
</style>
</head>
<body>
     <input type="hidden" id="searchname" name="searchname" value="${mainSearchName}">
     <input type="hidden" id="searchAllCnt" name="searchAllCnt" value="${searchAllCnt}">
     <input type="hidden" id="searchtitlecount" name="searchtitlecount">
     <input type="hidden" id="searchcontentcount" name="searchcontentcount">
     <input type="hidden" id="searchhashtagcount" name="searchhashtagcount">
     <input type="hidden" id="searchmastercount" name="searchmastercount">
	
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
    
    <!-- 모든 페이지에 들어가는 상단부분 end -->
    
     <div style="margin-top: 30px;"></div>
     <c:if test="${searchAllCnt == 0}">
          <div class="divNoChallenge">
             <img alt="" src="../wj/img/noChallenge.png" width="700px;" height="700px;">
     </div>
     </c:if>
     
     
     <div class="divSearchChallenge1">
        <div class="divSearchChallengeFont1"><b style="color:#9f6e54;">${mainSearchName}</b>
                                           <b style="color:#daa35b;">에 해당하는 </b>
                                           <b style="color:#9f6e54;">제목</b>
                                           <b style="color:#daa35b;">을 가진 챌린지</b>
                                           </div>
     </div>
     
     <div style="margin-top: 10px;"></div>
     
     <div class="choiceVdiv1">
         <div class="choicediv1">
             <input type="radio" id="choiceV" name="choiceV" value="1" checked="checked" onclick=" pagingAction(1,1,0);"> 전체
             <input type="radio" id="choiceV" name="choiceV" value="2" onclick=" pagingAction(1,2,0); "> 모집중
             <input type="radio" id="choiceV" name="choiceV" value="3" onclick=" pagingAction(1,3,0); "> 진행중
             <input type="radio" id="choiceV" name="choiceV" value="4" onclick=" pagingAction(1,4,0); "> 종료
         </div>
         <div class="orderdiv1">
             <input type="radio" id="orderV"  name="orderV" value="0" checked="checked" onclick=" pagingAction(1,2,0); ">일반
             <input type="radio" id="orderV" name="orderV" value="1" onclick=" pagingAction(1,2,1); ">최신순
             <input type="radio" id="orderV" name="orderV" value="2" onclick=" pagingAction(1,2,2); ">추천순
         </div>
      </div>
      <div class="divLoveChallengeList" id="challengeList"></div>
       <div class="divListPage" id="ListPaging"></div>
       
       <div style="margin-top: 10px;"></div>
     
     <div class="divSearchChallenge2">
        <div class="divSearchChallengeFont2"><b style="color:#9f6e54;">${mainSearchName}</b>
                                           <b style="color:#daa35b;">에 해당하는 </b>
                                           <b style="color:#9f6e54;">내용</b>
                                           <b style="color:#daa35b;">을 가진 챌린지</b>
                                           </div>
     </div>
     
     <div style="margin-top: 10px;"></div>
       
       <div class="choiceVdiv2">
         <div class="choicediv2">
             <input type="radio" id="contentchoiceV" name="contentchoiceV" value="1" checked="checked" onclick=" contentpagingAction(1,1,0);"> 전체
             <input type="radio" id="contentchoiceV" name="contentchoiceV" value="2" onclick=" contentpagingAction(1,2,0); "> 모집중
             <input type="radio" id="contentchoiceV" name="contentchoiceV" value="3" onclick=" contentpagingAction(1,3,0); "> 진행중
             <input type="radio" id="contentchoiceV" name="contentchoiceV" value="4" onclick=" contentpagingAction(1,4,0); "> 종료
         </div>
         <div class="orderdiv2">
             <input type="radio" id="contentorderV"  name="contentorderV" value="0" checked="checked" onclick=" contentpagingAction(1,2,0); ">일반
             <input type="radio" id="contentorderV" name="contentorderV" value="1" onclick=" contentpagingAction(1,2,1); ">최신순
             <input type="radio" id="contentorderV" name="contentorderV" value="2" onclick=" contentpagingAction(1,2,2); ">추천순
         </div>
      </div>
       
       <div class="divLoveChallengeList" id="contentchallengeList"></div>
       <div class="divListPage" id="contentListPaging"></div>
       
       <div style="margin-top: 10px;"></div>
     
     <div class="divSearchChallenge3">
        <div class="divSearchChallengeFont3"><b style="color:#9f6e54;">${mainSearchName}</b>
                                           <b style="color:#daa35b;">에 해당하는 </b>
                                           <b style="color:#9f6e54;">해쉬태그</b>
                                           <b style="color:#daa35b;">를 가진 챌린지</b>
                                           </div>
     </div>
     
     <div style="margin-top: 10px;"></div>
       
       <div class="choiceVdiv3">
         <div class="choicediv3">
             <input type="radio" id="hashtagchoiceV" name="hashtagchoiceV" value="1" checked="checked" onclick=" hashtagpagingAction(1,1,0);"> 전체
             <input type="radio" id="hashtagchoiceV" name="hashtagchoiceV" value="2" onclick=" hashtagpagingAction(1,2,0); "> 모집중
             <input type="radio" id="hashtagchoiceV" name="hashtagchoiceV" value="3" onclick=" hashtagpagingAction(1,3,0); "> 진행중
             <input type="radio" id="hashtagchoiceV" name="hashtagchoiceV" value="4" onclick=" hashtagpagingAction(1,4,0); "> 종료
         </div>
         <div class="orderdiv3">
             <input type="radio" id="hashtagorderV"  name="hashtagorderV" value="0" checked="checked" onclick=" hashtagpagingAction(1,2,0); ">일반
             <input type="radio" id="hashtagorderV" name="hashtagorderV" value="1" onclick=" hashtagpagingAction(1,2,1); ">최신순
             <input type="radio" id="hashtagorderV" name="hashtagorderV" value="2" onclick=" hashtagpagingAction(1,2,2); ">추천순
         </div>
      </div>
       
       <div class="divLoveChallengeList" id="hashtagchallengeList"></div>
       <div class="divListPage" id="hashtagListPaging"></div>
       
       
       <div style="margin-top: 10px;"></div>
     
     <div class="divSearchChallenge4">
        <div class="divSearchChallengeFont4"><b style="color:#9f6e54;">${mainSearchName}</b>
                                           <b style="color:#daa35b;">에 해당하는 </b>
                                           <b style="color:#9f6e54;">첼주</b>
                                           <b style="color:#daa35b;">인 챌린지</b>
                                           </div>
     </div>
     
     <div style="margin-top: 10px;"></div>
       
       <div class="choiceVdiv4">
         <div class="choicediv4">
             <input type="radio" id="masterchoiceV" name="masterchoiceV" value="1" checked="checked" onclick=" masterpagingAction(1,1,0);"> 전체
             <input type="radio" id="masterchoiceV" name="masterchoiceV" value="2" onclick=" masterpagingAction(1,2,0); "> 모집중
             <input type="radio" id="masterchoiceV" name="masterchoiceV" value="3" onclick=" masterpagingAction(1,3,0); "> 진행중
             <input type="radio" id="masterchoiceV" name="masterchoiceV" value="4" onclick=" masterpagingAction(1,4,0); "> 종료
         </div>
         <div class="orderdiv4">
             <input type="radio" id="masterorderV"  name="masterorderV" value="0" checked="checked" onclick=" masterpagingAction(1,2,0); ">일반
             <input type="radio" id="masterorderV" name="masterorderV" value="1" onclick=" masterpagingAction(1,2,1); ">최신순
             <input type="radio" id="masterorderV" name="masterorderV" value="2" onclick=" masterpagingAction(1,2,2); ">추천순
         </div>
      </div>
       
       <div class="divLoveChallengeList" id="masterchallengeList"></div>
       <div class="divListPage" id="masterListPaging"></div>
       </div><!-- out div -->
      <div><%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %></div>
     
</body>
</html>