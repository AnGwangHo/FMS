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
   
<link href="/html/css/bootstrap.min.css" rel="stylesheet">
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
  
  <main role="main">
  <section class="content">
    <div class="container"> 
      
      <!-- tab-content -->
      <div class="tab-content"> 
        
        <!-- Home -->
        
         <form role="form" action="modifyPage" method="post">
    
		    <input type='hidden' name='bulletin_num' value ="${bulletin.bulletin_num}">
		    <input type='hidden' name='page' value ="${cri.page}">
		    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
		    <input type="hidden" name="searchType" value="${cri.searchType }">
		    <input type="hidden" name="keyword" value="${cri.keyword }">
		    
    
 		</form>  
        
       
        
        
         
            <div class="table-responsive">
               <div class="col-sm-12">
                  <table class="table table-bordered ">
                     <tr>
                        <td class="active">글제목</td>
                        <td colspan="3"><label style="color: white">${bulletin.bulletin_title }</label></td>
                     </tr>
   
                     <tr>
                        <td class="active">작성자</td>
                        <td ><label style="color: white">${bulletin.member_num }</label></td>
                        <td class="active">작성일</td>
                        <td ><label style="color: white">${bulletin.bulletin_date }</label></td>
                     </tr>
   
                     <tr>
                        <td class="active">첨부파일</td>
                        <td><label style="color: white">${bulletin.bulletin_attachment }</label></td>
                        <td class="active">조회수</td>
                        <td><label style="color: white">${bulletin.bulletin_hitcount }</label></td>
                     </tr>
   
                     <tr>
                        <td colspan="4" ><pre>${bulletin.bulletin_content }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        </pre></td>
                     </tr>
                  </table>
               </div>
      
            </div>
            
               <div align="right" style="margin-right: 10px">
                  <button class="btn btn-danger btn3d">   
                     <span class="glyphicon glyphicon-remove"></span> 삭제 
                  </button>
                  <button type="submit"  class="btn btn-primary  btn3d">
                     <span class="glyphicon glyphicon-pencil"></span> 글 수정
                  </button>
                  <button  class="btn btn-info btn3d">       
                     <span class="glyphicon glyphicon-th-list"></span> 목록으로 
                  </button>
               </div>
<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-info").on("click", function(){
		formObj.attr("method", "get");		
		formObj.attr("action", "/sarticle/list");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/sarticle/removePage");
		formObj.attr("method","post");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("action" , "/sarticle/modifyPage");
		formObj.attr("method","get");
		formObj.submit();
	});
	
});
</script>
            
            
            
            <!-- 댓글 등록 -->
            <div class="row">
               <div class="col-md-12">
         
                  <div class="box box-success">
                     <div class="box-header">
                        <h3 class="box-title" style="color: white">ADD NEW REPLY</h3>
                     </div>
                     <div class="box-body">
                        <label for="newReplyWriter" style="color: white">Writer</label> 
                        <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter">
                        <label for="exampleInputEmail1" style="color: white">Reply Text</label> 
                        <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
         
                     </div>
                     <!-- /.box-body -->
                     <div class="box-footer">
                        <button type="button" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
                     </div>
                  </div>
         
         		  <!-- 댓글 목록 , 페이징 처리 -->
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
                 <button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
               
             </div>
           </div>
         </div>      


<!--  -->
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

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var bno = ${bulletin.bulletin_num};
	
	var replyPage = 1;

	function getPage(pageInfo) {

		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));

			$("#modifyModal").modal('hide');

		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + bno + "/1");

	});
	
	//여기부터 확인 ==============

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
			}});
	});


	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var rno = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage );
					}
			}});
	});
	
</script>
        
      </div>
      
      <!-- tab-content --> 
      
    </div>
    </section>
    
    
  </main>
  
  <!-- main --> 
  
  <!-- footer -->
  
<!--   
<script>
  
	
	$(document).ready(function(){
		
		/* var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-info").on("click", function(){
			formObj.attr("method", "get");		
			formObj.attr("action", "/article/listPage");
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "/article/removePage");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$(".btn-primary").on("click", function(){
			formObj.attr("action" , "/article/modifyPage");
			formObj.attr("method","get");
			formObj.submit();
		}); */
		
	});
	
	</script> 
-->
  
  
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

<!-- <script src="/html/js/countdown-js.js" type="text/javascript"></script>  -->
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