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
<script src="/html/js/jquery.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/html/js/jquery.contact.js"></script>
<script type="text/javascript" src="/html/js/jquery-3.1.1.min.js"></script>
<!--  vote-style(youngmook) -->
<link href="/html/css/votestyle.css" rel="stylesheet">
<script src="/html/js/vote.js"></script> 
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
  <div class='row'>
    <div class='col-md-10' style="margin-left: 8%;">
      <div class="carousel slide media-carousel" id="recommendations">
        <div class="carousel-inner">
          <div class="item  active">
            <div class="row">
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>          
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>              
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>          
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>             
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>          
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt=""  data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" data-src="holder.js/120x100%"></a>
              </div>
              <div class="col-md-2">
                <a class="thumbnail" href="#"><img alt="" src="http://placehold.it/120x100%"></a>
              </div>
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#recommendations" class="left carousel-control btn btn-default btn-primary"><span class="fa fa-arrow-circle-left"></span></a>
        <a data-slide="next" href="#recommendations" class="right carousel-control btn btn-default btn-primary"><span class="fa fa-arrow-circle-right"></span></a>
      </div>                          
    </div>
  </div>
</body>
</html>