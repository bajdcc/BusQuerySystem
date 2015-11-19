<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.bean.BusLineBean"%>
<c:if test="${empty line}">
	<c:redirect url="qline.jsp" />
</c:if>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>线路查询结果</title>
<meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<fieldset>
		<legend>线路查询：${line.name}</legend>
		<p>
			<strong>线路：</strong><font color="#ff0000">${line.name}</font>
		</p>
		<p>
			<strong>票价：</strong><font color="#ff0000">${line.price}</font>元
		</p>
		<p>
			<strong>时间：</strong>${line.start}--${line.end}
		</p>
	</fieldset>
	<hr>
	<table class="table" style="height: 300px;">
		<tbody>
			<tr>
				<c:forEach var="item" varStatus="status" begin="1"
					end="${line.route.size()}">
					<td><b>${status.index}</b></td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach var="l" items="${line.route}" varStatus="i">
					<c:url value="qspot.do" var="spot_url">
						<c:param name="spot" value="${l}" />
					</c:url>
					<td><a href="${spot_url}"> <%=String.join("<br>", pageContext.getAttribute("l")
						.toString().split(""))%>
					</a></td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
</body>
</html>
