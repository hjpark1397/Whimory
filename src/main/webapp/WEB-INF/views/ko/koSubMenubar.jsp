<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" 
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" 
	rel="stylesheet" crossorigin="anonymous">
<style type="text/css">
.submenu {
	width: 200px;
	position: absolute;
	top: 250px;
}

.submenu table tr td a {
	text-decoration: none;
	width: 150px;
	height: 30px;
	display: block;
	color: black;
	margin: 0;
	padding-top: 5px;
	text-align: center;
	font-size: 13pt;
}

/* .submenu table tr td {
	text-align: center;
}



.submenu table tr td a:hover {
	text-decoration: none;
	width: 100px;
	height: 30px;
	display: block;
	margin: 0;
	padding-top: 5px;
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
	text-shadow: 0.5px 0.5px 1px white;
	background-color: pink;
	color: white;
} */

</style>
</head>
<body>

<div class="submenu">

<table class="table table-hover" style="width:150px;" align="center">
	<tr style="border-bottom: 1px solid Gainsboro;"><td>
		<font size="5" align="center">Korea Origin</font>
	</td></tr>
	<tr><td>
		<c:url var="klist" value="klist.do" />
		<a href="${ klist }">전체보기</a>
	</td></tr>
	<tr><td>
		<c:url var="history" value="kcate.do">
			<c:param name="cate" value="history" />
		</c:url>
		<a href="${ history }">역사</a>
	</td></tr>
	<tr><td>
		<c:url var="culture" value="kcate.do">
			<c:param name="cate" value="culture" />
		</c:url>
		<a href="${ culture }">문화</a>
	</td></tr>
	<tr><td>
		<c:url var="food" value="kcate.do">
			<c:param name="cate" value="food" />
		</c:url>
		<a href="${ food }">음식</a>
	</td></tr>
	<tr><td>
		<c:url var="culheri" value="kcate.do">
			<c:param name="cate" value="culheri" />
		</c:url>
		<a href="${ culheri }">문화재</a>
	</td></tr>
</table>

</div>

</body>
</html>