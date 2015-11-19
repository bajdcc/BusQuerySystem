<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.model.UserModel"%>
<ul id="nav" class="easyui-tree">
	<li><a href="<%=request.getContextPath()%>/main.jsp"
		target="content">主页</a></li>
	<li><span>查询服务</span>
		<ul>
			<li><a href="query/qline.jsp" target="content">线路查询</a></li>
			<li><a href="query/qspot.jsp" target="content">站点查询</a></li>
			<li><a href="query/qp2p.jsp" target="content">站站查询</a></li>
		</ul></li>
	<%
		if (session.getAttribute("user") != null) {
			UserModel user = (UserModel) session.getAttribute("user");
			if (user.isAdmin()) {
	%>
	<li><span>后台管理</span>
		<ul>
			<li><a href="manage/bus_list.jsp" target="content">查看车次信息</a></li>
			<li><a href="manage/bus_add.jsp" target="content">添加车次信息</a></li>
			<li><a href="manage/bus_list.jsp" target="content">修改车次信息</a></li>
			<li><a href="manage/bus_list.jsp" target="content">删除车次信息</a></li>
		</ul></li>
	<li><span>用户管理</span>
		<ul>
			<li><a href="user/user_list.jsp" target="content">查看所有用户</a></li>
		</ul></li>
	<%
		}
		}
	%>
	<li><span>用户服务</span>
		<ul>
			<li><a href="email.jsp" target="content">发送邮件</a></li>
			<li><a href="view_msg.jsp" target="content">查看留言</a></li>
			<li><a href="manage/add_msg.jsp" target="content">发表留言</a></li>
		</ul></li>
</ul>