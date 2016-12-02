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
				
				var d = new Date();
				$.ajax({
					   type : 'GET',
					   url  : '/schedule/jsontest',
					   dataType : 'JSON',
					   success : function(data) {
						   var date;
						   for(var k=0; k<data.length; k++){
							   date = new Date(data[k].schedule_deadline);
							   date.setTime(date.getTime()+86400000);
							   alert(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate()));
						   		calender={id : data[k].schedule_num,
										  title : data[k].schedule_title,
										  start : data[k].schedule_date,
										  end : date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate())
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
								defaultDate : d.getFullYear()+"-"+(d.getMonth() + 1)+"-"+d.getDate(),
								locale : initialLocaleCode,
								weekNumbers : true,
								navLinks : true, // can click day/week names to navigate views
								editable : true,
								eventLimit : true, // allow "more" link when too many events
								selectable: true,
								selectHelper: true,
								select: function(start, end) {//표안에 선택시 이벤트처리
									window.open("/schedule/add_View", '등록','width=700,height=600');
									var eventData;
									$('#calendar').fullCalendar('unselect');
								},
								events : jsonData,
								eventClick: function(event) {//클릭시 이벤트 보여주는 메소드
									window.open("/schedule/detail_View?schedule_num="+event.id, event.title, 'width=700,height=600');// 상세일정 보여주는 popup창 생성
									return false;
								}
							});
					   },
					   error : function(xhr, status, error) {
							alert("에러발생");
			           }
				});				
			}); 
	
	function recall() {
		location.replace("/schedule");
	}
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