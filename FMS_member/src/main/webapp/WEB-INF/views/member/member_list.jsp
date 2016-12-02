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
<title>:: Floxi ::</title>
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
<script type="text/javascript" src="/html/js/memberlist.js"></script>
<script type="text/javascript">
$(function(){
    $('.filterable.btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
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
<div class="container">
    <h3 style="color: white;"><i class="fa fa-caret-square-o-down" aria-hidden="true" style="margin-right: 20px;"></i>회원 목록</h3>
    <hr>
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h1 class="panel-title"><i class="fa fa-users" style="margin-right: 10px;"></i>회원 목록</h1>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="fa fa-external-link" ></span>검색</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="번호" disabled></th>
                        <th><input type="text" class="form-control" placeholder="이름" disabled></th>
                        <th><input type="text" class="form-control" placeholder="전화번호" disabled></th>
                        <th><input type="text" class="form-control" placeholder="이메일" disabled></th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberlist}" var="list">
                   <tr>
                        <td>${list.member_num}</td>
                        <td>${list.member_name}</td>
                        <td>${list.member_phone}</td>
                        <td>${list.member_email}</td>
                   </tr>
                    </c:forEach>
              <!--       <tr>
                        <td>1</td>
                        <td>임영묵</td>
                        <td>010-1234-4567</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>최민호</td>
                        <td>010-5757-5757</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>안광호</td>
                        <td>010-1010-1010</td>
                        <td>@twitter</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>강준</td>
                        <td>010-8080-8080</td>
                        <td>@twitter</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>박찬용</td>
                        <td>010-5959-5959</td>
                        <td>@twitter</td>
                    </tr> -->
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<style type="text/css">
.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}
</style>
</html>