<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加留言</title>
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
		var title = document.form1.txtName;
		var name = document.form1.txtName;
		var content = document.form1.txtContents;
		if (title.value == "") {
			alert("留言标题不能为空！");
			return false;
		}
		if (name.value == "") {
			alert("留言人姓名不能为空！");
			return false;
		}
		if (content.value == "") {
			alert("留言内容不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form name="form1" method="post" action="add_msg.do">
		<table width="50%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="border">
			<tr>
				<td colspan="2" align="center" valign="middle" bgcolor="#FF9999"
					class="td_right"><font size="+3"><strong>添加留言</strong></font></td>
			</tr>
			<tr>
				<td width="22%" height="42" align="right" class="td_bottom">留言标题：</td>
				<td width="78%" class="td_right"><label> <input
						name="txtTitle" type="text" id="textarea" value="" size="22">
				</label></td>
			</tr>
			<tr>
				<td height="120" align="right" class="td_bottom">留言内容：</td>
				<td class="td_right"><label> <textarea
							name="txtContents" id="textarea3" cols="35" rows="6"></textarea>
				</label></td>
			</tr>
			<tr>
				<td height="42">&nbsp;</td>
				<td><label> <input type="submit" name="submit"
						id="submit" value="提交" onClick="return checkValidate()">
				</label>&nbsp;&nbsp; <label> <input type="reset" name="reset"
						id="reset" value="重置">
				</label></td>
			</tr>
		</table>
	</form>
</body>
</body>
</html>