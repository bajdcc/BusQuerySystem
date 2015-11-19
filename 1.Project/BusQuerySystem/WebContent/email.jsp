<%@ page contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>发送电子邮件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
	function checkform(myform) {
		for (i = 0; i < myform.length; i++) {
			if (myform.elements[i].value == "") {
				alert(myform.elements[i].title + "不能为空！");
				myform.elements[i].focus();
				return false;
			}
		}
	}
</script>
<style type="text/css">
body {
	FONT-SIZE: 9pt;
	margin-left: 0px;
	margin-top: 0px;
	SCROLLBAR-FACE-COLOR: #36A2DB;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #fcfcfc;
	COLOR: #000000;
	SCROLLBAR-3DLIGHT-COLOR: #ececec;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR: #ececec;
	SCROLLBAR-DARKSHADOW-COLOR: #999966;
	BACKGROUND-COLOR: #fcfcfc
}

td {
	font-size: 9pt;
	color: #000000;
}

a:hover {
	font-size: 9pt;
	color: #FF6600;
}

a {
	font-size: 9pt;
	text-decoration: none;
	color: #676767;
	noline: expression(this.onfocus = this.blur);
}

img {
	border: 0;
}

.img1 {
	border: 1;
}

.blue {
	font-size: 9pt;
	color: #034683;
}

.bgcolor {
	font-size: 9pt;
	color: #1980DB;
}

.btn_grey {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
	background-color: #eeeeee;
	cursor: hand;
	padding: 1px;
	height: 19px;
	border-top: 1px solid #FFFFFF;
	border-right: 1px solid #666666;
	border-bottom: 1px solid #666666;
	border-left: 1px solid #FFFFFF;
}

.btn_bg {
	border: #436E9B thin 1px;
	width: 56px;
	height: 21px;
	padding: 4px;
	color: #0E384E;
}

input {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
	border: 1px solid #999999;
}

TD.TableTitle1 {
	COLOR: #ffffff;
	BACKGROUND-COLOR: 1789D5
}

.word_white {
	color: #FFFFFF;
}

.word_deepgrey {
	color: #999999;
}

.word_orange {
	color: #FF6600;
}

.word_green {
	color: #82CBC8;
}

.noborder {
	border: none;
}

.word_gray {
	color: #dddddd;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.wenbenkuang {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
	border: 1px solid #999999;
}

.textarea {
	font-family: "宋体";
	font-size: 9pt;
	color: #333333;
	border: 1px solid #999999;
}

.box {
	font: 9pt "宋体";
	background-color: #FFFFFF;
	position: absolute;
	border: 1px solid;
}

.tableBorder {
	border: #999999 1px solid;
}

.tableBorder_dashed {
	border: #D8D8D8 1px dashed;
}

.tableBorder_l {
	border: #D8D8D8 1px solid;
	border-bottom-style: none;
	border-left-style: none;
	border-top-style: none;
}

.tableBorder_lb {
	border: #D8D8D8 1px solid;
	border-left-style: none;
	border-top-style: none;
}

.tableBorder_l_dashed {
	border: #D8D8D8 1px dashed;
	border-bottom-style: none;
	border-left-style: none;
	border-top-style: none;
}

.tableBorder_T_dashed {
	border: #D8D8D8 1px dashed;
	border-bottom-style: none;
	border-left-style: none;
	border-right-style: none;
}

.tableBorder_LTR_dashed {
	border: #D8D8D8 1px dashed;
	border-bottom-style: none;
}

.tableBorder_LRB_dashed {
	border: #D8D8D8 1px solid;
	border-top-style: none;
}

.tableBorder_R {
	border: #D8D8D8 1px solid;
	border-top-style: none;
	border-left-style: none;
	border-bottom-style: none;
}

.tableBorder_RB {
	border: #D8D8D8 1px solid;
	border-top-style: none;
	border-left-style: none;
}

.tableBorder_B_dashed {
	border: #D8D8D8 1px dashed;
	border-top-style: none;
	border-left-style: none;
	border-right-style: none;
}

.hidden_a_line {
	noline: expression(this.onfocus = this.blur);
}

hr {
	border-style: solid;
	color: #CCCCCC;
}
</style>
</head>
<body>
	<form name="form1" method="post" action="mail.do"
		onsubmit="return checkform(form1)" enctype="multipart/form-data">
		<table width="649" height="454" border="0" align="center"
			cellpadding="0" cellspacing="0" background="images/bg.jpg">
			<tr height="79">
				<td width="67">&nbsp;</td>
				<td width="531">&nbsp;</td>
				<td width="51">&nbsp;</td>
			</tr>
			<tr valign="top">
				<td height="247">&nbsp;</td>
				<td valign="top"><table width="96%" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td width="16%" height="27" align="center">收件人：</td>
							<td width="84%" colspan="2" align="left"><input name="to"
								type="text" id="to" title="收件人" size="60" /></td>
						</tr>
						<tr>
							<td height="27" align="center">发件人：</td>
							<td colspan="2" align="left"><input name="from" type="text"
								id="from" title="发件人" size="60" /></td>
						</tr>
						<tr>
							<td height="27" align="center">密&nbsp;&nbsp;码：</td>
							<td colspan="2" align="left"><input name="password"
								type="password" id="password" title="发件人信箱密码" size="60" /></td>
						</tr>
						<tr>
							<td height="27" align="center">主&nbsp;&nbsp;题：</td>
							<td colspan="2" align="left"><input name="subject"
								type="text" id="subject" title="邮件主题" size="60" /></td>
						</tr>
						<tr>
							<td height="93" align="center">内&nbsp;&nbsp;容：</td>
							<td colspan="2" align="left"><textarea name="content"
									cols="59" rows="7" class="wenbenkuang" id="content"
									title="邮件内容"></textarea></td>
						</tr>
						<tr>
							<td height="27" align="center">附&nbsp;&nbsp;件：</td>
							<td colspan="2" align="left"><input type="file" name="file" /></td>
						</tr>
						<tr>
							<td height="30" align="center">&nbsp;</td>
							<td height="40" align="right"><input name="Submit"
								type="submit" class="btn_grey" value="发送" /> &nbsp; <input
								name="Submit2" type="reset" class="btn_grey" value="重置" />
								&nbsp;&nbsp;&nbsp;</td>
							<td align="left">&nbsp;</td>
						</tr>
					</table></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
