/**
 * 형식확인
 */
var Validator = {};

// 숫자인지 확인
Validator.isNumber = function(string) {
	var regExp = /^[0-9]+$/;
	/* console.log("숫자확인: " + regExp.test(string)); */
	return !regExp.test(string);
}

// 비었는지 확인
Validator.isEmpty = function(string) {
	/* console.log("엠프티확인: " + string == null || string.length == 0); */
	return string == null || string.length == 0;
}

// 아이디 확인
// 6~8글자 영문, 숫자만 사용가능
Validator.idCheck = function(string) {
	var regExp = /^[0-9a-zA-z]{6,8}$/;
	/* console.log("아이디 확인: " + regExp.test(string)); */
	return regExp.test(string);
}

// 이메일 형식 체크
// input type에서 체크되서 쓸일은...
Validator.emailCheck = function(string) {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	/* console.log("이메일 확인: " + regExp.test(string)); */
	return regExp.test(string);
}

// 길이 체크
// length 이상인지 판별
Validator.isLong = function(string, length) {
	return string.length >= length
}