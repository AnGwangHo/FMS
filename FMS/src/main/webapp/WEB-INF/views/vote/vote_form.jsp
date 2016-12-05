<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta charset="utf-8">

<!-- Description, Keywords and Author -->

<meta name="description" content="">
<meta name="author" content="">
<title>:: 투표하기 ::</title>
<link rel="shortcut icon" href="/html/images/favicon.ico" type="/html/image/x-icon">
<!-- style -->
<link href="/html/css/style.css" rel="stylesheet">
<!-- style -->
<!-- bootstrap -->
<link href="/html/css/bootstrap.min.css" rel="stylesheet">
<!-- responsive -->
<link href="/html/css/responsive.css" rel="stylesheet">
<!-- font-awesome -->
<link href="/html/css/font-awesome.min.css" rel="stylesheet">
<!--  vote-style(youngmook) -->
<!-- <link href="/html/css/votestyle.css" rel="stylesheet"> -->
<script src="/html/js/jquery.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="/html/js/jquery.contact.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
  $('#vote').carousel({
    pause: true,
    interval: false,
  });
});
/* function checkReading () {
     if (checkReading.read) {
       return; 
     }
     checkReading.read = this.scrollHeight - this.scrollTop === this.clientHeight;
     document.registration.accept.disabled = document.getElementById("nextstep").disabled = !checkReading.read;
     checkReading.noticeBox.innerHTML = checkReading.read ? "Thank you." : "Please, scroll and read the following text.";
   }

   onload = function () {
     var oToBeRead = document.getElementById("rules");
     checkReading.noticeBox = document.createElement("span");
     document.registration.accept.checked = false;
     checkReading.noticeBox.id = "notice";
     oToBeRead.parentNode.insertBefore(checkReading.noticeBox, oToBeRead);
     oToBeRead.parentNode.insertBefore(document.createElement("br"), oToBeRead);
     oToBeRead.
     oToBeRead.onscroll = checkReading;
     checkReading.call(oToBeRead);
   } */
</script>
</head>
<body>
<!-- side bar -->
<jsp:include page="../include/side.jsp"/>

<!-- header -->
<jsp:include page="../include/header.jsp"/>

<!-- footer -->
<jsp:include page="../include/footer.jsp"/>

<!-- 본문내용! -->
<header role="page-title">
    <h2 align="center" style="margin-right: 90px; margin-bottom: 40px; color: white;"><span class="fa fa-futbol-o" style="margin-right: 20px;"></span>투표페이지(Voting)</h2>
</header>
    <div align="center" style="margin-bottom: 200px;">
    <ul>
<li>
<img src="/html/member_images/park.jpg" class="img-circle img-responsive" alt="Conxole Admin" width="170" height="150" style="float: left; margin-left: 550px; border: 8px solid black;" />
<img src="/html/member_images/youngpho.jpg" class="img-circle img-responsive" alt="Conxole Admin" width="160" height="140" style="display:inline; margin-right: 200px; border: 8px solid black;"/>
</li>
<li style="color:white; list-style: none;">
<div align="center">
<h3><label style="float: left; margin-left: 570px;"><b>11월 MVP<span class="fa fa-angellist"></span></b></label></h3>
<h3 style="display:inline; margin-right: 170px;"><b>이번달  MVP<span class="fa fa-angellist"></span></b></h3>
<!-- <h3><label style="float: left; margin-left: 420px;"><b>11월 MVP<span class="fa fa-angellist"></span></b></label></h3>
<h3 style="display:inline; margin-right: 170px;"><b>이번달  MVP<span class="fa fa-angellist"></span></b></h3> -->
</div>
</li>
</ul>
 <div class="container">
    <div class='col-md-12'>
      <div class="carousel slide media-carousel" id="vote">
        <div class="carousel-inner">
          <div class="item  active">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>          
              <div class="col-md-4">
               <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>          
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>          
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>
              <div class="col-md-4">
                 <a class="thumbnail" href="#">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-calendar-check-o"></span>＜ 경기 ＞<span class="fa fa-calendar-check-o"></span>
                    </h3>
                </div>
                <div class="panel-body">
                <label>YYYY-MM-DD</label>
               </div>
            <div class="panel-footer">
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">전반</button>
            <button type="button" class="btn btn-primary btn-sm" style="width: 120px;">후반</button>
            </div>
            </div></a>
              </div>      
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#vote" class="left carousel-control">‹</a>
        <a data-slide="next" href="#vote" class="right carousel-control">›</a>
      </div>                          
  </div>
