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
<title>:: 게시글등록 ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="image/x-icon">

<!-- style -->
<!-- Bootstrap 3D 버튼 추가를 위한 링크 -->
<link href="/html/css/btn_3d.css" rel="stylesheet">
<link href="/html/css/style.css" rel="stylesheet">


<!-- bootstrap -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
<link href="/html/css/bootstrap.min.css" rel="stylesheet">


<!-- 업로드를 위한 upload.js 추가 -->
<script type="text/javascript" src="/html/js/upload.js"></script>


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


<!-- =======================================================================================  -->
<main role="slider-container">

<!-- Side bar --> 
<jsp:include page="../include/side.jsp"/>

<!-- Header -->
<jsp:include page="../include/header.jsp"/>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>
     
<!-- 본문 -->
<div class="container"> 
     <div class="tab-content"> 
             
            <div class="table-responsive">
                  <!-- ================================= -->
				  <form id="registerForm" action="write" method="post">
				  
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- 예시히든값/회원가입+아이디로그인 연동되면 바꿀 것! -->
												<input type='hidden' name='member_num' value="30">
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
												<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★ -->				 
				
				  <!-- 데이터 TABLE INPUT 부분 시작 -->
                  <table class="table table-bordered  table-hover ">
                  	  <tr>
                        <td class="active">게시글 종류</td>
                        <td colspan="3">
                        	<select name="bulletintype_num" class="form-control">
                        		<option value="1">공지사항</option>
                        		<option value="2">자유게시판</option>
                        	</select>
                        </td>
                     </tr>
                     <tr>
                        <td class="active">글제목</td>
                        <td colspan="3"><input type="text" class="form-control" name="bulletin_title"></td>
                     </tr>
      
                     <tr>
                        <td class="active">작성자</td>
                        <td><input type="text" class="form-control" name="member_num" placeholder="" value="${member_num}" readonly="readonly"></td>
                        <td class="active">첨부파일</td>
                        
                       <!-- 첨부파일을 위한 input file -->
                        <td>
							 <input type="file" name="bulletin_attachment" id="bulletin_attachment"> 
                        </td>
                     </tr>
      
                     <tr>
                        <td colspan="4"><textarea rows="20" cols="175" class="form-control"
                              onfocus="javascript:this.value='';" name="bulletin_content"  placeholder="여기에 글을 입력하세요.">여기에 글을 입력하세요.</textarea></td>
                     </tr>
                  </table>
                  <!-- 데이터 TABLE INPUT 부분 끝 -->
                  
                  
                  
               <div align="right" style="margin-right: 10px">
                  <button onclick="javascript:location.href='listAll'"  class="btn btn-danger  btn3d">
                     <span class="glyphicon glyphicon-remove"></span> 취소
                  </button> 
                  <button type="submit" class="btn btn-primary  btn3d">  <!-- onclick="javascript:location.href='listAll'" --> 
                     <span class="glyphicon glyphicon-ok">작성</span> 
                  </button>
               </div>
               </form>
                <!-- FORM : 회원가입 등록을 위한 registerForm 종료 -->
               </div>
               <!-- table-responsive -->
      </div>
      <!-- tab-content --> 
      
</div>
<!-- container  -->
  
  <!-- footer -->
 </main>









<!-- =======================================================================================  -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	
	<!-- 파일등록을 위한 SCRIPT 처리 시작-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
<li>
<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>             
	</script>    
	
	<!-- 사진 업로드를 위한 Ajax -->
	<script>
	   var file = document.querySelector('#bulletin_attachment');
	   var changed = false;

	   file.onchange = function (event) {
	       var fileList = file.files ;
		  /* if(!checkImageType(fileList[0].name))   {
	         alert("이미지 파일만 올려주세요.");
	         return;
	      } */
	      //var oldImgName = $(".uploadedList").find("a").attr("name");
	       
	       // 서버에 파일 전송
	       var formData = new FormData();
	       formData.append("file", fileList[0]);

	       $.ajax({
	         url: "/uploadAjax",
	         data: formData,
	         dataType: "text",
	         processData: false, // 데이터를 query string으로 변환할지 결정
	         contentType: false, // 파일 전송을 위해 타입 변경
	         type: "POST",
	         success: function(data)   {
	            if(checkImageType(data))   {
	               var fileInfo = getFileInfo(data);
	               var html = template(fileInfo);
	               changed = true;
	               console.log("변경된 이미지: " + fileInfo.fullName);
	            }
	            $(".uploadedList").empty().html(html);
	         }
	      });

	       // 기존 이미지가 아니고, 다른 이미지에서 또 다시 변경했을 경우
	      //if(changed)   {
	      //   deleteFile(oldImgName);
	      //}
	   };
	</script>
	
	<script>
	var template = Handlebars.compile($("#template").html());
	
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		that.get(0).submit();
	});
	</script>
	<!-- 파일 SCRIPT 처리 끝-->




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
<!-- 
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
</script> -->

</body>
</html>