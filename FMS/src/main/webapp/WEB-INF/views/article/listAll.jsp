<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link href="/html/css/bootstrap.min.css" rel="stylesheet">

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
<div class="container">
	<div class="tab-content">
	 
	<h3 class="box-title" style="color: white">게시판 List</h3>
		<table class="table table-bordered">
		      <tr style="color: white">
		        <th style="width: 10px">No</th>
		        <th style="width : 10%">CATEGORY</th>
		        <th style="width : 30%">TITLE</th>
		        <th style="width : 10%">WRITER</th>
		        <th>REGDATE</th>
		        <th style="width : 10%">HIT-CNT</th>
		      </tr>
		      <c:forEach items="${list}" var="bulletin">
		    <tr>
		      <td>${bulletin.bulletin_num}</td>
		      <td>${bulletin.bulletintype_num }</td>
		      <td><a href='/board/read?bno=${bulletin.bulletin_num}'>${bulletin.bulletin_title}</a></td>
		      <td>${bulletin.member_num}</td>
		      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin.bulletin_date}" /></td>
		      <td><span class="badge bg-red">${bulletin.bulletin_hitcount }</span></td>
		    </tr>
		   </c:forEach>
		       
		    <tr style="color: white">
		      <td>1</td>
		      <td>공지사항</td>
		      <td><a href='read'>동적테스트중</a></td>
		      <td>bangry</td>
		      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin.bulletin_date}" /></td>
		      <td><span class="badge bg-red">${bulletin.bulletin_hitcount }</span></td>
		    </tr>
		    <tr style="color: white">
		      <td>2</td>
		      <td>공지사항</td>
		      <td><a href='read'>동적테스트중</a></td>
		      <td>bangry</td>
		      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin.bulletin_date}" /></td>
		      <td><span class="badge bg-red">${bulletin.bulletin_hitcount }</span></td>
		    </tr>
		    <tr style="color: white">
		      <td>3</td>
		      <td>공지사항</td>
		      <td><a href='read'>동적테스트중</a></td>
		      <td>bangry</td>
		      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin.bulletin_date}" /></td>
		      <td><span class="badge bg-red">${bulletin.bulletin_hitcount }</span></td>
		    </tr>
		   
	    </table>
		
		<div align="left" style="margin-right: 10px">
			<button onclick="javascript:location.href='write'" class="btn btn-default  btn3d">
				<span class="glyphicon glyphicon-pencil"></span> 글 작성
			</button>
		</div>
	</div>
</div>
  
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
</body>
</html>