</div>
<table style="table-layout:fixed; margin-left:60px;">
<tr>
<th style="width:888px; padding-left:300px; margin-top: -10px;">
<span class="fa fa-clipboard" style="margin-right: 15px;"></span>MVP 투표하기 </th>
</tr>
</table>
<div style="width:950px; height:500px; overflow:scroll; padding-left: 62px; border:3; border-style:solid; border-color:black; overflow-x:hidden; ">
<table style="table-layout:fixed"><!--  class="table-fill" -->
<tr>
<th>투표</th>
<th>프로필 사진</th>
<th>　이름　</th>
<th>　　별점　　</th>
<th>　　　코멘트　　　　</th>
</tr>
<!-- </table> -->
<!-- <div style="width:950px; height:350px; overflow:scroll; padding:10px; border:3; border-style:solid; border-color:black; overflow-x:hidden; ">
<table style="margin-left:6px; width: 108%; margin-top: -10px;"> -->
<tbody class="table-hover">
<tr>
<td><input type="radio" name="mvp" value="1">투표
</td>
<td>임영묵.jpg
</td>
<td>임영묵
</td>
<td>★★★★☆
</td>
<td>퇴근하고싶다
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>안광호.jpg
</td>
<td>안광호
</td>
<td>★★★★★
</td>
<td>커피는 하루에 3개
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>박찬용.jpg
</td>
<td>박찬용
</td>
<td>★★★★★
</td>
<td>라이온갖고싶다
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>강준.gif
</td>
<td>강준
</td>
<td>★★★★★
</td>
<td>injeung?
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>김민호.zip
</td>
<td>김민호
</td>
<td>★★★★★
</td>
<td>하루면 게시판끝.
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>안광호.jpg
</td>
<td>안광호
</td>
<td>★★★★★
</td>
<td>커피는 하루에 3개
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>안광호.jpg
</td>
<td>안광호
</td>
<td>★★★★★
</td>
<td>커피는 하루에 3개
</td>
</tr>
<tr>
<td><input type="radio" name="mvp" value="2">투표
</td>
<td>안광호.jpg
</td>
<td>안광호
</td>
<td>★★★★★
</td>
<td>커피는 하루에 3개
</td>
</tr>
</tbody>
</table>
</div>
<button type="button" class="btn btn-success btn-lg btn3d" style="margin-left: 50%; margin-top: 30px; width: 150px;"><span class=" fa fa-check-square-o "></span> 투표</button>
</div>
</body>
<style>
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
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
  font-size:16px;
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
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}
/* carousel */
.media-carousel 
{
  margin-bottom: 0;
  padding: 0 40px 30px 40px;
  margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left 
{
  left: -12px;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Next button  */
.media-carousel .carousel-control.right 
{
  right: -12px !important;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Changes the position of the indicators */
.media-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
.media-carousel .carousel-indicators .active 
{
  background: #333333;
}
.media-carousel img
{
  width: 250px;
  height: 100px
}
/* End carousel */
.btn3d {
    position:relative;
    top: -6px;
    border:0;
     transition: all 40ms linear;
     margin-top:10px;
     margin-bottom:10px;
     margin-left:2px;
     margin-right:2px;
}
.btn3d:active:focus,
.btn3d:focus:hover,
.btn3d:focus {
    -moz-outline-style:none;
         outline:medium none;
}
.btn3d:active, .btn3d.active {
    top:2px;
}
.btn3d.btn-white {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.10) inset, 0 8px 0 0 #f5f5f5, 0 8px 8px 1px rgba(0,0,0,.2);
    background-color:#fff;
}
.btn3d.btn-white:active, .btn3d.btn-white.active {
    color: #666666;
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 1px rgba(255,255,255,0.15) inset, 0 1px 3px 1px rgba(0,0,0,.1);
    background-color:#fff;
}
</style>
</html>