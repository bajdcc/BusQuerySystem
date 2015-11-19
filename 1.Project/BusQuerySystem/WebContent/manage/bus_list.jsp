<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bajdcc.dao.BusDao"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>公交线路列表</title>
<meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<body>
	<table class="table" style="height: 300px;">
		<tbody>
			<tr>
				<td>编号</td>
				<td>线路</td>
				<td>起点和终点</td>
				<td>开始时间</td>
				<td>结束时间</td>
				<td>票价</td>
				<td>更新时间</td>
				<td>操作</td>
			</tr>
			<%
				BusDao dao = new BusDao();
				pageContext.setAttribute("list", dao.getBusList());
				dao.close();
			%>
			<c:forEach var="l" items="${list}" varStatus="i">
				<tr>
					<td>${i.index+1}</td>
					<c:url value="../query/qline.do" var="line_url">
						<c:param name="line" value="${l.name}" />
					</c:url>
					<c:url value="../manage/mupdate.do" var="edit_url">
						<c:param name="line" value="${l.name}" />
					</c:url>
					<c:url value="../manage/mdelete.do" var="delete_url">
						<c:param name="line" value="${l.name}" />
					</c:url>
					<td><a href="${line_url}">${l.name}</a></td>
					<td><a href="${line_url}">${l.route}</a></td>
					<td><label>${l.start}</label></td>
					<td><label>${l.end}</label></td>
					<td><label>${l.price}元</label></td>
					<td><label>${l.time}</label></td>
					<td><a href="${edit_url}">编辑</a> &nbsp; <a
						href="${delete_url}">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
