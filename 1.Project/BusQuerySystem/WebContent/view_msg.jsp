<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bajdcc.dao.MsgDao"%>
<%@ page import="com.bajdcc.model.MsgModel"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta lang="zh-CN" />
<title>留言板</title>
<style type="text/css">
a {
	text-decoration: none;
}

.border {
	border: 1px dashed #999;
}

.td_bottom {
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-right-style: dashed;
	border-bottom-style: dashed;
	border-right-color: #999;
	border-bottom-color: #999;
}

.td_right {
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #999;
}
</style>
</head>
<body>
	<div>
		<form name="form1" method="post" action="">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="border">
				<tr>
					<td align="center" valign="middle" bgcolor="#FF9999"
						class="td_right"><font size="+3">&nbsp; <strong>留言列表</strong></font></td>
				</tr>

				<%
					MsgDao dao = new MsgDao();
					List<MsgModel> list = dao.getMsgList();
					dao.close();
					if (list.isEmpty()) {
				%>
				<tr>
					<td align="center" height="27"><a href="manage/add_msg.jsp">没有留言！请添加留言。</a></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="right" class="td_right" height="27"><a
						href="manage/add_msg.jsp">添加留言</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<%
					for (MsgModel msg : list) {
				%>
				<tr>
					<td class="td_right"><table width="100%" border="0"
							cellpadding="0" cellspacing="0">
							<tr>
								<td width="33%" height="27" class="td_bottom"><strong>留言用户名：</strong><%=msg.getName()%></td>
								<td width="33%" class="td_bottom"><strong>留言人IP：</strong><%=msg.getIp()%></td>
								<td width="33%" class="td_right"><strong>留言创建时间：</strong><%=msg.getTime()%></td>
							</tr>
							<tr>
								<td height="27" colspan="3" class="td_right"><strong>留言标题：</strong><%=msg.getTitle()%></td>
							</tr>
							<tr>
								<td height="27" colspan="3" class="td_right"><strong>留言内容:
								</strong><%=msg.getContent()%></td>
							</tr>
							<tr>
								<td colspan="3"><br /></td>
							</tr>
						</table></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</form>
	</div>
</body>
</html>