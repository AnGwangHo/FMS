<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<!DOCTYPE HTML>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: Floxi ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="image/x-icon">

<!-- style -->
<link href="/html/css/btn_3d.css" rel="stylesheet">
<link href="/html/css/style.css" rel="stylesheet">

<!-- style -->

<!-- bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- responsive -->

<link href="/html/css/responsive.css" rel="stylesheet">

<!-- font-awesome -->

<link href="/html/css/font-awesome.min.css" rel="stylesheet">

<!-- Slider -->

<link href="/html/css/jquery.fadeshow-0.1.1.min.css" rel="stylesheet">
</head>

<body>

<!-- slider -->

<div class="background"></div>
<div class="over-bg"></div>

<!-- slider -->

<!-- slider -->

<main role="slider-container"> 
  
<!-- side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

  <!-- 본문 -->
  
	<!-- hidden값 -->
	<form role="form" method="post">
		<input type='hidden' name='member_num' value="${sessionScope.login.member_unm}">
	</form>

	<!-- 본문내용! -->
	<!-- 4번 form 추가--->
	<div style="margin-left: 60px; margin-bottom: 200px; margin-top: 30px;">
	<ul id=table><li class="alert alert-info" style="margin-bottom: 50px;">
		<h1 align="center"><span class="fa fa-street-view"></span>회원 상세보기</h1>
		</li>
		
		<!-- form -->
		<form method="post" name="registForm" id="registForm" style="color: white;">
			<!-- hidden -->
			<input type='hidden' name='member_num' value="${sessionScope.login.member_unm}">

			<!-- 사진 -->
			<li style="list-style: none; float:left; margin-left: 50px; margin-right: 50px;">
				<img id="imagePreview" name="imagePreview" src="/html/images/result.jpg" style="width: 250px; height: 250px; border: 8px solid black;" />
				<!-- <input type="file" id="profile" class="form-control" name="profile"	required style="width: 85%; "> -->
			</li>
			
			<!-- 한 줄당 li 하나씩 -->
			<ul style="margin-left: 100px;">
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="name" style="font-size: 20px; margin-right: 36px;">이름 : </label> 
					<input type="text" id="1" class="form-control" name="1" 
					 style="margin-left:52px; width: 90px; height: 30px; display: inline;" value="${sessionScope.login.member_name}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 19px;">아이디 : </label> 
					<input type="text" id="2" class="form-control" name="2" style="margin-left:51px; width: 90px; height: 30px; display: inline;"
						value="${sessionScope.login.member_id}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="name" style="font-size: 20px; margin-right: 36px;" >가입날짜 : </label> 
					<input type="text" id="3" class="form-control" name="3" style="margin-left:16px; width: 250px; height: 30px; display: inline;"
						value="${sessionScope.login.regdate}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px; margin-left:50px;">
					<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 20px;">포지션(메인) : </label> 
					<input type="text" id="4" class="form-control" name="4"
					style="width: 40px; height: 30px; display: inline;"
					value="${MemberAdmin.member_mainposition}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="id_info" style="font-size: 20px;">포지션(세컨드) : </label> 
					<input type="text" id="5" class="form-control" name="5"
					style="margin-left:2px; width: 40px; height: 30px; display: inline;"
					value="${MemberAdmin.member_subposition}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px; ">
					<label class="title_info" for="id_info" style="font-size: 20px;">메인 발 : </label> 
					<input type="text" id="6" class="form-control" name="6"
					style="margin-left:64px; width: 40px; height: 30px; display: inline;"
					value="${MemberAdmin.member_foot}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
					<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">연락처 :	</label> 
					<input type="text" id="7" class="form-control" name="7"
					style="margin-left:67px; width: 130px; height: 30px; display: inline;"
					value="${MemberAdmin.member_phone}" readonly="readonly">
				</li>
					
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">이메일 :	</label> 
				<input type="text" name="8" id="8" class="form-control"
					style="margin-left:67px; width: 180px; display: inline; height: 35px;"
					value="${MemberAdmin.member_email}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">주소 :	</label> 
					<input type="text" class="form-control" id="default_address"
					name="default_address" value="${MemberAdmin.member_addr}" readonly="readonly"
					style="margin-left:85px; width: 40%; display: inline; height: 35px;" required>
				</li>
					
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">상세주소 :	</label> 
					<input type="text" class="form-control" id="detail_address"
					name="detail_address" value="${MemberAdmin.member_detailaddr}" readonly="readonly"
					style="margin-left:49px; width: 50%; display: inline; height: 35px;">
				</li>
				
				<li class="info" style="margin-left: 250px;"><label class="title_info" for="id_info"
					style="font-size: 30px;">Comment</label>
					<p>
					<textarea name="comments" id="comments" 
						 readonly="readonly"
						style="width: 540px; height: 100px; color: black; ">${MemberAdmin.member_comment}</textarea>
					</p>
				</li>
				</form>
				
				
				
			</ul>
		<!-- 메인내용 끝 -->
				<li class="info" style="list-style% none; margin-left: 70%; margin-top: 40px; margin-bottom: 30px;">
				  		
				  		<!-- 목록버튼 -->
				  		<button onclick="javascript:location.href='/member/member_list'" class="btn btn-default btn-sm  btn3d"><span class="glyphicon glyphicon-edit"></span> 목록</button>
				  		<!-- 수정버튼 -->
				  		<button onclick="javascript:location.href='write'" class="btn btn-info btn-sm  btn3d"><span class="glyphicon glyphicon-edit"></span> 수정</button>
				  		<!-- 삭제버튼 -->
				  		<button onclick="javascript:location.href='/member/member_remove?member_num=${MemberAdmin.member_num}'" class="btn btn-danger btn-sm btn3d">		
					  		<span class="glyphicon glyphicon-remove-circle"></span> 탈퇴
						</button>
				</li>
		</div>		
  <!-- 본문끝-->
