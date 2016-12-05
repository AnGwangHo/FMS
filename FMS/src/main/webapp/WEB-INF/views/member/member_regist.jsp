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
<title>:: 회원가입 ::</title>
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
<script src="/html/js/jquery.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/html/js/jquery.contact.js"></script>
<script type="text/javascript" src="/html/js/jquery-3.1.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/html/js/Validator.js"></script>
<link href="/html/css/votestyle.css" rel="stylesheet">
<!-- 파일등록을 위한 SCRIPT 처리 시작-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template"></script>
<!-- 업로드를 위한 upload.js 추가 -->
<script type="text/javascript" src="/html/js/upload.js"></script>
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
	<div style="margin-left: 250px; margin-bottom: 200px;">
		<h1 style="margin-bottom: 70px; color: white; margin-left: 150px;">회원
			가입(Join MemberShip)</h1>
		<!-- form -->
		<form action="member_regist" method="post" name="registForm" id="registForm" style="color: white;">
			<!-- 한 줄당 li 하나씩 -->
			<ul>
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="member_name" style="font-size: 20px; margin-right: 36px;">이름 : </label> 
				<input type="text" id="member_name" class="form-control" name="member_name" style="width: 200px; height: 30px; display: inline;"
					placeholder="ex) 홍길동" required autofocus>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 19px;">아이디:</label> 
				<input type="text" id="member_id" class="form-control" name="member_id" style="width: 200px; height: 30px; display: inline;"
					placeholder="ex) jayo1000" required autofocus>
					<input type="hidden" name="idCheckResult" value="0"><span id="idMessageBox" style="margin-left: 10px;"></span>
				</li>
				
				<li class="info" style="margin-bottom: 10px;"><label
					class="title_info" for="member_passwd" style="font-size: 20px;">비밀번호:</label>
				<input type="password" class="form-control" name="member_passwd" id="member_passwd" style="width: 200px; height: 30px; display: inline;"
					placeholder="비밀번호를 입력해주세요." required> 
				<label class="title_info" for="repasswd" style="font-size: 20px; margin-left: 30px;">비밀번호 확인 :</label> <input
					type="password" class="form-control" id="repasswd" name="repasswd" style="width: 200px; height: 30px; display: inline;"
					placeholder="똑같이 입력해주세요." required> 
				<span id="pwMessageBox" style="display: inline; margin-left: 10px;"></span> 
				<input type="hidden" name="pwCheckResult" value="0" style="display: inline;">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="profile" style="font-size: 20px; margin-right: 10px;">프로필 사진</label> 
				<input type="file" id="member_profile_image" class="form-control" name="member_profile_image" required style="width: 17%; display: inline;"> 
			 	<!-- <input type="hidden" id="member_profile_image" name="member_profile_image" value=""> -->
				<img id="imagePreview" name="imagePreview" style="width: 200px; height: 200px; float: right; margin-right: 610px;" />
				</li>		
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" style="font-size: 20px; margin-top: 20px; display: inline;">성별: </label>
						<label class="btn btn-primary active"> 
						<input type="radio" name="member_sex" id="option1" autocomplete="off" value="0" checked>
							남성
						</label> <label class="btn btn-primary"> <input type="radio"
							name="member_sex" id="option2" value="1" autocomplete="off"> 여성
						</label>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 10px;">나이:</label> 
				<input type="text" name="member_age" id="member_age" class="form-control" style="width: 80px; height: 30px; display: inline;" required pattern="\d{1,4}">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 30px;">키:</label> 
				<input type="text" name="member_height" id="member_height" class="form-control" style="width: 80px; height: 30px; display: inline;" required pattern="\d{1,4}">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 6px;">무게 :</label> 
				<input type="text" name="member_weight" id="member_weight" class="form-control" style="width: 80px; height: 30px; display: inline;" required pattern="\d{1,4}">
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 20px;">포지션(메인) : </label> 
				<select name="member_mainposition" style="width: 80px; height: 30px; color: black;">
						<option value="null">----</option>
						<option value="1">공격수</option>
						<option value="2">미드필더</option>
						<option value="3">수비수</option>
						<option value="4">골키퍼</option>
				</select>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px;">포지션(세컨드)	: </label> 
				<select name="member_subposition" style="width: 80px; height: 30px; color: black;">
						<option value="null">----</option>
						<option value="1">공격수</option>
						<option value="2">미드필더</option>
						<option value="3">수비수</option>
						<option value="4">골키퍼</option>
				</select>
				</li>			
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px;">메인 발 : </label> 
				<label class="btn btn-primary active">
				<input type="radio" name="member_foot" id="option1" autocomplete="off" value="0" checked>왼발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option2" value="1" autocomplete="off">오른발
				</label> <label class="btn btn-primary"> 
				<input type="radio" name="member_foot" id="option3" value="2" autocomplete="off">양발
				</label>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="member_phone" style="font-size: 20px; display: inline;">연락처 :</label> 
				<!-- <select class="form-control" id="member_phone" name="member_phone" style="width: 8%; display: inline;">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
				</select> <input type="text" class="form-control" name="member_phone" style="width: 15%; display: inline; height: 35px;" placeholder="ex) 1234" required> 
				<input type="text" class="form-control" name="member_phone" style="width: 15%; display: inline; height: 35px;"
					placeholder="ex) 5678" required></li> -->
				<input type="text" class="form-control" name="member_phone" style="width: 20%; display: inline; height: 35px;" placeholder="ex) -빼고 번호만적어주세요." required pattern="(010|011)\d{3,4}\d{4}"> 
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" for="id_info" style="font-size: 20px;">이메일 : </label> 
				<!-- <input type="text" name="member_email" id="member_email" class="form-control"
					style="width: 9%; display: inline; height: 35px;" placeholder="ex) jayo1000" required>
				@<input type="text" name="member_email" id="user" class="form-control" style="width: 15%; display: inline; height: 35px;"
					placeholder="ex) naver.com" required></li> -->
				<input type="email" name="member_email" id="member_email" class="form-control"
					style="width: 30%; display: inline; height: 35px;" placeholder="ex) jayo1000 @ naver.com" required>
				</li>
				
				<li class="info" style="margin-bottom: 10px;">
				<label class="title_info" style="font-size: 20px; margin-right: 20px;">주소 :</label> 
				<input type="text" class="form-control" id="member_postcode" name="member_postcode" placeholder="우편번호"
					style="width: 10%; display: inline; height: 35px;" required>
				<input type="button" class="form-control" id="add_btn" name="add_btn" onclick="address()"
					value="우편번호 찾기" style="width: 10%; display: inline; height: 35px;" required>
				</li>
				
				<li class="info" style="margin-left: 72px; list-style: none;">
				<input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="기본주소"
					style="width: 25%; display: inline; height: 35px;" required>
				<input type="text" class="form-control" id="member_detailaddr"name="member_detailaddr" placeholder="나머지주소"
					style="width: 30%; display: inline; height: 35px;">
				</li>
				
				<li class="info">
				<label class="title_info" for="id_info" style="font-size: 30px;">Comment</label>
					<p>
						<textarea name="member_comment" id="member_comment"	placeholder="Enter Your Description..."
							style="width: 700px; height: 120px; color: black; margin-left: 70px;"></textarea>
					</p>
				</li>
				
				<li class="info" style="list-style: none; margin-left: 180px; margin-top: 40px;">
				<input type="submit" class="btn btn-default" value="등록" style="width: 150px; height: 30px;"> 
				<input type="reset" value="초기화" class="btn btn-default"
					style="display: inline; width: 150px; height: 30px; margin-left: 100px;">
				</li>
			</ul>
		</form>
		<!-- 메인내용 끝 -->
	</div>
	<div class="clearfix"></div>
	<!-- form -->
