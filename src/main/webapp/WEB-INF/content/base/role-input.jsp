<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>角色添加/修改</title>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<h1>这是RoleAction的role-input.jsp</h1>
		<s:form action="role!save.action" method="post" theme="simple">
			<s:hidden name="id" />
			<div>
				<table width="60%" border="0" cellpadding="3" cellspacing="1">
					<tr>
						<td width="15%">角色名</td>
						<td><s:textfield name="name" /></td>
					</tr>
				</table>
			</div>
			<div>
				<h3><s:submit value="保存" /><a href="role.action">返回</a></h3>
			</div>
		</s:form>
	</body>
</html>