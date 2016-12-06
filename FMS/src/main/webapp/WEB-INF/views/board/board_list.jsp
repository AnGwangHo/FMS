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
<title>:: 게시판 ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="image/x-icon">

<!-- style -->
<link href="/html/css/btn_3d.css" rel="stylesheet">
<link href="/html/css/style.css" rel="stylesheet">

<!-- style -->


<!-- bootstrap -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
   <div class="tab-content" align="center">
      <!-- title image -->
         <img src="/html/images/bulletin.png" style="margin-top:20px; margin-bottom:50px; height: 50px">
    
      <table class="table table-bordered table-hover">
            <tr style="color: white">
              <th style="width : 5%">글번호</th>
              <th style="width : 10%">글종류</th>
              <th style="width : 30%">제목</th>
              <th style="width : 10%">작성자</th>
              <th style="width : 10%">작성일</th>
              <th style="width : 5%">조회수</th>
            </tr>
            <c:forEach items="${sendlist}" var="bulletin">
          <tr>
            <td>${bulletin[0]}</td>
            <td>
               <c:choose>
               <c:when test="${bulletin[1]==1}">
               공지사항
               </c:when>
               <c:when test="${bulletin[1]==2}">
               자유게시판
               </c:when>
               </c:choose>
            </td>
            <td><a href='/board/board_read${pageMaker.makeSearch(pageMaker.cri.page) }&bulletin_num=${bulletin[0]}'>${bulletin[2]}<strong>[${bulletin[6]}]</strong></a></td>
            <td>${bulletin[3]}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${bulletin[4]}" /></td>
            <td><span class="badge bg-red">${bulletin[5]}</span></td>
          </tr>
         </c:forEach>
             
       </table>
       <!-- 페이지 *************************************-->
       <div class="box-footer">

               <div class="text-center">
                  <ul class="pagination">

                     <c:if test="${pageMaker.prev}">
                        <li><a href="board_list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
                     </c:if>

                     <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
                           <a href="board_list${pageMaker.makeSearch(idx)}">${idx}</a>
                        </li>
                     </c:forEach>

                     <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                        <li><a href="board_list${pageMaker.makeSearch(pageMaker.endPage +1)}">&raquo;</a></li>
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
            선택</option>
         <option value="t"
            <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
            제목</option>
         <option value="c"
            <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
            내용</option>
         <option value="w"
            <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
            작성자</option>
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
      <button class="btn btn-info btn-xs" id='searchBtn'>검색</button>
      <!-- <button id='newBtn'>New Board</button> -->
   
    </div>
    <!-- ************** -->
    
      <div align="right" style="margin-right: 10px">
         <button class="btn btn-primary  btn3d" id="newBtn">
            <span class="glyphicon glyphicon-pencil"></span> 글작성  
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

                     self.location = "board_list"
                           + '${pageMaker.makeQuery(1)}'
                           + "&searchType="
                           + $("select option:selected").val()
                           + "&keyword=" + $('#keywordInput').val();

                  });

            $('#newBtn').on("click", function(evt) {

               self.location = "board_write";

            });

         });
</script>
</body>


<!-- 테이블 스타일 -->
<style>
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:14px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:12px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
  border-bottom: 1px solid #22262e;
}
div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:18px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}
</style>
</html>