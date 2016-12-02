<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: Floxi ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico"
	type="/html/image/x-icon">
<!-- style -->
<link href="/html/css/style.css" rel="stylesheet">
<!-- style -->
<!-- bootstrap -->
<link href="/html/css/bootstrap.min.css" rel="stylesheet">
<!-- responsive -->
<link href="/html/css/responsive.css" rel="stylesheet">
<!-- font-awesome -->
<link href="/html/css/font-awesome.min.css" rel="stylesheet">
<!-- <link href="/html/js/regist.js" rel="stylesheet">

<script src="/html/js/regist.js" type="text/javascript"></script> -->
<script src="/html/js/jquery.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/html/js/jquery.contact.js"></script> 
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
</head>
<body>

	<!-- side bar -->

	<jsp:include page="../include/side.jsp" />


	<!-- header -->
	<jsp:include page="../include/header.jsp" />

	<!-- footer -->

	<jsp:include page="../include/footer.jsp" />


	<!-- 본문내용! -->
	<!-- 4번 form 추가--->
	<div style="margin-left: 60px; margin-bottom: 200px; margin-top: 30px;">
	<ul id=table><li class="alert alert-info" style="margin-bottom: 50px;">
		<h1 style="margin-left: 280px;"><span class="fa fa-street-view" style="margin-right: 10px;"></span>회원정보(MyPage)</h1>
		</li>
		<!-- form -->
		<form method="post" action="php/contact.php" name="registForm" id="registForm" style="color: white;">
			<!-- 한 줄당 li 하나씩 -->
			<ul style="margin-left: 100px;">
			<li style="list-style: none; float:left; margin-right: 50px;">
					<img
					id="imagePreview" name="imagePreview" src="/html/images/result.jpg"
					style="width: 230px; height: 230px; border: 8px solid black;" />
					<input type="file" id="profile" class="form-control" name="profile"
					required style="width: 85%; ">
					</li>
				<li class="info" style="margin-bottom: 10px;">
				<label
					class="title_info" for="name"
					style="font-size: 20px; margin-right: 36px;">이름 : </label> 
				<input
					type="text" id="name" class="form-control" name="name"
					style="width: 150px; height: 30px; display: inline;"
					placeholder="ex) 홍길동" <%-- value="${sessionScope.login.member_name}" --%> required autofocus></li>
				<li class="info" style="margin-bottom: 10px;">
				<label
					class="title_info" for="id_info"
					style="font-size: 20px; margin-right: 19px;">아이디:</label> 
				<input
					type="text" id="name" class="form-control" name="name"
					style="width: 150px; height: 30px; display: inline;"
					placeholder="ex) jayo1000" <%-- value="${sessionScope.login.member_id}" --%> required autofocus></li>
				<li class="info" style="margin-bottom: 10px;">
				<label
					class="title_info" for="name"
					style="font-size: 20px; margin-right: 36px;">비밀번호 :</label>
				<input type="password" class="form-control" name="passwd"
					id="passwd" style="width: 150px; height: 30px; display: inline;"
					placeholder="비밀번호 확인" <%-- value="$${sessionScope.login.member_passwd}" --%> required> </li>
				<li class="info" style="margin-bottom: 10px;">
				<label
					class="title_info" for="name"
					style="font-size: 20px; margin-right: 36px;" >가입날짜 : </label> 
				<input
					type="text" id="name" class="form-control" name="name"
					style="width: 150px; height: 30px; display: inline;"
					placeholder="ex) 홍길동" <%--  value="${sessionScope.login.member_regdate}" --%> required autofocus></li>
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 20px;">포지션(메인) : </label> 
				<select
					name="searchType" style="width: 80px; height: 30px; color: black;">
						<option value="null">----</option>
						<option value="content">공격수</option>
						<option value="writer">미드필더</option>
						<option value="writer">수비수</option>
						<option value="writer">골키퍼</option>
				</select></li>
				<li class="info" style="margin-bottom: 10px;"><label
					class="title_info" for="id_info" style="font-size: 20px;">포지션(세컨드)
						: </label> <select name="searchType"
					style="width: 80px; height: 30px; color: black;">
						<option value="null">----</option>
						<option value="content">공격수</option>
						<option value="writer">미드필더</option>
						<option value="writer">수비수</option>
						<option value="writer">골키퍼</option>
				</select></li>
				<li class="info" style="margin-bottom: 10px; margin-left: 310px;"><label
					class="title_info" for="id_info" style="font-size: 20px;">메인 발 : </label> <!-- <label style="font-size:20px;"><input type="radio" name="gender"  value="left" />왼발</label>
                  		 	<label style="font-size:20px;"><input type="radio" name="gender"  value="right" />오른발</label>
                   			<label style="font-size:20px;"><input type="radio" name="gender"  value="double" />양발</label> -->
					<label class="btn btn-primary active"> <input type="radio"
						name="options" id="option1" autocomplete="off" checked> 왼발
				</label> <label class="btn btn-primary"> <input type="radio"
						name="options" id="option2" autocomplete="off"> 오른발
				</label> <label class="btn btn-primary"> <input type="radio"
						name="options" id="option3" autocomplete="off"> 양발
				</label></li>
				<li class="info" style="margin-bottom: 10px; margin-left: 310px;"><label
					class="title_info" for="member_phone"
					style="font-size: 20px; display: inline;">연락처 :</label> <select
					class="form-control" id="member_phone" name="member_phone"
					style="width: 15%; display: inline;">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
				</select> <input type="text" class="form-control" name="member_phone"
					style="width: 20%; display: inline; height: 35px;"
					placeholder="ex) 1234" required> <input type="text"
					class="form-control" name="member_phone"
					style="width: 20%; display: inline; height: 35px;"
					placeholder="ex) 5678" required></li>
				<li class="info" style="margin-bottom: 10px; margin-left: 310px;">
				<label class="title_info" for="id_info" style="font-size: 20px; ">이메일	: </label> 
				<input type="text" name="id" id="user" class="form-control"
					style="width: 18%; display: inline; height: 35px;"
					placeholder="ex) jayo1000" required>@ <input type="text"
					name="id" id="user" class="form-control"
					style="width: 23%; display: inline; height: 35px;"
					placeholder="ex) naver.com" required></li>
				<li class="info" style="margin-bottom: 10px; margin-left: 310px;"><label
					class="title_info" style="font-size: 20px; margin-right: 20px; ">주소
						:</label> <input type="text" class="form-control" id="zipcode"
					name="zip_code" placeholder="우편번호"
					style="width: 15%; display: inline; height: 35px;" required>
					<input type="button" class="form-control" id="add_btn"
					value="우편번호 찾기" style="width: 20%; display: inline; height: 35px;"
					required></li>
				<li class="info" style="margin-left: 72px; list-style: none; margin-left: 382px;">
					<input type="text" class="form-control" id="default_address"
					name="default_address" placeholder="기본주소"
					style="width: 40%; display: inline; height: 35px;" required>
					<input type="text" class="form-control" id="detail_address"
					name="detail_address" placeholder="나머지주소"
					style="width: 50%; display: inline; height: 35px;">
				</li>
				<li class="info" style="margin-left: 310px;"><label class="title_info" for="id_info"
					style="font-size: 30px;">Comment</label>
					<p>
						<textarea name="comments" id="comments"
							placeholder="Enter Your Description..."
							style="width: 540px; height: 100px; color: black; "></textarea>
					</p></li>
				<li class="info" style="list-style: none; margin-left: 500px; margin-top: 40px; margin-bottom: 30px;">
					<input name="submit" type="button" class="btn btn-default"
					value="수정" style="width: 120px; height: 30px;"> <input
					name="zation" type="button" value="탈퇴" class="btn btn-default"
					style="display: inline; width: 120px; height: 30px; margin-left: 50px;">
				</li>
			</ul>
		</form>

		<!-- 메인내용 끝 -->
		</ul>
	</div>
	<div class="clearfix"></div>
	<!-- form -->

</body>
</html>