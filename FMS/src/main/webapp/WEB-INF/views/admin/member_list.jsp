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
<title>:: 관리자 멤버 리스트 ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="image/x-icon">

<!-- 3d Button Custum -->
<link href="/html/css/btn_3d.css" rel="stylesheet">

<!-- style -->
<link href="/html/css/style.css" rel="stylesheet">

<!-- 스크립트 처리를 위한 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="/html/css/btn_3d.css" rel="stylesheet">
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

  <!-- 본문 시작 -->
<section class="content">
	<div class="container">
			
		<!-- hidden값처리 -->
		<form role="form" method="get">
			<!-- member_num으로 사용자 정보 받아오기 -->
			<input type='hidden' name='member_num' value="${MemberAdmin.member_num}">
		</form>
	
		<div class="tab-content" align="center">
		 	<!-- title image -->
	    	<img src="/html/images/admin.png" style="margin-top:20px; margin-bottom:50px; height: 50px">
		
			<!-- Table Form 시작-->
			<table class="table table-bordered" style="width: 70%" >
			
				  <!-- Table header 정보 -->
			      <tr style="color: white">
			        <th style="width : 10%">회원 사진</th>
			        <th style="width : 10%">회원 ID</th>
			        <th style="width : 10%">회원 이름</th>
			        <th style="width : 20%">전화번호</th>
			        <th style="width : 10%">가입일</th>
			        <th style="width : 5%">정보 수정</th>
			        <th style="width : 5%">회원 탈퇴</th>
			      </tr>
	
				
				 <c:forEach items="${memberList}" var="MemberAdmin"> 
				    <tr style="color: white;">
				      <td><img src="/html/images/test_image.jpg" style="height: 55px"></td>
				      <td style="font-size: 15pt; font-style: italic;"><a href='/admin/member_read?member_num=${MemberAdmin.member_num}'>${MemberAdmin.member_id}</a></td>
				      <td>${MemberAdmin.member_name}</td>
				      <td >${MemberAdmin.member_phone}</td>
				      <td>${MemberAdmin.member_regdate}</td>
					  <td>
					  	<button onclick="javascript:location.href='/admin/member_modify?member_num=${MemberAdmin.member_num}'" class="btn btn-info btn-sm  btn3d"><span class="glyphicon glyphicon-edit"></span> 수정</button>
					  </td>
					  <td align="center">
					  	  <button onclick="javascript:location.href='/admin/member_remove?member_num=${MemberAdmin.member_num}'" class="btn btn-danger btn-sm btn3d">		
					  	  <span class="glyphicon glyphicon-remove-circle"></span> 탈퇴
						  </button>
					  </td>
				    </tr>
				</c:forEach> 
		    </table>
		    <!-- Table Form 끝-->
		    
		    
		    <!-- 검색 Form 시작 -->
			<div class="input-group" style="width: 35%; margin-bottom: 10px">
				<div class='box-body'>
					<select name="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							선택</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							이름</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							아이디</option>
					</select> 
					<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
					<button class="btn btn-info btn-xs" id='searchBtn'>검색</button>
					<script>
						$(document).ready(
							function() {
								$('#searchBtn').on(
										"click",
										function(event) {
											self.location = "member_list"
													+ '${pageMaker.makeQuery(1)}'
													+ "&searchType="
													+ $("select option:selected").val()
													+ "&keyword=" + $('#keywordInput').val();
							});
						});
					</script>
				</div>
			</div>
			<!-- 검색 Form 끝-->
		    
		    
		    <!-- 페이징 처리 시작 -->
			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="member_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="member_list${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="member_list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		    <!-- 페이징 처리 끝 -->
		</div>
	</div>
</section>
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

<!-- msg alert 알람창 스크립트 -->    
<script>
	var result = '${alert}';

	//수정
	if(result == 'MODIFY'){
		alert("회원 수정이 완료되었습니다.");
	}

	//삭제
	else if(result == 'REMOVE'){
		alert("회원 삭제가 완료되었습니다.");
	}
</script>


</body>
</html>