<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SSH</title>
</head>
<body>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				你好,欢迎进入本系统: ${user.username}&nbsp;&nbsp;&nbsp;
				<a id="logout" href="${ctx}/login/login!logout.action">登出</a>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top">
				<br />
				<div>
					<h4><a target="main" href="${ctx}/base/user.action">UserAction</a></h4>
				</div>
				<div>
					<h4><a target="main" href="${ctx}/base/role.action">RoleAction</a>
					<a target="main" href="${ctx}/base/simple-role.action">SimpleRoleAction</a></h4>
				</div>
				<div>
					<h4><a target="main" href="${ctx}/base/beautiful.action">Beautiful Code</a></h4>
				</div>
				<div>
					<h4><a target="main" href="${ctx}/extjs3.3.1">Example</a>
					<a target="main" href="${ctx}/extjs3">ExtJS</a></h4>
				</div>

				<div>
					<h4><a target="main" href="${ctx}/memPagerUser.action">pagertaglib内存</a>
					<a target="main" href="${ctx}/dbPagerUser.action">DB1</a>
					<a target="main" href="${ctx}/pagerUser.action">DB2</a></h4>
				</div>
				<div>
					<h4><a target="main" href="${ctx}/bookpage.action">分页</a>
					<a target="main" href="${ctx}/booklist.action">带条件</a>
					<a target="main" href="${ctx}/book_list.action">FreeMarker</a>
					</h4>
				</div>
			</td>
			<td width="80%" valign="top">
				<br />
				<iframe name="main" width="100%" onload="height=500;" frameborder="0" scrolling="auto"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>