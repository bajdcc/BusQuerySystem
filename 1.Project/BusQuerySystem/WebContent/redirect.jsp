<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>临时跳转页面</title>
</head>
<body onload="refresh();">
	<p>
		<b><span id="msg"><c:out value="${sessionScope.info}"></c:out></span></b>
		<%
			session.removeAttribute("info");
		%>
	</p>
	<p>页面将在一秒后刷新...</p>
	<script type="text/javascript">
		function refresh() {
			setTimeout(function() {
				if (window.top != window.self) {
					parent.location.reload();
				} else {
					window.location.href = "<%=request.getContextPath()%>";
				}
			}, 1000);
		}
	</script>
</body>
</html>