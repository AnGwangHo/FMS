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
<title>:: 포메이션 목록 ::</title>
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
<!-- modal -->
<link href="/html/css/formationListcss/formationListModal.css" rel="stylesheet">

<link rel="stylesheet" href="/html/css/formationListcss/jquery.rateyo.min.css"/>

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
  
 <style>
  .modal-header, h4, .close {
      background-color: #5cb85c;
      color:white !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  </style>
  
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
						+"<a id="+this[0]+" style=\"color:white; text-align: center;\" onclick=\"getplayer("+this[0]+");\">"+this[2]+formationType+"</a>"
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
						venchList +="<tr><td class=\"player_row\"><div class="+this[2]+" id="+this[1]+" style=\"padding-bottom: 3%; padding-top: 3%;\"><strong>"+this[2]+"</strong></div></td><td align=\"center\" class=\"player_row\"><a class=\"delete_player no_underline\" onclick=\"getplayer("+this[0]+");\"><strong style=\"color: white;\">상세보기</strong></a></td></tr>"
						}
					});
			venchList +="</tbody>";
			
			$("#player_table").empty();
			$("#player_table").append(venchList);
		})
    	
    };
    </script>
    
    <script type="text/javascript">
    
    function getplayer(member_num) {
    	document.getElementById('myModal').style.display = "block";
    	var tactics_num =$("#formationType").val();
    	console.log(member_num);
    	$.getJSON("/formationList/getPlayer?tactics_num="+tactics_num+"&member_num="+member_num, function(data) {
    		mainPositionVal = "";
    		subPositionVal = "";
    		foot = "";
    		if(data[5] == "1"){
    			mainPositionVal = "공격수(FW)";
    		}else if(data[5] == "2"){
    			mainPositionVal = "미드필더(MF)";
    		}else if(data[5] == "3"){
    			mainPositionVal = "수비수(DF)";
    		}else if(data[5] == "4"){
    			mainPositionVal = "골키퍼(GK)";
    		}
    		
    		if(data[6] == "1"){
    			subPositionVal = "공격수(FW)";
    		}else if(data[6] == "2"){
    			subPositionVal = "미드필더(MF)";
    		}else if(data[6] == "3"){
    			subPositionVal = "수비수(DF)";
    		}else if(data[6] == "4"){
    			subPositionVal = "골키퍼(GK)";
    		}
    		
    		if(data[4] == "0"){
    			foot = "LEFT";
    		}else if(data[4] == "1"){
    			foot = "RIGHT";
    		}else if(data[4] == "2"){
    			foot = "ALL";
    		}
    	
    		var member_name = data[0];
 			var member_age = data[1];
 			var member_height = data[2];
 			var member_weight = data[3];
 			var member_foot = foot;
 			var mainPosition = mainPositionVal;
 			var subPosition = subPositionVal;
 			var comment = data[7];
 			var grade = data[8];
 			$("#modalPlayerName").text(member_name);
 			$("#modalPlayerAge").text(member_age);
 			$("#modalPlayerHeight").text(member_height);
 			$("#modalPlayerWeight").text(member_weight);
 			$("#modalPlayerFoot").text(member_foot);
 			$("#modalPlayerMainP").text(mainPosition);
 			$("#modalPlayerSubP").text(subPosition);
 			$("#modalPlayerComment").text(comment);
 			
 			var modalTacticsNum = document.getElementById("modalTacticsNum");
 			modalTacticsNum.value = tactics_num;
 			var modalMemberNum = document.getElementById("modalMemberNum");
 			modalMemberNum.value = member_num;
 			
 			var readOnly = $("#rateYo").rateYo("option", "rating");
 			
 			$("#rateYo").rateYo("option", "rating", grade); 
 			
 			var gradeInput = document.getElementById("gradeInput");
 			gradeInput.value =grade;
 			
    	});
			
	}
    
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
						+"<a id="+this[0]+" style=\"color:white; text-align: center;\" onclick=\"getplayer("+this[0]+");\">"+this[2]+formationType+"</a>"
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
<!-- <div class="background"></div> -->
<!-- slider -->

<!-- side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

<!-- 내용 -->

 <!-- title image -->
<div align="center">
	<img src="/html/images/formation.png" style="margin-top:20px; margin-bottom:20px; height: 50px">