</main>

  <!-- footer -->
  
  <jsp:include page="../include/footer.jsp"/>
 


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 

<script src="/html/js/jquery.min.js" type="text/javascript"></script> 

<!-- custom --> 

<script src="/html/js/custom.js" type="text/javascript"></script> 
<script src="/html/js/nav-custom.js" type="text/javascript"></script> 

<!-- Include all compiled plugins (below), or include individual files as needed --> 

<script src="/html/js/bootstrap.min.js" type="text/javascript"></script> 

<!-- jquery.countdown --> 

<script src="/html/js/countdown-js.js" type="text/javascript"></script> 
<script type="text/javascript" src="/html/js/jquery.contact.js"></script> 

<!-- slider --> 

<script type="text/javascript" src="/html/js/background.cycle.js"></script> 
<script type="text/javascript" src="/html/js/background.cycle-custom.js"></script> 
<script src="/html/js/html5shiv.js" type="text/javascript"></script> 

<!-- Typed --> 
<!-- Typed jS --> 

<script src="/html/js/typed.js" type="text/javascript"></script> 
<script>
    $(function(){

        $("#typed").typed({
            // strings: ["Typed.js is a <strong>jQuery</strong> plugin.", "It <em>types</em> out sentences.", "And then deletes them.", "Try it out!"],
            stringsElement: $('#typed-strings'),
            typeSpeed: 100,
            backDelay: 1000,
            loop: true,
            contentType: 'html', // or text
            // defaults to false for infinite loop
            loopCount: false,
            callback: function(){ foo(); },
            resetCallback: function() { newTyped(); }
        });

        $(".reset").click(function(){
            $("#typed").typed('reset');
        });

    });

    function newTyped(){ /* A new typed object */ }

    function foo(){ console.log("Callback"); }

    </script>
    
<!-- 이미지 업로드 스크립트 -->
<script type="text/javascript">
$(function() {
	$("#profile").change(function() {
		readUploadImage(this);
	});
});

function readUploadImage(inputObject) {
	/*
	 * 브라우저에서 FileReader가 지원되는지 확인하기 위해 
	 * window.File && window.FileReader 실행 
	 */
	if (window.File && window.FileReader) {
		/* 입력된 파일이 1개 이상 있는지 확인 */
		if (inputObject.files && inputObject.files[0]) {
			/* 이미지 파일인지 체크 */
			if (!(/image/i).test(inputObject.files[0].type)) {
				alert("이미지 파일을 선택해 주세요!");
				return false;
			}
			/* FileReader 를 준비 한다. */
			var reader = new FileReader();
			reader.onload = function(e) {
				/* reader가 다 읽으면 imagePreview에 뿌려기 */
				$('#imagePreview').attr('src', e.target.result);
			}
			/* input file에 있는 파일 하나를 읽어온다. */
			reader.readAsDataURL(inputObject.files[0]);
		}
	} else {
		alert("미리보기 안되요. 브라우저를 업그레이드하세요.");
	}
}
</script>
<!-- 이미지 업로드 스크립트끝 -->

<!-- 폰트 커스텀 -->
<style type="text/css">
#table {
	border-collapse: collapse;
	border: 2px solid black;
	width: 1000px;
	margin: 0 auto; //
	padding-left: 0;
	list-style-type: none;
}
</style>

</body>
</html>