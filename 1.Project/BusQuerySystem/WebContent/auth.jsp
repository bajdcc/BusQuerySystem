<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>认证页面</title>
<style type="text/css">
table {
	padding: 5px;
	border: 5px solid silver;
	border-spacing: 5px 10px;
}

.error {
	color: red;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function reload_verify_img() {
		var img = document.getElementById("verify");
		img.src = "verify.open?t=" + Math.random();
	}
	$.extend({
		getUrlVars : function() {
			var vars = [], hash;
			var hashes = window.location.href.slice(
					window.location.href.indexOf('?') + 1).split('&');
			for (var i = 0; i < hashes.length; i++) {
				hash = hashes[i].split('=');
				vars.push(hash[0]);
				vars[hash[0]] = hash[1];
			}
			return vars;
		},
		getUrlVar : function(name) {
			return $.getUrlVars()[name];
		}
	});
	$(document).ready(
			function() {
				if (!$.getUrlVar("noerr") && parent) {
					parent.showTip(5)("〖错误〗 - " + new Date().toLocaleString(),
							"您当前没有访问权限，请先登录！");
				}
				if (parent) {
					parent.showTip(4)("〖警告〗 - " + new Date().toLocaleString(),
							$(".error").html());
				}
			});
</script>
</head>
<body>
	<span class="error"><c:out value="${requestScope.message}">您无权访问该页面。请以合适的身份登录后查看。</c:out></span>
	<hr />

	<form action="login.open" method="post">
		<table cellspacing="10">
			<tr align="center">
				<td colspan="2">登录界面</td>
			</tr>
			<tr>
				<td>账号</td>
				<td><input type="text" name="user" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td align="center">验证码：</td>
				<td><img id="verify" src="verify.open"
					onclick="reload_verify_img()" />
					<hr /> <input name="verify_code" type="text" width="33"
					title="验证码不区分大小写" size="8" maxlength="4"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="登录 " /> <input
					name="reset" type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>