</div>

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


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
     <div class="modal-content">
     
        <div class="modal-header" style="padding:25px 50px;">
          <button type="button" class="close" id="modalCloseBtn" data-dismiss="modal">&times;</button>
          <h4>선수 상세정보</h4>
        </div>
        
        <div class="modal-body" style="padding:40px 50px;">
        
          
            <div >
              <label ><strong style="font-size: 25px; padding: 20px;">이름 :</strong></label>
              <label ><strong id="modalPlayerName" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">홍길동</strong></label>
              
              <label ><strong style="font-size: 25px; padding: 20px;">나이 : </strong></label>
              <label  ><strong id="modalPlayerAge" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">26</strong></label>
              
            </div>
            
            <div>
              <label ><strong style="font-size: 25px; padding: 20px;">신장 :</strong></label>
              <label ><strong id="modalPlayerHeight" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">185CM</strong></label>
              
              <label ><strong style="font-size: 25px; padding: 20px;">체중 : </strong></label>
              <label ><strong id="modalPlayerWeight" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">70KG</strong></label>
              
            </div>
            
            <div>
              <label ><strong style="font-size: 25px; padding: 20px;">Stronger Foot :</strong></label>
              <label ><strong id="modalPlayerFoot" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">LEFT</strong></label>
              
            </div>
            
            <div>
              <label ><strong style="font-size: 25px; padding: 20px;">메인 포지션 : </strong></label>
              <label ><strong id="modalPlayerMainP" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">공격수(FW)</strong></label>
      
            </div>
            
             <div>
              <label ><strong style="font-size: 25px; padding: 20px;">서브 포지션 : </strong></label>
              <label ><strong id="modalPlayerSubP" style="font-size: 25px; padding-left: 10px; padding-right: 40px;">미드필더(MF)</strong></label>
              
            </div>
            
            <form action="/formationList" method="post">
             <div>
              <label  style="display: inline;"><strong  style="font-size: 25px; padding: 20px; display: inline;">별점 </strong></label>
              
              <input type="text" id="gradeInput" name="gradeInput" value="">
              
              <div  id="rateYo"></div>
              
            </div>
            
            
            <div >
             <input type="hidden" id="modalTacticsNum" name="modalTacticsNum" value="" >
            <input type="hidden" id="modalMemberNum" name="modalMemberNum" value="" >
              <label ><strong style="font-size: 25px; padding: 20px;">코멘트 </strong></label>
            </div>
            
             <div style="padding-left: 20px;">
              <textarea id="modalPlayerComment" name="modalPlayerComment" rows="5px;" cols="50px;" style=" resize: none;" placeholder="코멘트 입력" ></textarea>
              
            </div>
            <div style="padding-left: 50%;">
            <button type="submit" class="btn btn-primary btn-default pull-center" data-dismiss="modal">등록</button>
          </div>
          </form>
        </div>
        
        <div class="modal-footer">
          
        </div>
        
      </div>

</div>

<!-- <a id="allPlayerList" style="color: white;"><h1>경기장내에 있는 선수 정보 출력</h1> </a> <br> -->

<a id="playerMove" style="color: white;"><h1>전술이동</h1></a>
<a id="gobackPlayer" style="color: white;" onclick="gobackPlayer();"><h1>기본 위치로</h1></a>


<div class="super_bottomspaced" style="text-align: center; margin-bottom: 50px;">
    <p>
        <input class="button" type="button" value="수정" />
        <input class="button" type="button" value="삭제" onclick="deleteFormation();">
        <input class="button" type="button" value="홈으로">
    </p>
</div>
    
        </div>
    </div>

<!-- footer -->
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript" src="/html/js/background.cycle.js"></script> 
<script type="text/javascript" src="/html/js/background.cycle-custom.js"></script>
<script type="text/javascript" src="/html/js/formation/formationListModal.js"></script> 
<script type="text/javascript" src="/html/js/formation/playerMove.js"></script> 

 <script type="text/javascript" src="/html/js/formation/jquery.min.js"></script>    
 <script type="text/javascript" src="/html/js/formation/jquery.rateyo.min.js"></script>
    
    <script type="text/javascript">
    
    $(function () {
    	 
    	  $("#rateYo").rateYo({
    	    rating: 0,
    	    spacing: "10px"
    	  }).on("rateyo.change", function (e, data) {
    	        
    		  var gradeInput = document.getElementById("gradeInput");
    			gradeInput.value =data.rating;
    	      });
    	});
    
    </script>
    
</body>
</html>