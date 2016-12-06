
     $("#playerMove").click(function() {
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
											
											if(playerYval > 120 ){
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
											
											if(playerYval > 120 ){
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
											
											if(playerYval < 240 ){
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

	});
	