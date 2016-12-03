<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: Floxi ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="/html/image/x-icon">
<!-- style -->
<link href="/html/css/style.css" rel="stylesheet">
<!-- style -->
<!-- bootstrap -->
<link href="/html/css/bootstrap.min.css" rel="stylesheet">
<!-- responsive -->
<link href="/html/css/responsive.css" rel="stylesheet">
<!-- font-awesome -->
<link href="/html/css/font-awesome.min.css" rel="stylesheet">
<!-- Slider -->
<link href="/html/css/jquery.fadeshow-0.1.1.min.css" rel="stylesheet">

<link href="http://static.footballuser.com/stylesheets/footballuser.min.css?v2.09" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
    <!-- 아래것 -->
    <script type="text/javascript" src="/html/js/formation/formation.js"></script>
    <script type="text/javascript" src="http://static.footballuser.com/javascripts/jquery.ui.touch-punch-1.7.2.js"></script>
   <!-- 등록된 리스트 삭제하는 스크립트
    <script type="text/javascript" src="http://static.footballuser.com/javascripts/chosen.jquery.min.js"></script>
 -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- 포메이션 선택 Select박스 -->

 <script type="text/javascript">
    function selectFormation(){
    	var tactics_num =$("#formationType").val();
    	$.getJSON("/formationList/get?tactics_num="+tactics_num, function(data) {
    		
    		//경기장내 선수 출력 
    		var fieldData ="";
    		
    		$(data).each(
    			function() {
    			  	var location = this[12];
    				var locationArray = location.split(',');
    				var playerLeft = locationArray[0];
    				var playerTop = locationArray[1];
    				
    				var formationType ="";
    				var formationVal = this[9];
    				if(formationVal =="1"){
    					formationType ="(FW)";
    				}else if(formationVal =="2"){
    					formationType ="(MF)";
    				}else if(formationVal =="3"){
    					formationType ="(DF)";
    				}else{
    					formationType ="(GK)";
    				}
    				
    				if(location != "0"){
    				fieldData +=  "<div class=\"dropped_player "+ this[2] +" ui-draggable formation"+this[13] +" ui-draggable-handle\" style=\"left: "+playerLeft+"; top: "+playerTop+"; position: absolute;\">"
    					+ "<img class=\"dropped_shirt\" src=\"http://www.footballuser.com/assets/images/shirts/_1.png\">"
						+"<div class=\"dropped_name\" id="+this[2]+">"
						+"<a id="+this[1]+" style=\"color:white; text-align: center;\">"+this[2]+formationType+"</a>"
						+"</div>"
						+"</div>"
    				}
			});
    		$("#field").empty();
    		var fieldImage = "<img id=\"field_image\" height=\"513\" width=\"316\" src=\"/html/images/formation/nomal.PNG\"/>";
    		$("#field").append(fieldImage);
    		$("#field").append(fieldData);
    		
    		
    		// 교체선수  리스트 출력
    		var changeList 	= "<tbody style=\"color: yellow; font-size: 20px; \">"
				+"<tr>"
				+"<td height=\"25\" align=\"left\" class=\"player_header\">"
				+"<strong style=\"color: white;\">Name</strong>"
				+"</td>"
				+"<td height=\"25\" align=\"right\" class=\"player_header\">"
				+"<strong style=\"color: white;\">교체 선수 정보</strong>"
				+"</td>"
				+"</tr>";

			$(data).each(
			function() {
				
				if(this[10] != "0"){
					changeList 	+="<tr><td class=\"player_row\"><div class="+this[2]+" id="+this[1]+" style=\"padding-bottom: 3%; padding-top: 3%;\"><strong>"+this[2]+"</strong></div></td><td align=\"center\" class=\"player_row\"><a href=\"#\" class=\"delete_player no_underline\"><strong style=\"color: white;\">상세보기</strong></a></td></tr>"
				}
			});
	
			changeList +="</tbody>";
			$("#change_table").empty();
			$("#change_table").append(changeList);
			
			//후보선수 명단 리스트 출력
			
			var venchList 	= "<tbody style=\"color: yellow; font-size: 20px; \">"
				+"<tr>"
				+"<td height=\"25\" align=\"left\" class=\"player_header\">"
				+"<strong style=\"color: white;\">Name</strong>"
				+"</td>"
				+"<td height=\"25\" align=\"right\" class=\"player_header\">"
				+"<strong style=\"color: white;\">후보 선수 정보</strong>"
				+"</td>"
				+"</tr>";
				
			$(data).each(
					function() {
						var location = this[12];
						if(location == "0"){
						venchList +="<tr><td class=\"player_row\"><div class="+this[2]+" id="+this[1]+" style=\"padding-bottom: 3%; padding-top: 3%;\"><strong>"+this[2]+"</strong></div></td><td align=\"center\" class=\"player_row\"><a href=\"#\" class=\"delete_player no_underline\"><strong style=\"color: white;\">상세보기</strong></a></td></tr>"
						}
					});
			venchList +="</tbody>";
			
			$("#player_table").empty();
			$("#player_table").append(venchList);
		})
    	
    };
    </script>
    
    <!-- 다시 지정 위치로 -->
    <script type="text/javascript">
    function gobackPlayer() {
    	var tactics_num =$("#formationType").val();
    	$.getJSON("/formationList/get?tactics_num="+tactics_num, function(data) {
    		//경기장내 선수 출력 
    		var fieldData ="";
    		$(data).each(
    			function() {
    			  	var location = this[12];
    				var locationArray = location.split(',');
    				var playerLeft = locationArray[0];
    				var playerTop = locationArray[1];
    				
    				var formationType ="";
    				var formationVal = this[9];
    				if(formationVal =="1"){
    					formationType ="(FW)";
    				}else if(formationVal =="2"){
    					formationType ="(MF)";
    				}else if(formationVal =="3"){
    					formationType ="(DF)";
    				}else{
    					formationType ="(GK)";
    				}
    				
    				if(location != "0"){
    				fieldData +=  "<div class=\"dropped_player "+ this[2] +" ui-draggable formation"+this[13] +" ui-draggable-handle\" style=\"left: "+playerLeft+"; top: "+playerTop+"; position: absolute;\">"
    					+ "<img class=\"dropped_shirt\" src=\"http://www.footballuser.com/assets/images/shirts/_1.png\">"
						+"<div class=\"dropped_name\" id="+this[2]+">"
						+"<a id="+this[1]+" style=\"color:white; text-align: center;\">"+this[2]+formationType+"</a>"
						+"</div>"
						+"</div>"
    				}
			});
    		$("#field").empty();
    		var fieldImage = "<img id=\"field_image\" height=\"513\" width=\"316\" src=\"/html/images/formation/nomal.PNG\"/>";
    		$("#field").append(fieldImage);
    		$("#field").append(fieldData);
		})
		
	}
    
    </script>
    
    <!-- 포메이션별 선수이동 애니메이션 -->
    <script type="text/javascript">
    function playerMove() {
    	var tactics_num =$("#formationType").val();
    	
		$.getJSON("/formationList/get?tactics_num="+tactics_num, function(data) {
			
			$(data).each(
					function() {
						var location = this[12];
	    				var locationArray = location.split(',');
	    				var playerLeft = locationArray[0];
	    				var playerTop = locationArray[1];
	    				var leftArray = playerLeft.split('p');
	    				var topArray = playerTop.split('p');
	    				
	    				var leftVal = leftArray[0];
	    				var topVal = topArray[0];
						 var formationNum = this[13];
						 
						 var leftValInt = parseInt(leftVal);
						 var topValInt = parseInt(topVal);
						 
						 //343 포메이션 전술이동
						 if(formationNum =="1"){
								
							 if((topValInt < 190 )){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
								  
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if((playerYval < 222)){
											$(playername).css("top",moveYplus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
										 
							 }
							 
							 
							 if((topValInt < 340) && (topValInt > 288)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
								  
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if((playerYval > 140)){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 170) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
										 
							 }
							  
						 }
						 
						 
						 //352 포메이션 전술이동
						 if(formationNum =="2"){
								
							 if((1< leftValInt)&&(leftValInt < 50)  && (topValInt < 360)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
								  
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if((playerYval > 135)){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 200) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
										 
							 }
							 
							 if((245 < leftValInt) && (topValInt < 360)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
								  
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if((playerYval > 135)){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 200) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
										 
							 }
							 
							
							  
						 }
						 
						 //41212 포메이션 전술이동
						 else if(formationNum =="3"){
								
							 if((1 < leftValInt) && (leftValInt < 60) && (topValInt < 195)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
								  
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if((playerYval > 120) || (playerXval < 100) ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("left",moveXplus+"px");
											stop += 1;
											}
											
											 if(stop == 60) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
										 
							 }

							 if((235 < leftValInt) && (topValInt < 195)){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								  
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if((playerYval > 120) || (playerXval < 210)){
										$(playername).css("top",moveYminus+"px");
										$(playername).css("left",moveXminus+"px");
										stop += 1;
										}
										
										if(stop == 50) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
								   
							 }
							 
							 if( (topValInt < 280) && (leftValInt > 125) && (leftValInt < 165)){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if(playerYval > 80 ){
										$(playername).css("top",moveYminus+"px");
										stop += 1;
										}
										
										if(stop == 150) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
								   
							 }
							 
						 
							 if( (topValInt <370) && (topValInt > 325) && (leftValInt > 135) &&(leftValInt < 168)){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if(playerYval > 255 ){
										$(playername).css("top",moveYminus+"px");
										stop += 1;
										}
										
										if(stop == 70) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
								   
							 }
							  
							 
							 if( (topValInt <316) && (topValInt > 270) && (leftValInt > 59) &&(leftValInt < 85)){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if(playerYval > 220 ){
										$(playername).css("top",moveYminus+"px");
										$(playername).css("top",moveYminus+"px");
										$(playername).css("top",moveYminus+"px");
										$(playername).css("top",moveYminus+"px");
										$(playername).css("top",moveYminus+"px");
										$(playername).css("top",moveYminus+"px");
										$(playername).css("left",moveXminus+"px");
										stop += 1;
										}
										
										if(stop == 50) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
								   
							 }
							 
							 if((topValInt <316) && (topValInt > 270) && (leftValInt > 207) &&(leftValInt < 236)){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if(playerYval > 220 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
										$(playername).css("left",moveXplus+"px");
										stop += 1;
										}
										
										if(stop == 50) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
								   
							 }
							   
						 }
						 
						 // 4222 포메이션 전술이동
						 else if(formationNum =="4"){
							 if((1 < leftValInt) && (leftValInt < 55)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 150 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 300) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }

							 if(leftValInt > 247){
								  var playername = "."+this[2];
								  var start;
								  var stop = 0;
								  start = setInterval(function () {
									 
										var playerX = $(playername).css("left");
										var playerY = $(playername).css("top");
										
										var playerXval = parseInt(playerX);
										var playerYval = parseInt(playerY);
										
										var step= 1;
										var moveXplus = parseInt(playerX)+step;
										var moveXminus = parseInt(playerX)-step;
										var moveYplus = parseInt(playerY)+step;
										var moveYminus = parseInt(playerY)-step;
										
										if(playerYval > 150 ){
										$(playername).css("top",moveYminus+"px");
										stop += 1;
										}
										
										if(stop == 300) {
									        clearInterval(start);  // --- (2) 타이머 중단
									    }
									
								},10);
									
							 }
						 }
						 
						 
						 // 4231 포메이션 전술이동
						 else if(formationNum =="5"){
							 if((leftValInt > 1) &&(leftValInt <61) && (topValInt <292)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 145 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 120) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
							 }
							 
							 if((leftValInt > 232) && (topValInt <292)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 145 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 120) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
							 }
							 
							 if((topValInt <190)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval < 210 ){
											$(playername).css("top",moveYplus+"px");
											$(playername).css("left",moveXminus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
							 }
							 
							 
							 if((topValInt <290) && (topValInt > 240) && (leftValInt > 132) &&(leftValInt < 163)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 210 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("left",moveXplus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
							 }

						 }
						 
						// 4321 포메이션 전술이동
						 else if(formationNum =="6"){
							 if((topValInt <280) && (topValInt > 235) && (leftValInt > 98) &&(leftValInt < 131)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 200 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");	
											$(playername).css("left",moveXminus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 if((topValInt <280) && (topValInt > 235) && (leftValInt > 175) &&(leftValInt < 206)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 200 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("left",moveXplus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 
							 if((topValInt <370) && (topValInt > 325) && (leftValInt > 71) &&(leftValInt < 98)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 250 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("left",moveXplus+"px");
											stop += 1;
											}
											
											 if(stop == 100) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 
							 if((topValInt <370) && (topValInt > 325) && (leftValInt > 210) &&(leftValInt < 240)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 250 ){
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("top",moveYminus+"px");
											$(playername).css("left",moveXminus+"px");
											stop += 1;
											}
											
											 if(stop == 100) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 if((topValInt <472) && (topValInt > 425) && (leftValInt > 35) &&(leftValInt < 61)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 350 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 100) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 
							 if((topValInt <472) && (topValInt > 425) && (leftValInt > 249)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 350 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 100) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }

						 }
						 
						// 433 포메이션 전술이동
						 else if(formationNum =="7"){
							 if((topValInt <343) && (1 < leftValInt) && (leftValInt < 75)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 130 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 35) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }
							 
							 
							 if((topValInt <343) && (214 < leftValInt)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 130 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 35) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }

						 }
						 
						// 442 포메이션 전술이동
						 else if(formationNum =="8"){
							 if((1<leftValInt) && (topValInt < 462)){
								 var playername = "."+this[2];
								 var start;
								 var stop = 0;
										start = setInterval(function() {
											
											//console.log(playername);
											var playerX = $(playername).css("left");
											var playerY = $(playername).css("top");
											
											var playerXval = parseInt(playerX);
											var playerYval = parseInt(playerY);
											
											var step= 1;
											var moveXplus = parseInt(playerX)+step;
											var moveXminus = parseInt(playerX)-step;
											var moveYplus = parseInt(playerY)+step;
											var moveYminus = parseInt(playerY)-step;
											
											if(playerYval > 100 ){
											$(playername).css("top",moveYminus+"px");
											stop += 1;
											}
											
											 if(stop == 50) {
											        clearInterval(start);  // --- (2) 타이머 중단
											    }
										},10);
								 
							 }

						 }
						
			});
			
		})

	};
    </script>
        
    <!-- 포메이션삭제  + 전술 삭제 -->
    <script type="text/javascript">
    function deleteFormation() {
  
    	var tacticsNum = $("#formationType").val();
		
		// form
		var form = document.createElement("form");     
		form.setAttribute("method","post");                    
		form.setAttribute("action","/formation/delete");        
		document.body.appendChild(form);                        
		
		//input
		var inputTacticsNum = document.createElement("input");  
		inputTacticsNum.setAttribute("type", "hidden");                 
		inputTacticsNum.setAttribute("name", "tacticsNum");                        
		inputTacticsNum.setAttribute("value", tacticsNum);                          
		form.appendChild(inputTacticsNum);
		
		//폼전송
		form.submit();  
		
	}
    </script>

</head>

<body>

<!-- slider -->
<div class="background"></div>
<!-- slider -->

<!-- side bar --> 
<jsp:include page="include/side.jsp"/>

<!-- header -->
<jsp:include page="include/header.jsp"/>

<!-- 내용 -->

<div id="container">
        <div class="content">
            

<!-- 아이콘 -->
<div class="more_bottomspaced" style="display: none;" >
    <div class="left" >
    <div id="shirts" class="left_padded more_topspaced" style="height:220px;width:316px; overflow:auto">
        
        <img id="_1.png" class="active_shirt shirt" src="http://static.footballuser.com/images/shirts/_1.png" alt="" />
    </div>
    </div>
    <div class="left" style="margin-left:50px; margin-top:10px; ">
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- Create - 300x250 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:300px;height:250px"
             data-ad-client="ca-pub-7277752776532550"
             data-ad-slot="8851099880"></ins>
    </div>
</div>



<div class="bottomspaced">
    <div class="left">
     <h3 style="color: white;"><b id="gg">경기 정보</b></h3>
    <!-- 동적으로 바뀌어야 되는 경기일정 . -->
        <select class="col-md-12" id="formationType" onchange="selectFormation();">
                <option value="not" selected="selected">경기 일정을 선택하세요</option>
                <!-- ㅇㅇㅇㅇㅇ -->
                <c:forEach var="scheduleList" items="${scheduleList }">
                <c:choose >
				
				<c:when test="${scheduleList.get(2) =='0'}">
				<option value="${scheduleList.get(1)}">${scheduleList.get(3)} ${scheduleList.get(4)} (전반)</option>
				</c:when>
				
				<c:otherwise>
				<option value="${scheduleList.get(1)}">${scheduleList.get(3)} ${scheduleList.get(4)} (후반)</option>
				</c:otherwise>
				
				</c:choose>
				</c:forEach>
				</select>
				
				
 
            <div id="field" class="more_topspaced">
                
                
				<img id="field_image" height="513" width="316" src="/html/images/formation/nomal.PNG" alt="" />
                <!-- 이곳에  등록된 선수 리스트 출력 하기 -->
                
				
            </div>
    </div>
    <div class="left super_leftspaced">
    <h3 style="color: white;"><b>후보 선수 명단</b></h3>
        
        <div id="player_list" class="player_list" style="height:250px;">
            <table id="player_table" cellspacing="0" cellpadding="0" border="0" width="378">
                <tbody style="color: yellow; font-size: 20px; ">
                    <tr>
                        <td height="25" align="left" class="player_header">
                            <strong style="color: white;">Name</strong>
                        </td>
                        <td height="25" align="right" class="player_header">
                            <strong style="color: white;">후보 선수 정보</strong>
                        </td>
                        
                     </tr>
                     
                     <!-- 후보 선수 명단 리스트 불러올때 여기로 불러오면된다.  -->
                    
                </tbody>
            </table>
        </div>
        
         <h3 style="color: white;"><b>교체 선수 명단</b></h3>
        
              
        <div id="player_list" class="player_list" style="height:250px;">
            <table id="change_table" cellspacing="0" cellpadding="0" border="0" width="378">
                <tbody style="color: yellow; font-size: 20px; ">
                    <tr>
                        <td height="25" align="left" class="player_header">
                            <strong style="color: white;">Name</strong>
                        </td>
                        <td height="25" align="right" class="player_header">
                            <strong style="color: white;">교체 선수 정보</strong>
                        </td>
                        
                     </tr>
                     
                     <!-- 후보 선수 명단 리스트 불러올때 여기로 불러오면된다.  -->
                </tbody>
            </table>
        </div>
        
        
    </div>
    <br class="clear" />
</div>

<!-- <a id="allPlayerList" style="color: white;"><h1>경기장내에 있는 선수 정보 출력</h1> </a> <br> -->

<a id="playerMove" style="color: white;" onclick="playerMove();"><h1>전술이동</h1></a>
<a id="gobackPlayer" style="color: white;" onclick="gobackPlayer();"><h1>지정된 위치로</h1></a>

<div class="super_bottomspaced" style="text-align: center;">
    <p>
        <input class="button" type="button" value="수정" />
        <input class="button" type="button" value="삭제" onclick="deleteFormation();">
        <input class="button" type="button" value="홈으로">
    </p>
</div>
        </div>
    </div>

<!-- footer -->
<jsp:include page="include/footer.jsp"/>

<script type="text/javascript" src="/html/js/background.cycle.js"></script> 
<script type="text/javascript" src="/html/js/background.cycle-custom.js"></script> 


</body>
</html>