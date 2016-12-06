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
<title>:: 포메이션 ::</title>
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
    <script type="text/javascript" src="/html/js/formation/playerMove.js"></script>
    <script type="text/javascript" src="http://static.footballuser.com/javascripts/jquery.ui.touch-punch-1.7.2.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "input" ).checkboxradio();
    $( "fieldset" ).controlgroup();
  } );
  </script>
  
  <!-- 포메이션 선택 Select박스 -->
 <script type="text/javascript">
    function selectFormation(){
    	$("#field_image").attr("src","/html/images/formation/"+$("#formationType").val());
    };
    </script>
    
    <script type="text/javascript">
    
    /**
	 * 등록된 선수의 식별가능한 아이디와 좌표값(X,Y) 저장한 드래그 객체 전체를 뜻함.
	 * 기능 : 리스트에서 해당 객체를 드래그해서 경기장으로 옮길시 x y 좌표값을 갖고 등록됨.
	 * 등록할때 필용한것 : 하나하나 객체를 객체배열로 담아서 전체리스트를 등록할 컨트롤러로 보내 디비에 등록한다.
	 * */
    function addPlayer() {
		var scheduleName = $("#scheduleName").text();
		var gameType = $(':radio[name="radio-1"]:checked').val();
		var formationType = $("#formationType").val();


		//경기장에 등록된 선수 객체배열
		var playerArray = [];
		
		$.each($(".dropped_player"), function() {
			var playerObject = [];
			var playerFormationType ="";
			var left = $(this).css("left");
			var top = $(this).css("top");
			
			var parseTop = parseInt(top);
			
			if(parseTop < 190){
				playerFormationType = "FW";
			}else if(190 < parseTop && parseTop < 400){
				playerFormationType = "MF";
			}else if(400 < parseTop && parseTop < 500){
				playerFormationType = "DF";
			}else if(parseTop > 500){
				playerFormationType = "GK";
			}else{
				playerFormationType ="NOT";
			}
			
			playerObject.push(scheduleName);
			playerObject.push($(this).text());
			playerObject.push(left);
			playerObject.push(top);
			playerObject.push(playerFormationType);
			playerObject.push(formationType);
			playerObject.push(gameType);
			
			playerArray.push(playerObject);
			
		})
    	
		//후보선수 리스트 배열
    	var benchPlayer = [];
		$.each($(".player"), function() {
			//console.log($(this).text());
			benchPlayer.push($(this).text());
		})
		
		// form
		var form = document.createElement("form");     
		form.setAttribute("method","post");                    
		form.setAttribute("action","/formation");        
		document.body.appendChild(form);                        
		 
		//input
		var inputPlayerArray = document.createElement("input");  
		inputPlayerArray.setAttribute("type", "hidden");                 
		inputPlayerArray.setAttribute("name", "playerArray");                        
		inputPlayerArray.setAttribute("value", playerArray);                          
		form.appendChild(inputPlayerArray);
		
		//input
		var inputBenchPlayer = document.createElement("input");  
		inputBenchPlayer.setAttribute("type", "hidden");                 
		inputBenchPlayer.setAttribute("name", "benchPlayer");                        
		inputBenchPlayer.setAttribute("value", benchPlayer);                          
		form.appendChild(inputBenchPlayer);
		 
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
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

<!-- 내용 -->

 <!-- title image -->
<div align="center">
	<img src="/html/images/formation_admin.png" style="margin-top:20px; margin-bottom:20px; height: 50px">
</div>

<div id="container" >
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



<div class="bottomspaced" >
    <div class="left">
    <!-- 스케줄 제목이 나오는곳 -->
        <h3 style="color: white;"><b id="scheduleName">ㅎㅎㅎ</b></h3>
        
        
        
        <select class="col-md-5" id="formationType" onchange="selectFormation()">
                <option value="nomal.PNG" selected="selected">기본</option>
				<option value="343.PNG">3-4-3</option>
				<option value="352.PNG">3-5-2</option>
				<option value="41212.PNG">4-1-2-1-2</option>
				<option value="4222.PNG">4-2-2-2</option>
				<option value="4231.PNG">4-2-3-1</option>
				<option value="4321.PNG">4-3-2-1</option>
				<option value="433.PNG">4-3-3</option>
				<option value="442.PNG">4-4-2</option>
				</select>
				
 
  <fieldset class="col-md-7" style="display: inline;">
    <label for="radio-1">전반</label>
    <input type="radio" name="radio-1" id="radio-1" value="전반">
    <label for="radio-2">후반</label>
    <input type="radio" name="radio-1" id="radio-2" value="후반">
  </fieldset>
				
        
        
            <div id="field" class="more_topspaced">
                <img id="field_image" height="513" width="316" src="/html/images/formation/nomal.PNG" alt="" />
            </div>
    </div>
    <div class="left super_leftspaced">
    
    <h3 style="color: white;"><b>선수 명단</b></h3>
        
              
        <div id="player_list" class="player_list" style="height:550px;">
            <table id="player_table" cellspacing="0" cellpadding="0" border="0" width="378">
                <tbody style="color: yellow; font-size: 20px; ">
                    <tr>
                        <td height="25" align="left" class="player_header">
                            <strong style="color: white;">Name</strong>
                        </td>
                        <td height="25" align="right" class="player_header">
                            <strong style="color: white;">선수 상세정보</strong>
                        </td>
                        
                     </tr>
                     
                     <!-- 선수 명단 리스트 불러올때 여기로 불러오면된다.  -->
                     
                     <tr><td class="player_row"><div class="player 강준  ui-draggable" id="강준"><strong>강준</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 몰라  ui-draggable" id="몰라"><strong>몰라</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 광호  ui-draggable" id="광호"><strong>광호</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 메시  ui-draggable" id="메시"><strong>메시</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 호날두  ui-draggable" id="호날두"><strong>호날두</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 한효주  ui-draggable" id="한효주"><strong>한효주</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 국민  ui-draggable" id="국민"><strong>국민</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 농협  ui-draggable" id="농협"><strong>농협</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 버거킹  ui-draggable" id="버거킹"><strong>버거킹</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 홍대  ui-draggable" id="홍대"><strong>홍대</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 군대  ui-draggable" id="군대"><strong>군대</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 하하  ui-draggable" id="하하"><strong>하하</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     <tr><td class="player_row"><div class="player 호호  ui-draggable" id="호호"><strong>호호</strong></div></td><td align="center" class="player_row"><a href="#" class="delete_player no_underline"><strong style="color: white;">상세보기</strong></a></td></tr>
                     
                </tbody>
            </table>
        </div>
    </div>
    <br class="clear" />
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

</div></div>


<div class="super_bottomspaced" style="text-align: center; margin-bottom: 50px;">
    <p>
        <input class="button" type="button" value="등록" onclick="addPlayer();"/>
        <input class="button" type="button" value="취소">
    </p>
</div>


        </div>
    </div>






<!-- footer -->
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript" src="/html/js/background.cycle.js"></script> 
<script type="text/javascript" src="/html/js/background.cycle-custom.js"></script> 
<script type="text/javascript" src="/html/js/formation/formationListModal.js"></script> 


</body>
</html>