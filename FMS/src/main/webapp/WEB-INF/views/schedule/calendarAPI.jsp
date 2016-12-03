<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel='stylesheet' href='/html/css/jquery-ui.min.css' />
<link href='/html/css/fullcalendar.css' rel='stylesheet' />
<link href='/html/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/html/js/moment.min.js'></script>
<script src='/html/js/jquery.min.js'></script>
<script src='/html/js/fullcalendar.min.js'></script>
<script src='/html/js/locale-all.js'></script>
<script>
	$(document).ready(function() {
				var initialLocaleCode = 'ko';//언어 한글로 설정
				
				var jsonData = new Array();
				var calender={};
				
				var nowDay = new Date();
				
				var $modal = $('#detailview');
				var nowScheduleNum;
				
				//현재 날짜 중 일이 1자리 수라면 앞에 0을 붙여준다.
				if(nowDay.getDate()<10){
					nowDay = nowDay.getFullYear()+"-"+(nowDay.getMonth()+1)+"-0"+(nowDay.getDate());
				}else{
					nowDay = nowDay.getFullYear()+"-"+(nowDay.getMonth()+1)+"-"+(nowDay.getDate());
				}
				
				$.ajax({
					   type : 'GET',
					   url  : '/schedule/jsontest',
					   dataType : 'JSON',
					   success : function(data) {
						   var date;
						   for(var k=0; k<data.length; k++){
							   date = new Date(data[k].schedule_deadline);
							   date.setTime(date.getTime()+86400000);
							   
							   if(date.getDate()<10){
							       date = date.getFullYear()+"-"+(date.getMonth()+1)+"-0"+(date.getDate());
							   }else{
								   date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate());
							   }
						   	   
							   calender={id : data[k].schedule_num,
										 title : data[k].schedule_title,
										 start : data[k].schedule_date,
										 end : date
						   				};
						   	   jsonData.push(calender);
						   }
					   },
					   complete : function(data) {
						   	$('#calendar').fullCalendar({
								theme: true,
								header : {
									left : 'prev,next today',
									center : 'title',
									right : 'month,agendaWeek,agendaDay,listMonth'
								},
								defaultDate : nowDay,
								locale : initialLocaleCode,
								weekNumbers : true,
								navLinks : true, // can click day/week names to navigate views
								editable : true,
								eventLimit : true, // allow "more" link when too many events
								selectable: true,
								selectHelper: true,
								select: function(start, end) {//표안에 선택시 이벤트처리
									//window.open("/schedule/add_View", '등록','width=700,height=600');
									$('#myModal').modal('show');
									var eventData;
									$('#calendar').fullCalendar('unselect');
								},
								events : jsonData,
								eventClick: function(event) {//클릭시 이벤트 보여주는 메소드
									/* $('#detailview').modal({
										remote: '/schedule/detail_View?schedule_num='+event.id
									}); */
									nowScheduleNum = event.id;
									$('#detailview').load('/schedule/detail_View?schedule_num='+event.id, '', function() {
										$('#detailview').modal();
									})
								}
							});
					   },
					   error : function(xhr, status, error) {
							alert("에러발생");
			           }
				});
				
				//참여 버튼 클릭시
				$modal.on('click', '#joinGame', function(){
					var params = 'schedule_num='+nowScheduleNum+'&member_num='+'99';
					$.ajax({
						   type : 'POST',
						   url  : '/schedule/joinGame',
						   data : params,
						   success : function(data) {
							   $('#detailview').load('/schedule/detail_View?schedule_num='+nowScheduleNum, '', function() {//페이지 호출
								})
						   }
					})
				});
				
				//수정 버튼 클릭시
				$modal.on('click', '#modify', function(){
					var params = jQuery("#scheduleModify").serialize();
					$.ajax({
						   type : 'POST',
						   url  : '/schedule/modify',
						   data : params,
						   success : function(data) {
							   $('#detailview').load('/schedule/detail_View?schedule_num='+nowScheduleNum, '', function() {//페이지 호출
								})
						   }
					})
				});
			}); 
	
</script>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 40px auto;
	padding: 0 10px;
}
</style>
</head>
<body>

	<div id='calendar'></div>
	
</body>
</html>