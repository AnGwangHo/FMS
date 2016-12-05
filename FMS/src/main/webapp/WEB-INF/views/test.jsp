<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<h2>Ajax Test Page</h2>
<form action="null" name="registForm" id="registForm"></form>
<div>
 <div> 
<label class="title_info" for="id_info" style="font-size: 20px; margin-right: 19px;">아이디:</label> 
<input type="text" id="member_id" class="form-control" name="member_id" style="width: 200px; height: 30px; display: inline;"
					placeholder="ex) jayo1000" required autofocus>
 </div>
<p>
<label class="title_info" for="member_passwd" style="font-size: 20px;">비밀번호:</label>
<input type="password" class="form-control" name="member_passwd" id="member_passwd" style="width: 200px; height: 30px; display: inline;"
					placeholder="비밀번호를 입력해주세요." required> 
<label class="title_info" for="repasswd" style="font-size: 20px; margin-left: 30px;">비밀번호 확인 :</label> 
<input type="password" class="form-control" id="repasswd" name="repasswd" style="width: 200px; height: 30px; display: inline;"
					placeholder="똑같이 입력해주세요." required>
					<span id="pwMessageBox" style="display: inline;"></span> 
				<input type="hidden" name="pwCheckResult" value="0" style="display: inline;"></p>
</div>
<button id="idbtn">ADD ID</button>
<br><br>
<label class="title_info" style="font-size: 20px; margin-right: 20px;">주소 :</label> 
				<input type="text" class="form-control" id="zipcode" name="zip_code" placeholder="우편번호"
					style="width: 10%; display: inline; height: 35px;" required>
				<input type="button" class="form-control" id="add_btn" name="add_btn"
					value="우편번호 찾기" style="width: 10%; display: inline; height: 35px;" required></li>
<br>
				<input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="기본주소"
					style="width: 25%; display: inline; height: 35px;" required>
				<input type="text" class="form-control" id="member_detailaddr"name="member_detailaddr" placeholder="나머지주소"
					style="width: 30%; display: inline; height: 35px;">
<input type="text" id="member_postcode" placeholder="우편번호">
<input type="button" onclick="address()" value="우편번호 찾기"><br>
<input type="text" id="member_addr" placeholder="주소">
<input type="text" id="member_detailaddr" placeholder="상세주소">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4min.js"></script>
<script type="text/javascript">
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
		document.registForm.onsubmit = function() {
			return checkValue(this);
		} 
	}); 

	function idCheck() {
		var inputId = document.registForm.id.value;
		document.registForm.idCheckResult.value = 0;

		// 정규식에 맞지않으면 체크할 필요가 없다.
		if (Validator.isEmpty(inputId) || !Validator.idCheck(inputId)) {
			setMessage("아이디는 6~8글자 안의 숫자 + 영문만 가능합니다.", "idMessageBox");
			return false;
		}

		$.ajax({
			type : "get",
			url : "member/checkId.jsp",
			data : "member_id=" + inputId, 
			success : function(data) {
				if (eval(data)) {
					setMessage("사용 가능한 아이디 입니다.", "idMessageBox", "blue");
					document.registForm.idCheckResult.value = 1;
				} else {
					setMessage("이미 사용중인 아이디 입니다.", "idMessageBox", "red");
					document.registForm.idCheckResult.value = 0;
				}
			}
		});
	}

	function pwCheck() {
		var passwd = document.registForm.member_passwd.value;
		var repasswd = document.registForm.repasswd.value;

		// 둘 중에 하나라도 비어있으면 비교할 필요는 없다.
		if (Validator.isEmpty(passwd) || Validator.isEmpty(repasswd)) {
			setMessage("", "pwMessageBox");
			return false;
		}

		$.ajax({
			type : "get",
			url : "member/checkPw.jsp",
			data : "member_passwd=" + member_passwd + "&repasswd=" + repasswd,
			success : function(data) {
				//var result = data.responseText;
				if (eval(data)) {
					setMessage("비밀번호가 일치합니다.", "pwMessageBox", "blue");
					document.registForm.pwCheckResult.value = 1;
				} else {
					setMessage("비밀번호가 서로 다릅니다.", "pwMessageBox", "red");
					document.registForm.pwCheckResult.value = 0;
				}
			}
		});
	}

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
</script>
<script type="text/javascript">
$("#add_btn").click(function() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== ''
					&& /[동|로|가]$/g
							.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== ''
					&& data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName
						: data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' ('
						+ extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('default_address').value = fullRoadAddr;
		}
	}).open();
});/* 우편 함수 끝 */
</script>
</body>
</html>