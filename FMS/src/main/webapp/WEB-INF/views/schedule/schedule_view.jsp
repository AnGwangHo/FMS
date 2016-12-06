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
<title>:: 스케쥴 ::</title>
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

<style type="text/css">
   #buttonLine{
      text-align: right;
   }
   
   textarea{
      resize: none;
   }
</style>
</head>

<body style="margin-bottom: 80px">

   <!-- side bar -->
   <jsp:include page="../include/side.jsp" />

   <!-- header -->
   <jsp:include page="../include/header.jsp" />
   <!-- Trigger the modal with a button -->

   <!-- main -->


   <!-- 공지사항 시작 -->
   <div align="center">
      <table class="table table-bordered table-hover" style="width: 46%; margin-bottom: -70px;">
         <tr style="color: white">
            <th style="width: 7%">글번호</th>
            <th style="width: 10%">글종류</th>
            <th style="width: 30%">제목</th>
            <th style="width: 10%">작성자</th>
            <th style="width: 10%">작성일</th>
            <th style="width: 7%">조회수</th>
         </tr>

         <c:forEach items="${sendlist}" var="bulletin" begin="0" end="2">
            <c:choose>
               <c:when test="${bulletin[1]==1}">
                  <tr>
                     <td>
                        ${bulletin[0]}                     
                     </td>
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
      
                     <td>
                        <a href='/board/board_read${pageMaker.makeSearch(pageMaker.cri.page) }&bulletin_num=${bulletin[0]}'>${bulletin[2]}<strong>[${bulletin[6]}]</strong></a>
                     </td>
      
                     <td>
                         ${bulletin[3]}
                     </td>
      
                     <td>
                        <fmt:formatDate pattern="yyyy-MM-dd"
                           value="${bulletin[4]}" />
                     </td>
                     
                     <td>
                        <span class="badge bg-red">${bulletin[5]}</span>
                     </td>
                  </tr>
               </c:when>
            </c:choose>
         </c:forEach>
      </table>
   </div>
   <!-- 공지사항 끝 -->


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