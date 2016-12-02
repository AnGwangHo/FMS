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

<link href="/html/css/style.css" rel="stylesheet">
<link href="/html/css/btn_3d.css" rel="stylesheet">
<!-- style -->

<!-- bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<link href="/html/css/btn_3d.css" rel="stylesheet">

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

<main role="slider-container"> 
  
<!-- side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

  
  <!-- main -->
  
  <main role="main" id="main">
    <div class="container"> 
      
      <!-- tab-content -->
      <div class="tab-content"> 
        
        <!-- Home -->
        
			<section id="home" class="tab-pane fade in active">
				<div class="table-responsive">
					<div class="col-sm-12">
						<table class="table table-bordered ">
							<tr>
								<td class="active">글제목</td>
								<td colspan="3"><label style="color: white">정적테스트중...</label></td>
							</tr>
	
							<tr>
								<td class="active">작성자</td>
								<td ><label style="color: white">정적테스트중...</label></td>
								<td class="active">작성일</td>
								<td ><label style="color: white">정적테스트중...</label></td>
							</tr>
	
							<tr>
								<td class="active">첨부파일</td>
								<td><label style="color: white">정적테스트중...</label></td>
								<td class="active">조회수</td>
								<td><label style="color: white">정적테스트중...</label></td>
							</tr>
	
							<tr>
								<td colspan="4" ><pre>정적테스트중...
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								</pre></td>
							</tr>
						</table>
					</div>
		
				</div>
				
							
					<div align="right" style="margin-right: 10px">
						<button onclick="javascript:location.href='listAll'" class="btn btn-danger btn3d">
							<span class="glyphicon glyphicon-remove"></span> 삭제 
						</button>
						<button onclick="javascript:location.href='write'" class="btn btn-primary  btn3d">
							<span class="glyphicon glyphicon-pencil"></span> 글 수정
						</button>
						<button onclick="javascript:location.href='listAll'" class="btn btn-info btn3d">
							<span class="glyphicon glyphicon-th-list"></span> 목록으로 
						</button>
					</div>
				
				
				<!-- reply -->
				<div class="row">
					<div class="col-md-12">
			
						<div class="box box-success">
							<div class="box-header">
								<h3 class="box-title" style="color: white">ADD NEW REPLY</h3>
							</div>
							<div class="box-body">
								<label for="exampleInputEmail1" style="color: white">Writer</label> <input
									class="form-control" type="text" placeholder="USER ID"
									id="newReplyWriter"> <label for="exampleInputEmail1" style="color: white">Reply
									Text</label> <input class="form-control" type="text"
									placeholder="REPLY TEXT" id="newReplyText">
			
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
									REPLY</button>
							</div>
						</div>
			
			
						<!-- The time line -->
						<ul class="timeline">
							<!-- timeline time label -->
							<li class="time-label" id="repliesDiv"><span class="bg-green" style="color: white">
									Replies List </span></li>
						</ul>
			
						<div class='text-center'>
							<ul id="pagination" class="pagination pagination-sm no-margin ">
			
							</ul>
						</div>
			
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			
			
			          
			<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			  <div class="modal-dialog">
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"></h4>
			      </div>
			      <div class="modal-body" data-rno>
			        <p><input type="text" id="replytext" class="form-control"></p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
			        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>      



<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
{{/each}}
</script>


				
			</section>
        
        <!-- Home --> 
        
        <!-- about -->
        
        <section id="menu1" class="tab-pane fade other-page about-pan">
        </section>
        
        <!-- about --> 
        
        <!-- Newsletter Subscribtion -->
        
        <section id="menu2" class="tab-pane fade other-page">
        </section>
        
        <!-- Newsletter Subscribtion --> 
        
        <!-- Contact -->
        
        <section id="menu3" class="tab-pane fade other-page">
        </section>
        
        <!-- Contact --> 
        
      </div>
      
      <!-- tab-content --> 
      
    </div>
  </main>
  
  <!-- main --> 
  
  <!-- footer -->
  
  <jsp:include page="../include/footer.jsp"/>
 
</main>

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
    
<script type="text/javascript">
// Fake file upload
document.getElementById('fake-file-button-browse').addEventListener('click', function() {
	document.getElementById('files-input-upload').click();
});

document.getElementById('files-input-upload').addEventListener('change', function() {
	document.getElementById('fake-file-input-name').value = this.value;
	
	document.getElementById('fake-file-button-upload').removeAttribute('disabled');
});
</script>
</body>
</html>