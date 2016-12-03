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
  
  
    <div class="container"> 
      
      <!-- tab-content -->
      <div class="tab-content"> 
             
            <div class="table-responsive">
               
                  <table class="table table-bordered  table-hover ">
                     <tr>
                        <td class="active">글제목</td>
                        <td colspan="3"><input type="text" class="form-control" name="subject"></td>
                     </tr>
      
                     <tr>
                        <td class="active">작성자</td>
                        <td><input type="text" class="form-control" name="writer"
                           placeholder="" disabled="disabled"></td>
                        <td class="active">첨부파일</td>
                        <td><div class="input-group">
                            <span class="input-group-btn">
                              <button id="fake-file-button-browse" type="button" class="btn btn-default">
                                 <span class="glyphicon glyphicon-file"></span>
                              </button>
                           </span>
                           <input type="file" id="files-input-upload" style="display:none">
                           <input type="text" id="fake-file-input-name" disabled="disabled" placeholder="File not selected" class="form-control">
                           <span class="input-group-btn">
                              <button type="button" class="btn btn-default" disabled="disabled" id="fake-file-button-upload">
                                 <span class="glyphicon glyphicon-upload"></span>
                              </button>
                           </span>
                        </div></td>
                     </tr>
      
                     <tr>
                        <td colspan="4"><textarea rows="20" cols="178"
                              onfocus="javascript:this.value='';" name="content">여기에 글을 입력하세요.</textarea></td>
                     </tr>
                  </table>
               
            
            
               <div align="right" style="margin-right: 10px">
                  <button onclick="javascript:location.href='listAll'" type="" class="btn btn-danger  btn3d">
                     <span class="glyphicon glyphicon-remove"></span> 취소
                  </button>
                  <button onclick="javascript:location.href='listAll'" class="btn btn-primary  btn3d">
                     <span class="glyphicon glyphicon-ok"></span> 작성
                  </button>
               </div>
               
     		</div>
     		<!-- table-responsive -->
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