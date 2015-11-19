<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.bean.BusP2PBean"%>
<c:if test="${empty p2p}">
	<c:redirect url="qp2p.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>站站查询结果</title>
<meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<fieldset>
		<legend>站站查询</legend>
		<p>
			<strong>起点：</strong><font color="#ff0000">${p2p.begin}</font>
		</p>
		<p>
			<strong>终点：</strong><font color="#ff0000">${p2p.end}</font>
		</p>
		<p>
			<strong>直达：</strong>
			<c:choose>
				<c:when test="${empty p2p.direct}">
					<font color="#ff0000">抱歉，没有直达车</font>
				</c:when>
				<c:when test="${p2p.direct.isEmpty()}">
					<font color="#ff0000">起点和终点相同</font>
				</c:when>
				<c:otherwise>
					<c:forEach var="ll" items="${p2p.direct}">
						<c:url value="qline.do" var="line_url">
							<c:param name="line" value="${ll}" />
						</c:url>
						<a href="${line_url}">${ll} </a>&nbsp;
						</c:forEach>
				</c:otherwise>
			</c:choose>
		</p>
		<p>
			<strong><font color="#ff0000">以下为其他方案</font></strong>
		</p>
	</fieldset>
	<hr>
	<table class="table">
		<thead>
			<tr>
				<td><b>编号</b></td>
				<td><b>上一站</b></td>
				<td><b>线路</b></td>
				<td><b>下一站</b></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${p2p.path}" varStatus="i">
				<tr>
					<c:url value="qspot.do" var="spot1_url">
						<c:param name="spot" value="${l.begin}" />
					</c:url>
					<c:url value="qspot.do" var="spot2_url">
						<c:param name="spot" value="${l.end}" />
					</c:url>
					<td><b>${i.index+1}</b></td>
					<td><a href="${spot1_url}"> ${l.begin}</a></td>
					<td><c:forEach var="ll" items="${l.line}">
							<c:url value="qline.do" var="line_url">
								<c:param name="line" value="${ll}" />
							</c:url>
							<a href="${line_url}"> ${ll} </a>&nbsp;
						</c:forEach></td>
					<td><a href="${spot2_url}"> ${l.end} </a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
