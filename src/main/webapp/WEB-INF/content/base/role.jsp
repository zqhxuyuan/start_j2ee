<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>RoleAction</title>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<h1>角色管理</h1>
		<div>
			<a href="${ctx}/base/role!redirectUser.action">查看用户(重定向)</a>&nbsp;&nbsp;
			<a href="${ctx}/base/user.action">查看用户(直接访问)</a>&nbsp;&nbsp;
			<a href="${ctx}/base/role!input.action">新增</a><br/>
		</div>
		<div>
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
				<tr align="center">
					<th>序号</th>
					<th>角色</th>
					<th>操作</th>
				</tr>
				<s:iterator value="list">
					<tr align="center" bgcolor="#FFFFFF">
						<td>${id}</td>
						<td>${name}</td>
						<td>
							<a href="role!view.action?id=${id}">详细</a>
							<a href="role!input.action?id=${id}">修改</a>
							<a href="role!delete.action?id=${id}">删除</a>
						</td>
					</tr>
				</s:iterator>
			</table>
		</div>
		<div>
			<h3><a href="${ctx}/welcome.action">返回主页</a></h3>
		</div>
	</body>
</html>