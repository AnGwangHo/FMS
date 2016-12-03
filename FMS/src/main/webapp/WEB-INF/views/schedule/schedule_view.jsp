<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: Floxi ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico"
	type="image/x-icon">

<!-- style -->

<link href="/html/css/style.css" rel="stylesheet">

<!-- bootstrap -->

<link href="/html/css/bootstrap.min.css" rel="stylesheet">

<!-- responsive -->

<link href="/html/css/responsive.css" rel="stylesheet">

<!-- font-awesome -->

<link href="/html/css/font-awesome.min.css" rel="stylesheet">

<!-- Slider -->

</head>

<body>

	<!-- side bar -->
	<jsp:include page="../include/side.jsp" />

	<!-- header -->
	<jsp:include page="../include/header.jsp" />
	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Modal</button>

	<!-- main -->

	<!-- 일정추가 Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">일정 등록</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="../schedule/add_View.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	
	<div id="detailview" class="modal fade" role="dialog">
	</div>

			
				
			

		

	<main role="main" id="main">
	<div class="container">
		<div class="tab-content">
			<!-- 캘린더 API적용 -->
			<c:import url="../schedule/calendarAPI.jsp"></c:import>
		</div>
	</div>
	</main>

	<!-- footer -->

	<jsp:include page="../include/footer.jsp" />

	<!-- custom -->

	<script src="/html/js/custom.js" type="text/javascript"></script>
	<script src="/html/js/nav-custom.js" type="text/javascript"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script src="/html/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="/html/js/html5shiv.js" type="text/javascript"></script>

	<!-- Typed -->
	<!-- Typed jS -->

	<script src="/html/js/typed.js" type="text/javascript"></script>
	<script>
		$(function() {

			$("#typed").typed({
				// strings: ["Typed.js is a <strong>jQuery</strong> plugin.", "It <em>types</em> out sentences.", "And then deletes them.", "Try it out!"],
				stringsElement : $('#typed-strings'),
				typeSpeed : 100,
				backDelay : 1000,
				loop : true,
				contentType : 'html', // or text
				// defaults to false for infinite loop
				loopCount : false,
				callback : function() {
					foo();
				},
				resetCallback : function() {
					newTyped();
				}
			});

			$(".reset").click(function() {
				$("#typed").typed('reset');
			});

		});

		function newTyped() { /* A new typed object */
		}

		function foo() {
			console.log("Callback");
		}
	</script>
</body>
</html>