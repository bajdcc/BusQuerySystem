<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<title>查询方式二：站点查询</title>
<meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="../js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="../css/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#spot").autocomplete({
			source : "qspot.do",
			minLength : 1
		});
	});
</script>
</head>
<body>
	<form action="qspot.do" method="post" name="form1">
		<h3>查询方式二：站点查询</h3>
		<h4>在下面的框中输入你要查询的站点，该功能将显示该车次经过的所有线路。</h4>
		<p>
			请选择站点：<input type="text" name="spot" id="spot" placeholder="请输入站点" />
			<input type="submit" value="查  找" />
		</p>
	</form>
</body>
</html>
