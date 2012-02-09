<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户添加/修改</title>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<s:form action="user!save.action" method="post" theme="simple">
			<s:hidden name="id" />
			<div>
				<table width="60%" border="0" cellpadding="3" cellspacing="1">
					<tr>
						<td width="15%">用户名</td>
						<td><s:textfield name="username" /></td>
					</tr>
					<tr>
						<td class="font_d3">角色</td>
						<td>
							<!-- 这样子无法插入数据 
							<s:select name="role_id" list="allRoles" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" />
							-->
							<!-- 如果没有选择值,报错ognl.OgnlException: target is null for setProperty(null, "id", [Ljava.lang.String;@107dfbd),可以在这里做下非空验证 -->
							<s:select name="role.id" list="allRoles" listKey="id" listValue="name" headerKey="" headerValue="--请选择--" />
						</td>
						<td>
					</tr>
					<tr>
						<td class="font_d3">角色</td>
						<td>
							<s:checkboxlist name="roles" list="allRoles" listKey="id" listValue="name"></s:checkboxlist>
						</td>
						<td>
					</tr>
				</table>
			</div>
			<div>
				<h3><s:submit value="保存" /><a href="user.action">返回</a></h3>
			</div>
		</s:form>
	</body>
</html>