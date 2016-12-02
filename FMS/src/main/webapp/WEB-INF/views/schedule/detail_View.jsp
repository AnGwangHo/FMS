<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='/html/js/jquery.min.js'></script>
<c:set var="schedule" value="#{schedule }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title</title>
</head>
<body>
<form action="/schedule/modify" method="post">
<input type="hidden" name="schedule_num" value="${schedule.schedule_num}">
<div>
	<label>제목 : </label>
	<input type="text" name="schedule_title" value="${schedule.schedule_title}">
</div>
<div>
	<label>장소 : </label>
	<input type="text" name="schedule_location" value="${schedule.schedule_location}">
</div>
<div>
	<label>작성자 : </label>
	<input type="text" name="schedule_writer" value="${schedule.schedule_writer}">|
	<label>날짜 : </label>
	<input type="date" name="schedule_date" value="${schedule.schedule_date}">~
	<input type="date" name="schedule_deadline" value="${schedule.schedule_deadline}">
	<input type="button" id="join" value="참여">
</div>
<div>
	<label>경기 참여인원 : </label>
	<input type="text" name="schedule_joinname" value="${schedule.schedule_joinname }">
</div>
<div>
	<textarea rows="10" cols="80" name="schedule_content">
		${schedule.schedule_content }
	</textarea>
</div>
<div>
	<input type="button" id="delete" value="삭제">
	<input type="submit" id="modify" value="수정">
</div>
</form>
<!-- 여기서부터 아래까지는 등록 후 가능 -->
<div>
	<label>KOSTA</label>
	<input type="text" value="댓글입니다.">
	<label>YYYY-MM-DD</label>
	<input type="button" value="수정">
	<input type="button" value="삭제">
</div>
<div>
	<form action="" method="post">
		<label>Writer</label>
		<textarea rows="3" cols="50" placeholder="내용을 입력하세요."></textarea>
		<input type="button" value="등록">
	</form>
</div>
<!-- 여기까지 -->
<input type="button" value="닫기" id="close">

<script>
	$(function() {
		$("#close").click(function() {
			window.opener.recall();//부모창의 스크립트를 호출
			self.close();//자기 자신을 닫는다.
		});
		$("#delete").click(function() {
			
			var form = document.createElement("form");
			form.setAttribute("method","post");
			form.setAttribute("action","/schedule/remove");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "schedule_num");
			hiddenField.setAttribute("value", '${schedule.schedule_num}');
			
			form.appendChild(hiddenField);
			document.body.appendChild(form);
			form.submit();
			
		});
		
		if('${msg}'=='OK'){
			$("#close").trigger('click');
		}else if('${msg}'=='MODIFY'){
			
		}else{
			window.opener.recall();
		}
		
		document.title = '${schedule.schedule_title}';//자식창 이름 변경
	});
</script>
</body>
</html>