<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ssh</title>
<script type="text/javascript">
</script>
</head>
<body>
	<h1>用户管理</h1>
	<div>
		<h3><a href="${ctx}/base/user!input.action">新增</a></h3>
	</div>
	<s:form action="user" method="post" theme="simple">
		<table width="70%" border="0" align="center" cellpadding="3" cellspacing="0">
			<tr>
				<td class="font_d3">姓名</td>
				<td>
					<s:textfield name="username" />
				</td>
				<td class="font_d3">角色</td>
				<td>
					<s:select name="role_id" list="allRoles" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" />
				</td>
				<td>
					<input type="submit" value="查询" />
				</td>
			</tr>
		</table>
	</s:form>
	<div>
		<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
			<tr align="center">
				<th>序号</th>
				<th>姓名</th>
				<th>角色</th>
			</tr>
			<s:iterator value="list">
				<tr align="center">
					<td>${id}</td>
					<td>${username}</td>
					<td>${role.name}</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>