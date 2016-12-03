<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

  

<main role="slider-container"> 

<!-- side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>
  <!-- 본문 -->
<div class="container">
   <div class="tab-content">
    
   <h3 class="box-title" style="color: white">게시판 List</h3>
      <table class="table table-bordered table-hover">
            <tr style="color: white">
              <th style="width: 10px">No</th>
              <th style="width : 10%">CATEGORY</th>
              <th style="width : 30%">TITLE</th>
              <th style="width : 10%">WRITER</th>
              <th>REGDATE</th>
              <th style="width : 10%">HIT-CNT</th>
            </tr>
            <c:forEach items="${list}" var="bulletin">
          <tr style="color:white">
            <td>${bulletin.bulletin_num}</td>
            
            <td>${bulletin.bulletintype_num }</td>
            <td><a href='/sarticle/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bulletin_num=${bulletin.bulletin_num}'>${bulletin.bulletin_title}<strong>[${bulletin.reply_count }]</strong></a></td>
            <td>${bulletin.member_num}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin.bulletin_date}" /></td>
            <td><span class="badge bg-red">${bulletin.bulletin_hitcount }</span></td>
          </tr>
         </c:forEach>
             
       </table>
       <!-- 페이지 *************************************-->
       <div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
		</div>
		<!-- /.box-footer-->
		<!-- ************************************* -->
		
		<!-- 검색부분 **************-->
		<div class='box-body' class="form-control">

		<select name="searchType" class="select">
			<option value="n"
				<c:out value="${cri.searchType == null?'selected':''}"/>>
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
				Title</option>
			<option value="c"
				<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
				Content</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
				Writer</option>
			<!--  
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
				Title OR Content</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
				Content OR Writer</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
				Title OR Content OR Writer</option>
			-->	
		</select> 
		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
		<button id='searchBtn' class="btn">Search</button>
		<!-- <button id='newBtn'>New Board</button> -->
	
	 </div>
	 <!-- ************** -->
	 
      <div align="left" style="margin-right: 10px">
         <button class="btn btn-default  btn3d" id="newBtn">
            <span class="glyphicon glyphicon-pencil"> 글 작성 </span> 
         </button>
      </div>
      
   </div>
   <!-- tab-content -->
</div>
<!-- container  -->

  <!-- footer -->
 </main>
  <jsp:include page="../include/footer.jsp"/>
 
 
<form id="jobForm">
  <input type='hidden' name="page" value="${pageMaker.cri.perPageNum}">
  <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}">
</form> 


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 

<script>
	var result = '${msg}';
	
	if(result == 'success'){
		alert("처리가 완료되었습니다.");
	}
</script>

<script src="/html/js/jquery.min.js" type="text/javascript"></script> 

<!-- custom --> 

<script src="/html/js/custom.js" type="text/javascript"></script> 
<script src="/html/js/nav-custom.js" type="text/javascript"></script> 

<!-- Include all compiled plugins (below), or include individual files as needed --> 

<script src="/html/js/bootstrap.min.js" type="text/javascript"></script> 

<!-- jquery.countdown --> 

<!-- <script src="/html/js/countdown-js.js" type="text/javascript"></script> --> 
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
    	
    	var result = '${msg}';

    	if (result == 'SUCCESS') {
    		alert("처리가 완료되었습니다.");
    	}
    	/*
    	$(".pagination li a").on("click", function(event){
    		
    		event.preventDefault(); 
    		
    		var targetPage = $(this).attr("href");
    		
    		var jobForm = $("#jobForm");
    		jobForm.find("[name='page']").val(targetPage);
    		jobForm.attr("action","/article/listPage").attr("method", "get");
    		jobForm.submit();
    	}); 
		*/
		
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
    <script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {

					self.location = "write";

				});

			});
</script>
</body>
</html>