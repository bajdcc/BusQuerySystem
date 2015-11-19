<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bajdcc.dao.UserDao"%>
<%@ page import="com.bajdcc.model.UserModel"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>用户列表</title>
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
				<td>用户名</td>
				<td>等级</td>
			</tr>
			<%
				UserDao dao = new UserDao();
				pageContext.setAttribute("list", dao.getUserList());
				dao.close();
			%>
			<c:forEach var="l" items="${list}" varStatus="i">
				<tr>
					<td>${i.index+1}</td>
					<td>${l.name}</td>
					<td>${l.getLevelString()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
