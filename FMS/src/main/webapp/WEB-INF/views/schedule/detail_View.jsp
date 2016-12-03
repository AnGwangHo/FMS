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
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<form id="scheduleModify" method="post">
						<input type="hidden" name="schedule_num"
							value="${schedule.schedule_num}">
						<div>
							<label>제목 : </label> <input type="text" name="schedule_title"
								value="${schedule.schedule_title}">
						</div>
						<div>
							<label>장소 : </label> <input type="text" name="schedule_location"
								value="${schedule.schedule_location}">
						</div>
						<div>
							<label>작성자 : </label> <input type="text" name="schedule_writer"
								value="${schedule.schedule_writer}">| <label>날짜
								: </label> <input type="date" name="schedule_date"
								value="${schedule.schedule_date}">~ <input type="date"
								name="schedule_deadline" value="${schedule.schedule_deadline}">
							<input type="button" id="joinGame" value="참여">
						</div>
						<div>
							<label>경기 참여인원 : </label> <input type="text"
								name="schedule_joinname" id="schedule_joinname" value="${schedule.schedule_joinname }">
						</div>
						<div>
							<textarea rows="10" cols="80" name="schedule_content">
								${schedule.schedule_content }
							</textarea>
						</div>
						<div>
							<input type="button" id="delete" value="삭제">
							<input type="button" id="modify" value="수정">
						</div>
					</form>
					<!-- 여기서부터 아래까지는 등록 후 가능 -->
					<div>
						<label>KOSTA</label> <input type="text" value="댓글입니다."> <label>YYYY-MM-DD</label>
						<input type="button" value="수정"> <input type="button"
							value="삭제">
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