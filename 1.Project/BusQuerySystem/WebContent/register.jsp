<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty authorized}">
	<c:redirect url="main.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
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
	function checkValidate() {
		var title = document.form1.user;
		var pw1 = document.form1.pw;
		var pw2 = document.form1.pw2;
		var content = document.form1.txtContents;
		if (document.form1.user.value == "") {
			alert("用户名不能为空！");
			return false;
		}
		if (document.form1.pw.value == "") {
			alert("密码不能为空！");
			return false;
		}
		if (document.form1.pw2.value == "") {
			alert("重复密码不能为空！");
			return false;
		}
		if (document.form1.pw.value == "") {
			alert("密码不能为空！");
			return false;
		}
		if (document.form1.pw.value != document.form1.pw2.value) {
			alert("密码不一致！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<span class="error"><c:out value="${requestScope.message}">注册后才可以进行更多操作。</c:out></span>
	<hr />
	<form name="form1" action="register.open" method="post">
		<table cellspacing="10">
			<tr align="center">
				<td colspan="2">注册界面</td>
			</tr>
			<tr>
				<td>账号</td>
				<td><input type="text" name="user" id="user" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="password" id="pw" /></td>
			</tr>
			<tr>
				<td>重复一遍密码</td>
				<td><input type="password" id="pw2" /></td>
			</tr>
			<tr>
				<td align="center">验证码：</td>
				<td><img id="verify" src="verify.open"
					onclick="reload_verify_img()" />
					<hr /> <input name="verify_code" type="text" width="33"
					title="验证码不区分大小写" size="8" maxlength="4"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="登录 "
					onClick="return checkValidate();" /> <input name="reset"
					type="reset" value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>