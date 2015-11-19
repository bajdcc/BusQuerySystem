<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.bean.BusSpotBean"%>
<c:if test="${empty spot}">
	<c:redirect url="qspot.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>站点查询结果</title>
<meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<fieldset>
		<legend>站点查询：${spot.name}</legend>
		<p>
			<strong>站点：</strong><font color="#ff0000">${spot.name}</font>
		</p>
	</fieldset>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<td><b>编号</b></td>
				<td><b>线路</b></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${spot.line}" varStatus="i">
				<tr>
					<c:url value="qline.do" var="line_url">
						<c:param name="line" value="${l}" />
					</c:url>
					<td><b>${i.index+1}</b></td>
					<td><a href="${line_url}"> ${l} </a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
