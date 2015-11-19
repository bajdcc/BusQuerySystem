<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bajdcc.model.BusLineModel"%>
<c:if test="${empty line}">
	<c:redirect url="bus_list.jsp" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta lang="zh-CN" />
<title>编辑线路</title>
<meta name="viewport" content="width=device-width" />
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
<script language="javascript">
	function checkValidate() {
		if (document.form1.name.value == "") {
			alert("线路名称不能为空！");
			return false;
		}
		if (document.form1.route.value == "") {
			alert("路线不能为空！");
			return false;
		}
		if (document.form1.start_time.value == "") {
			alert("起始时间不能为空！");
			return false;
		}
		if (document.form1.end_time.value == "") {
			alert("结束时间不能为空！");
			return false;
		}
		if (document.form1.price.value == "") {
			alert("票价不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form name="form1" method="post" action="mupdate.do">
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border">
			<tr>
				<td colspan="2" align="center" valign="middle" bgcolor="#FF9999"
					class="td_right"><font size="+3"><strong>编辑线路</strong></font></td>
			</tr>
			<tr>
				<td width="22%" height="42" align="right" class="td_bottom">线路名称：</td>
				<td width="78%" class="td_right"><label> <input
						type="text" name="name" id="name" value="${line.name}" size="22" />
				</label></td>
			</tr>
			<tr>
				<td height="120" align="right" class="td_bottom">路线：</td>
				<td class="td_right"><p>（站台间用“->”分隔，如“站点A->站点B”）</p> <label>
						<textarea name="route" id="route" cols="65" rows="12">${line.route}</textarea>
				</label></td>
			</tr>
			<tr>
				<td height="120" align="right" class="td_bottom">起始时间：</td>
				<td class="td_right"><label> <input type="text"
						name="start_time" id="start_time" value="${line.start}" />（如6:00）
				</label></td>
			</tr>
			<tr>
				<td height="120" align="right" class="td_bottom">结束时间：</td>
				<td class="td_right"><label> <input type="text"
						name="end_time" id="end_time" value="${line.end}" />（如18:00）
				</label></td>
			</tr>
			<tr>
				<td height="120" align="right" class="td_bottom">票价：</td>
				<td class="td_right"><label> <input type="text"
						name="price" id="price" value="${line.price}" />（单位为元）
				</label></td>
			</tr>
			<tr>
				<td height="42">&nbsp;</td>
				<td><label> <input type="submit" name="submit"
						id="submit" value="提交" onclick="return checkValidate()" />
				</label>&nbsp;&nbsp; <label> <input type="reset" name="reset"
						id="reset" value="重置" />
				</label></td>
			</tr>
		</table>
	</form>
</body>
</html>
