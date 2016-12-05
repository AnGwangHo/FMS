<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='/html/js/jquery.min.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title</title>
</head>
<body>
<form action="/schedule/add_View" method="post">
	<div class="row col-*-10 input-group">
		<span class="input-group-addon">Title</span>
		<input class="form-control" id="title" type="text" name="schedule_title" placeholder="일정 제목을 입력하세요...">
	</div>
	<div class="row col-*-10 input-group">
			<span class="input-group-addon">Writer</span>
			<input class="form-control" id="schedule_writer" type="text" disabled>
			<span class="input-group-addon">start</span>
			<input class="form-control" type="date" name="schedule_date">
			<span class="input-group-addon">end</span>
			<input class="form-control" type="date" name="schedule_deadline">
	</div>
	<div class="row col-*-10 input-group">
		<span class="input-group-addon">Location</span>
		<input class="form-control" type="text" name="schedule_location" placeholder="모임 장소를 입력하세요...">
	</div>
	<div class="row col-*-10 form-group">
		<textarea class="form-control" rows="10" name="schedule_content" placeholder="일정 내용을 입력하세요...."></textarea>
	</div>
	<div class="row col-*-10 form-group" id="buttonLine">
		<input class="btn btn-success" type="submit" value="등록">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</form>

</body>
</html>