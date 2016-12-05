<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인이 되지않았습니다!</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="refresh" content="4;/member_login" />
<style>
body {
        background: url("/html/images/loading.gif");
        background-size: 100% 100%;
		background-repeat: no-repeat;
		margin-bottom: 700px;
    }
.btn3d {
    transition:all .08s linear;
    position:relative;
    outline:medium none;
    -moz-outline-style:none;
    border:0px;
    margin-right:10px;
    margin-top:15px;
}
.btn3d:focus {
    outline:medium none;
    -moz-outline-style:none;
}
.btn3d:active {
    top:9px;
}
.btn-warning {
    box-shadow:0 0 0 1px #f0ad4e inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #eea236, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#f0ad4e;
}
</style>
</head>
<body>
<div align="center">
<!-- <img src="http://www.papin-associes.com/wp-content/uploads/sites/50/2015/11/ATTENTION.png" width='25%'/> -->
<h2 style="color: white; margin-top: 100px;">※주의! 로그인이 정상적으로 처리되지않았습니다!</h2>
<p><h3 style="color: white;">아이디 비밀번호 확인후. 다시 이용해주시기 바랍니다.</h3>
<p><h3 style="color: white;">곧 본래 화면으로 돌아갑니다.</h3>
 <button type="button" class="btn btn-warning btn-lg btn3d" onclick="location.href='/member_login'"><span class="glyphicon glyphicon-warning-sign"></span> Warning</button>
</div>
</body>
</html>