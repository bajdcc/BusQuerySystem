<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>公交线路查询系统 - 常熟市</title>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.validate.unobtrusive.js"></script>
<script type="text/javascript" src="js/jquery.unobtrusive-ajax.js"></script>
<script type="text/javascript"
	src="js/jquery.validate.unobtrusive-custom-for-bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="js/jquery.easyui-1.4.1.js"></script>
<script type="text/javascript" src="js/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/modernizr-2.6.2.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/Site.css">
<link rel="stylesheet" type="text/css"
	href="css/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="css/themes/color.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-mvc-validation.css">
<link rel="stylesheet" type="text/css"
	href="css/themes/base/jquery-ui.css">
</head>
<body class="easyui-layout">
	<div data-options="region:'north'"
		style="overflow: hidden; height: 76px;">
		<div class="headerWrap">
			<div class="header">
				<span class="hLogo">全国公交线路查询系统&nbsp;</span><span class="cnH-channel">常熟市</span>
				<div class="user-status">
					<%@ include file="fragment/user_state.jsp"%>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'south'" style="height: 40px;">
		<h6 style="text-align: center;">&copy; 2015 在线公交线路查询 - Changshu
			City</h6>
	</div>
	<div data-options="region:'west',split:true" title="导航"
		style="width: 15%;"><%@ include file="fragment/nav.jsp"%></div>
	<div data-options="region:'center'" title="载入中">
		<%@ include file="fragment/content.jsp"%>
	</div>
</body>
</html>
