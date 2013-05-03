<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Demo</title>
</head>
<body>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				你好,欢迎进入本系统: ${user.username}&nbsp;&nbsp;&nbsp; <a id="logout" href="${ctx}/login/login!logout.action">登出</a>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top">
				<div>
					<a target="main" href="${ctx}/struts2index.action">Struts2</a>
					<a target="main" href="${ctx}/lucene/lucene-form.jsp">Lucene</a>
				</div>
				<div>
					<a target="main" href="${ctx}/base/user.action">User</a>
					<a target="main" href="${ctx}/base/role.action">Role</a>
					<a target="main" href="${ctx}/base/simple-role.action">Simple</a>
					<a target="main" href="${ctx}/base/beautiful.action">Beautiful</a>
				</div>
				<div>
					<a target="main" href="${ctx}/extjs3.3.1">Example</a>
					<a target="main" href="${ctx}/extjs3">Tree</a>
					<a target="main" href="${ctx}/extjs2/Level.jsp">Grid</a>
					<a target="main" href="${ctx}/extjs3/login.jsp">Login</a>
				</div>
				
				<div>
					<a target="main" href="${ctx}/member/list.html">Member</a>
					<a target="main" href="${ctx}/reservation/list.html">Reservation</a>
					<a target="main" href="${ctx}/periodicReservationForm.html">periodic</a>
				</div>
				<div>
					<a target="main" href="${ctx}/flows/welcome">Welcome</a>
					<a target="main" href="${ctx}/flows/bookSearch">bookSearch</a>
					<a target="main" href="${ctx}/flows/borrowBook">borrowBook</a>
				</div>
				<div>
					<a target="main" href="${ctx}/messageList.html">Security</a>
				</div>

			</td>
			<td width="80%" valign="top">
				<iframe name="main" width="100%" onload="height=500;" frameborder="0" scrolling="auto"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>