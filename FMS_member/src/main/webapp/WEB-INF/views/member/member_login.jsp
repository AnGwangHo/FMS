<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: Floxi ::</title>
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
<style type="text/css">
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
.btn3d.btn-white {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#fff;
}
.btn3d.btn-white:active, .btn3d.btn-white.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#fff;
}
 </style>
</head>

<body>

<!-- side bar -->

<jsp:include page="../include/side.jsp"/>


<!-- header -->
<jsp:include page="../include/header.jsp"/>

<!-- footer -->

<jsp:include page="../include/footer.jsp"/>


<!-- 본문내용! -->
          <header role="page-title">
            <h2 align="center" style="margin-right: 110px; margin-bottom: 40px; color: white;"><span class="fa fa-futbol-o" style="margin-right: 20px;"></span>로그인(Login)</h2>
          </header>
          <article>
            <p style="color: white;" align="center">-아이디를 분실하신분은 아이디/비밀번호 찾기 창을 이용해주시기 바랍니다-</p>
          </article>       
          <!-- form -->
          <div class="contact-from row">
            <div class="col-md-12 col-lg-12">
              <div id="message"></div>
              <form method="post" action="member/member_loginPost" align="center">
                  <div class="col-md-11 col-lg-11 col-sm-11">
                  <span class="fa fa-soccer-ball-o" style="margin-right: 10px;"></span>
                   <label class="title_info" for="member_id" style="font-size:20px; margin-right:90px;">ID  </label>
					<input type="text" id="member_id" class="form-control" name="member_id" style="width:30%; display: inline; height: 35px;" placeholder="ex) 홍길동"
								required autofocus>
                  </div>
                  <div class="col-md-11 col-lg-11 col-sm-11">
                  <span class="fa fa-soccer-ball-o" style="margin-right: 10px;"></span>
                   <label class="title_info" for="member_passwd" style="font-size:20px; margin-right:10px; margin-bottom: 50px;">PASSWORD </label>
					<input type="password" class="form-control" id="member_passwd" name="member_passwd"
								style="display: inline; width:30%;" placeholder="비밀번호를 입력해주세요." required autofocus>
                  </div>
                <div class="clearfix"></div>
                <button name="submit" type="submit" class="btn3d btn btn-white btn-lg" value="Login" style="display: inline; width: 100px; height: 40px; margin-right: 60px;">Login</button>
              	<button name="zation" type="reset" value="Cancle" class="btn3d btn btn-white btn-lg" style="width: 100px; height: 40px; margin-right: 70px;">Cancel</button>
                <div id="simple-msg"></div>
              </form>
            </div>
            <div class="clearfix"></div>
          </div>        
          <!-- form --> 
      	<!-- 메인내용 끝 -->
</body>
</html>