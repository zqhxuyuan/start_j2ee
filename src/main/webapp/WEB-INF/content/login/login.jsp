<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>SSH</title>
	</head>
	<body>
		<br />
		<br />
		<s:form action="login!login" theme="simple">
			<table width="30%" align="center" border="0" cellpadding="5" cellspacing="0">
				<tr>
					<td width="10%" align="center">登录名：</td>
					<td width="20%" align="left">
						<s:textfield name="username" label="登录名" value="Lily"/>
					</td>
				</tr>
				<tr>
					<td align="center">密&nbsp;&nbsp;码：</td>
					<td align="left">
						<s:password name="password" size="22" label="密码"/> (root)
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value="登 录" />
					</td>
				</tr>
			</table>
			<div align="center">
				<font size="5" color="red">
					<s:actionerror/>
				</font>
			</div>
		</s:form>
	</body>
</html>
