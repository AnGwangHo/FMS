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
            <h2 align="center" style="margin-right: 110px; margin-bottom: 40px; color: white;"><span class="fa fa-futbol-o" style="margin-right: 20px;"></span>투표페이지(Voting)</h2>
          </header>
         <ul>
<li>
<img src="/html/member_images/park.jpg" class="img-circle img-responsive" alt="Conxole Admin" width="200" height="200" style=""/>
<img src="/html/member_images/youngpho.jpg" class="img-circle img-responsive" alt="Conxole Admin" width="200" height="200" style=""/>
</li>
<li>
<h3><b>11월 MVP<span class="fa fa-angellist"></span></b></h3>
<h3><b>이번달  MVP<span class="fa fa-angellist"></span></b></h3>
</li>
<li>
<h3><span class="fa fa-angle-double-left" style="float: left;"></span></h3>

<h3><span class="fa fa-angle-double-right" style="float: right;"></span></h3>
</li>
</ul>
</body>
</html>