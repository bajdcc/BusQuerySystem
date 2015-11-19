<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				if (parent) {
					parent.showTip(60)("<h4>欢迎光临！</h4>",
							"<a href='##'><h3>【在线公交查询系统】</h3></a>", "&nbsp;",
							"<h5 align='right'>———— 22121912 陈晨</h5>");
				}
			});
</script>
</head>
<body>
	<p>您好！</p>
	<p>本系统所用的数据均取自互联网，数据可能会因过时而无效。</p>
	<p>如有问题，请在留言板回复。</p>
	<p></p>
	<p>作者：22121912</p>
	<p>邮箱：bajdcc@outlook.com</p>
</body>
</html>