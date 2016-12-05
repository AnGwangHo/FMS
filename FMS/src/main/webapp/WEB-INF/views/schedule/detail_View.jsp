<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="schedule" value="#{schedule }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>title</title>
</head>
<body>
	<!-- 일정 상세보기 Modal -->
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${schedule.schedule_title}</h4>
				</div>
				<div class="modal-body">
					<form id="scheduleModify" method="post">
						<input type="hidden" name="schedule_num" value="${schedule.schedule_num}">
						<div class="row col-*-10 input-group">
							<span class="input-group-addon">Title</span>
							<input class="form-control" type="text" name="schedule_title" value="${schedule.schedule_title}">
						</div>
						<div class="row col-*-10 input-group">
							<span class="input-group-addon">Writer</span> 
							<input class="form-control" type="text" name="schedule_writer" value="${schedule.schedule_writer}" disabled>
							<span class="input-group-addon">start</span> 
							<input class="form-control" type="date" name="schedule_date" value="${schedule.schedule_date}">
							<span class="input-group-addon">end</span> 
							<input class="form-control" type="date" name="schedule_deadline" value="${schedule.schedule_deadline}">
						</div>
						<div class="row col-*-10 input-group">
							<span class="input-group-addon">Location</span>
							<input class="form-control" type="text" name="schedule_joinname" id="schedule_joinname" value="${schedule.schedule_location }">
						</div>
						<div class="row col-*-10 input-group">
							<span class="input-group-addon">JoinMember</span>
							<div class="form-inline">
								<div class="form-group">
									<input class="form-control" type="text" name="schedule_location" value="${schedule.schedule_joinname}" style="width: 440px;">
									<input class="btn btn-primary" type="button" id="joinGame" value="참가">
								</div>
							</div>
						</div>
						<div class="row col-*-10 form-group">
							<textarea class="form-control" rows="10" name="schedule_content">${schedule.schedule_content}</textarea>
						</div>
						<div class="row col-*-10 form-group" id="buttonLine">
							<input class="btn btn-info" type="button" id="modify" value="수정">
							<input class="btn btn-warning" type="button" id="delete" value="삭제">
						</div>
					</form>
					
					<!-- 댓글기능 -->
					<div class="row col-*-10 form-inline">
						<div class="form-group">
							<label class="control-label">작성자아이디</label>
							<input class="form-control" type="text" value="댓글입니다." style="width: 300px;">
							<label class="control-label">YYYY-MM-DD</label>
							<div class="form-group">
								<input class="btn btn-info" type="button" value="수정">
								<input class="btn btn-warning" type="button" value="삭제">
							</div>
						</div>
					</div>
					
					<form class="row col-*-10 form-inline" action="" method="post">
						<div class="form-group">
							<label class="control-label">작성자아이디</label>
							<textarea class="form-control" cols="50%" placeholder="내용을 입력하세요."></textarea>
							<input class="btn btn-success" type="button" value="등록">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>

	<script>
		$(function() {
			$("#delete").click(function() {

				var form = document.createElement("form");
				form.setAttribute("method", "post");
				form.setAttribute("action", "/schedule/remove");

				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "schedule_num");
				hiddenField.setAttribute("value", "${schedule.schedule_num}");

				form.appendChild(hiddenField);
				document.body.appendChild(form);
				form.submit();
			});

		});
	</script>
</body>
</html>