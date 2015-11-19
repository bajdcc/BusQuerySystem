<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String rd = "main.jsp";
	if (session.getAttribute("login-intend") != null) {
		rd = request.getContextPath() + "/login.open";
		session.removeAttribute("login-intend");
	} else if (session.getAttribute("redirect") != null) {
		rd = String.valueOf(session.getAttribute("redirect"));
		session.removeAttribute("redirect");
	}
	pageContext.setAttribute("rd", rd);
%>
<iframe id="content" name="content" src="${rd}"
	style="width: 99%; height: 98%;" frameborder="no" border="0"
	allowtransparency="true" onload="setTitle()"></iframe>