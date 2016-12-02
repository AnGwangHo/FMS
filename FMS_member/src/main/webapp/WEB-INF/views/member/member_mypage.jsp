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
<!-- <link href="/html/css/jquery.fadeshow-0.1.1.min.css" rel="stylesheet"> -->
<!-- 스크립트 처리를 위한 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

<!-- slider -->
<!-- side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

  <!-- 본문 -->

	<!-- 본문내용! -->
	<!-- 4번 form 추가--->
	<div style="margin-left: 60px; margin-bottom: 200px; margin-top: 30px;">
	<ul id=table><li class="alert alert-info" style="margin-bottom: 50px;">
		<h1 align="center"><span class="fa fa-street-view" style="margin-right: 20px;"></span>회원 상세보기</h1>
		</li>	
		<!-- form -->
		<form method="POST" name="registForm" id="registForm" style="color: white;">
			<!-- hidden -->
			<input type='hidden' name='member_num' value="${Member_info.member_num}">

			<!-- 사진 -->
			<li style="list-style: none; float:left; margin-left: 50px; margin-right: 50px;">
				<img id="imagePreview" name="imagePreview" style="width: 250px; height: 250px; border: 8px solid black;" />
				<input type="file" id="profile" class="form-control" name="profile" style="width: 85%;" value="/http/images/member/${Member_info.member_profile_image}">
			</li>
			
			<!-- 한 줄당 li 하나씩 -->
			<ul style="margin-left: 140px;">
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="name" style="font-size: 20px; margin-right: 36px;">이름 : </label> 
					<input type="text" id="member_name" class="form-control" name="member_name" readonly="readonly"
					 style="margin-left:52px; width: 110px; height: 30px; display: inline;" value="${Member_info.member_name}">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 19px;">아이디 : </label> 
					<input type="text" id="member_id" class="form-control" name="member_id" style="margin-left:51px; width: 110px; height: 30px; display: inline;" readonly="readonly"
						value="${Member_info.member_id}">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="name" style="font-size: 20px; margin-right: 36px;" >가입날짜 : </label> 
					<input type="text" id="member_regdate" class="form-control" name="member_regdate" style="margin-left:16px; width: 110px; height: 30px; display: inline;"
						value="${Member_info.member_regdate}" readonly="readonly">
				</li>
				
				<li class="info" style="margin-bottom: 10px; margin-left:50px;">
					<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 20px;">포지션(메인) : </label>
					<select id="member_mainposition" name="member_mainposition" style="width: 80px; height: 30px; color: black;">
						<c:choose>
							<c:when test="${Member_info.member_mainposition==1}">
								<option value="1" selected="selected">공격수</option>
								<option value="2">미드필터</option>
								<option value="3">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_mainposition==2}">
								<option value="1">공격수</option>
								<option value="2" selected="selected">미드필터</option>
								<option value="3">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_mainposition==3}">
								<option value="1">공격수</option>
								<option value="2">미드필터</option>
								<option value="3" selected="selected">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_mainposition==3}">
								<option value="1">공격수</option>
								<option value="2">미드필터</option>
								<option value="3">수비수</option>
								<option value="4" selected="selected">골키퍼</option>
							</c:when>
						</c:choose>
					</select>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
					<label class="title_info" for="id_info" style="font-size: 20px;">포지션(세컨드) : </label> 
					<select id="member_subposition" name="member_subposition" style="width: 80px; height: 30px; color: black;">	
						<c:choose>
							<c:when test="${Member_info.member_subposition==1}">
								<option value="1" selected="selected">공격수</option>
								<option value="2">미드필터</option>
								<option value="3">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_subposition==2}">
								<option value="1">공격수</option>
								<option value="2" selected="selected">미드필터</option>
								<option value="3">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_subposition==3}">
								<option value="1">공격수</option>
								<option value="2">미드필터</option>
								<option value="3" selected="selected">수비수</option>
								<option value="4">골키퍼</option>
							</c:when>
							<c:when test="${Member_info.member_subposition==3}">
								<option value="1">공격수</option>
								<option value="2">미드필터</option>
								<option value="3">수비수</option>
								<option value="4" selected="selected">골키퍼</option>
							</c:when>
						</c:choose>
						</select>
				</li>			
				<li class="info" style="margin-bottom: 10px; ">
					<label class="title_info" for="id_info" style="font-size: 20px;">메인 발 : </label>
					<c:choose>
							<c:when test="${Member_info.member_foot==0}">
				<label class="btn btn-primary active">
				<input type="radio" name="member_foot" id="option1" autocomplete="off" value="0" checked>왼발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option2" value="1" autocomplete="off">오른발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option3" value="2" autocomplete="off">양발
				</label>
							</c:when>
							<c:when test="${Member_info.member_foot==1}">
				<label class="btn btn-primary active">
				<input type="radio" name="member_foot" id="option1" autocomplete="off" value="0">왼발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option2" value="1" autocomplete="off" checked>오른발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option3" value="2" autocomplete="off">양발
				</label>
							</c:when>
							<c:when test="${Member_info.member_foot==2}">
				<label class="btn btn-primary active">
				<input type="radio" name="member_foot" id="option1" autocomplete="off" value="0">왼발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option2" value="1" autocomplete="off">오른발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option3" value="2" autocomplete="off" checked>양발
				</label>
							</c:when>
					</c:choose>
				</li>			
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
					<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">연락처 :	</label> 
					<input type="text" id="member_phone" class="form-control" name="member_phone"
					style="margin-left:67px; width: 130px; height: 30px; display: inline;"
					value="${Member_info.member_phone}">
				</li>
					
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">이메일 :	</label> 
				<input type="text" name="member_email" id="member_email" class="form-control"
					style="margin-left:67px; width: 180px; display: inline; height: 35px;"
					value="${Member_info.member_email}">
				</li>
				
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">주소 :	</label> 
					<input type="text" class="form-control" id="member_addr"
					name="member_addr" value="${Member_info.member_addr}"
					style="margin-left:85px; width: 40%; display: inline; height: 35px;" required>
				</li>
					
				<li class="info" style="margin-bottom: 10px; margin-left: 250px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">상세주소 :	</label> 
					<input type="text" class="form-control" id="member_detailaddr"
					name="member_detailaddr" value="${Member_info.member_detailaddr}"
					style="margin-left:49px; width: 50%; display: inline; height: 35px;">
				</li>
				
				<li class="info" style="margin-left: 250px;"><label class="title_info" for="id_info"
					style="font-size: 30px;">Comment</label>
					<p>
					<textarea name="member_comment" id="member_comment"
						style="width: 540px; height: 100px; color: black; ">${Member_info.member_comment}</textarea>
					</p>
				</li>
		<!-- 메인내용 끝 -->
				<li class="info" style="list-style: none; margin-left: 68%; margin-top: 40px; margin-bottom: 30px;">
				  		<!-- 수정버튼 -->
				  		<button type="submit" class="btn btn-info btn-sm btn3d" style="width: 100px;"><span class="glyphicon glyphicon-edit"></span>수정</button>
				  		<!-- 삭제버튼 -->
				  		<a data-toggle="modal" href="#leaveModal" class="btn btn-danger btn-sm btn3d" style="width: 100px;"><span class="glyphicon glyphicon-remove-circle"></span>탈퇴</a>	
				</li>
				</form>			
			</ul>			
		</div>
			<!-- 회원탈퇴 모달 -->
								<div class="container">
									<div class="row">
										<div id="leaveModal" class="modal fade in">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<a class="btn btn-default" data-dismiss="modal"><span
															class="glyphicon glyphicon-remove"></span></a>
														<h2 class="modal-title" style="color: red">
															<span class="glyphicon glyphicon-exclamation-sign"></span>
															경고!
														</h2>
													</div>
													<div class="modal-body">
														<h4 style="color: black">정말 아이디를 삭제하시겠습니까?</h4>
													</div>
													<div class="modal-footer">
														<div class="btn-group">
															<button class="btn btn-danger"
																onclick="javascript:location.href='/member/member_remove?member_num=${Member_info.member_num}'">
																<span class="glyphicon glyphicon-check"></span> 삭제
															</button>
															<button class="btn btn-primary" data-dismiss="modal">
																<span class="glyphicon glyphicon-remove"></span> 취소
															</button>
														</div>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dalog -->
										</div>
									</div>
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
</body>
<!-- 폰트 커스텀 -->
<style type="text/css">
body {
 background-repeat: repeat;
}
#table {
	border-collapse: collapse;
	border: 2px solid black;
	width: 1000px;
	margin: 0 auto; //
	padding-left: 0;
	list-style-type: none;
}
<!-- 3D버튼 -->
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-info {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #348FD2, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#39B3D7;
}
.btn3d.btn-info:active, .btn3d.btn-info.active {
    box-shadow:0 0 0 1px #00a5c3 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #39B3D7;
}
.btn3d.btn-danger {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #AA0000, 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#D73814;
}
.btn3d.btn-danger:active, .btn3d.btn-danger.active {
    box-shadow:0 0 0 1px #b93802 inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,0.3);
    background-color: #D73814;
}
</style>
</html>