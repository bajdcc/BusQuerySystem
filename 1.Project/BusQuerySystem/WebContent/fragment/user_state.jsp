<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.model.UserModel"%>
<%
	if (session.getAttribute("user") == null) {
%>
<a href="register.jsp" target="content">注册</a>
|
<a href="auth.jsp?noerr=true" target="content">登录</a>
<%
	} else {
%>
<%
	UserModel user = ((UserModel) session.getAttribute("user"));
%>
欢迎您，<%=user.getLevelString()%>
-
<%=user.getName()%>
&emsp;&emsp;
<a href="logout.do" target="content">退出登录</a>
<%
	}
%>