<script type="text/javascript">
$(function() {
	$("#member_profile_image").change(function() {
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
<script>
var file = document.querySelector('#member_profile_image');
var changed = false;

file.onchange = function (event) {
var fileList = file.files;

var formData = new FormData();

formData.append("file", fileList[0]);
console.log("formData:" + formData);
console.log("file:" + file);

$.ajax({
	url : '/profile_image',
	data: formData,
	dataType: 'text',
	processData: false,
	contentType: false,
	type: 'POST',
	sucess: function(data){
		alert(data);
		console.log("data:" +data);
		 var fileInfo = getFileInfo(data);
         var html = template(fileInfo);
         changed = true;
		}		
	});	
}
</script>
<script type="text/javascript">
	$(function() {
		document.registForm.member_id.onkeyup = function() {
			idCheck();
		}
		document.registForm.member_passwd.onkeyup = function() {
			pwCheck();
		}
		document.registForm.repasswd.onkeyup = function() {
			pwCheck();
		}
		$("#registForm").submit(function()	{
			console.log("서브밋 실행");
		});
/* 			profile_image(); */
	}); 

	function idCheck() {
 		var inputId = document.registForm.member_id.value;
		document.registForm.idCheckResult.value = 0;

		// 정규식에 맞지않으면 체크할 필요가 없다.
		if (Validator.isEmpty(inputId) || !Validator.idCheck(inputId)) {
			setMessage("아이디는 6~8글자 안의 숫자 + 영문만 가능합니다.", "idMessageBox", "white");
			return false;
		} 

		$.ajax({
			type : "get",
			url : "/member/member_checkid/" + inputId,
			success : function(data) {
				if (data == 'SUCCESS') {
					setMessage("사용 가능한 아이디 입니다.", "idMessageBox", "white");
					document.registForm.idCheckResult.value = 1;
				} else {
					setMessage("이미 사용중인 아이디 입니다.", "idMessageBox", "red");
					document.registForm.idCheckResult.value = 0;
				}
			}
		});
	}

	function pwCheck() {
		var member_passwd = document.registForm.member_passwd.value;
		var repasswd = document.registForm.repasswd.value;

		// 둘 중에 하나라도 비어있으면 비교할 필요는 없다.
		if (Validator.isEmpty(member_passwd) || Validator.isEmpty(repasswd)) {
			setMessage("비밀번호는 동일하게 적어주세요.", "pwMessageBox", "white");
			return false;
		}

		$.ajax({
			type : "get",
			url : "/member/member_checkpw",
			data : "member_passwd=" + member_passwd + "&repasswd=" + repasswd,
			success : function(data) {
				if (eval(data)) {
					setMessage("비밀번호가 일치합니다.", "pwMessageBox", "white");
					document.registForm.pwCheckResult.value = 1;
				} else {
					setMessage("비밀번호가 서로 다릅니다.", "pwMessageBox", "red");
					document.registForm.pwCheckResult.value = 0;
				}
			}
		});
	}
	
/* 	function profile_image() {
		alert("시작됨");
		var image = document.registForm.file.value;
		var main = document.registForm.member_profile_image.value;
		if (image!=null){
			alert("image에 값이 들어와 변경됨");
			main=image;
		}else{
		}
		
	} */

	function setMessage() {
		var message = arguments[0];
		var location = arguments[1];
		var color = arguments[2];
		var messageBox = document.getElementById(location);

		if (messageBox) {
			if (color) {
				messageBox.style.color = color;
			} else {
				messageBox.style.color = "black";
			}
			messageBox.innerHTML = message;
		}
	}

	function checkValue(form) {
		var idCheckResult = form.idCheckResult.value;
		if (idCheckResult != 1) {
			alert("아이디 중복여부를 확인해주세요");
			form.member_id.focus();
			return false;
		}

		var pwCheckResult = form.pwCheckResult.value;
		if (pwCheckResult != 1) {
			alert("비밀번호가 일치하지 않습니다.");
			form.member_passwd.focus();
			return false;
		}
		
		var member_email = form.member_email.value;
		var member_phone = form.member_phone.value;
		var member_age = form.member_age.value;

		if (Validator.isEmpty(member_phone) || Validator.isEmpty(member_age)
				|| Validator.isEmpty(member_email)) {
			if (!confirm("비어있는 칸이 존재합니다\n그래도 회원가입하시겠습니까?")) {
				return false;
			} else {
				return true;
			}
		}

		if (!confirm("회원가입 하시겠습니까?")) {
			return false;
		}
		return true;
	}
</script>
<script>
    function address() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('member_addr').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('member_detailaddr').focus();
            }
        }).open();
    }
</script>
</body>
</html>