var isDirty = false, isPosting = false, shirtId; 
$(function () { shirtId = $(".active_shirt").attr("id"); 
$(".player").disableSelection(); $("#player_list").disableSelection();
$("#field").disableSelection(); $("#playername").keyup(function (e) { e.keyCode == 13 && $("#addplayer").click() });
$(".shirt").click(function () { $(".dropped_shirt").attr("src", "http://www.footballuser.com/assets/images/shirts/" + 
		$(this).attr("id")); 
shirtId = $(this).attr("id"); 
$(".shirt").removeClass("active_shirt"); 
$(this).addClass("active_shirt") }); 

$(".player").draggable({ revert: "invalid", cursor: "move", helper: function (event) { return $('<span class="dragged_name">' + $(this).text() + "</span>") } }); 
$("#player_list").droppable({ tolerance: "fit", drop: function (ev, ui) { 
	if (ui.draggable.attr("class") != "player ui-draggable") { $("#player_table tr:last").after('<tr><td class="player_row"><div class="player">' 
			+ ui.draggable.text() + '</div></td><td align="right" class="player_row"></td></tr>'); 
	$(".player").disableSelection(); 
	$("#player_table tr:last").find(".player").draggable({ revert: "invalid", cursor: "move", helper: function (event) { return $('<span class="dragged_name">' 
			+ ui.draggable.text() + "</span>") } });
	setTimeout(function () { ui.draggable.remove() }, 1) } } });




/***
 * 
 * 받아온 리스트에 대한 드래그 이벤트
 * 해당객체가 경기장에 등록 될때 리스트에 등록된 각각 아이디가 클래스로 등록된다.
 */
$("#field").droppable({ tolerance: "fit", drop: function (ev, ui) { 
	if (!ui.draggable.find("div").length) { var player = $(document.createElement("div")).addClass("dropped_player").addClass(ui.draggable.text()).css({ left: ui.position.left, top: ui.position.top });
	player.draggable({ revert: "invalid" }); 
	player.css("position", "absolute"); 
	player.prepend('<img class="dropped_shirt" src="http://www.footballuser.com/assets/images/shirts/' + shirtId + '" />').append('<div class="dropped_name" id='+ui.draggable.text()+'><a id='+ui.draggable.text()+'playerDetail style="color: white;">' + ui.draggable.text() + "</a></div>"); 
	$("#field").append(player); 

setTimeout(function () { ui.draggable.parents("tr").remove() }, 1) } } });

$(function () { $("select#Country").change(function () { var country = $("#Country > option:selected").attr("value");
if (country != "") $.ajax({ type: "GET", contentType: "application/json; charset=utf-8", url: "/teams/" + country.replace(/[.]/g, "_"), data: "{}", dataType: "json", beforeSend: function (x) { $("#ajaxloader").show();
$("#Team").html("").attr("disabled", true) }, success: function (data) { if (data.length > 0) { var options = "<option value='0'></option>"; 
for (t in data) { var team = data[t]; options += "<option shirt='" + team.Shirt + "' value='" + team.Value + "'>" + team.Text + "</option>" } $("#Team").removeAttr("disabled").html(options) } 
else $("#Team").html("").attr("disabled",
		true); 
$("#ajaxloader").hide();$("#Team").trigger("chosen:updated")}}); 
else $("#Team").html("") }); 
$("select#Team").change(function () { 
	$("#ajaxloader2").show(); 
	var team = $("#Team > option:selected").attr("value"); 
	$(".team.shirt").remove(); 
	if (team != "") { var shirt = $("#Team > option:selected").attr("shirt"); 
	if (shirt != "0") { shirtId = team + ".png"; $(".dropped_shirt").attr("src", "http://www.footballuser.com/assets/images/shirts/" + shirtId); 
	if (shirt == "2") { $("#shirts").prepend('<img height="50" width="50" id="' + team + '_2.png" class="team shirt" src="http://www.footballuser.com/assets/images/ajax-loader.gif" alt="" />'); 
	$(".team.shirt").attr("src", "http://www.footballuser.com/assets/images/shirts/" + team + "_2.png") } 
	$(".shirt").removeClass("active_shirt");
	$("#shirts").prepend('<img height="50" width="50" id="' + team + '.png" class="team shirt active_shirt" src="http://www.footballuser.com/assets/images/ajax-loader.gif" alt="" />'); 
	$(".team.shirt.active_shirt").attr("src", "http://www.footballuser.com/assets/images/shirts/" + team + ".png"); 
	$(".team.shirt").click(function () { $(".dropped_shirt").attr("src", "http://www.footballuser.com/assets/images/shirts/" + $(this).attr("id")); 
	shirtId = $(this).attr("id");
	$(this).addClass("active_shirt") }) } } 
	$("#ajaxloader2").hide() }) }) }) 
	
	
	
	