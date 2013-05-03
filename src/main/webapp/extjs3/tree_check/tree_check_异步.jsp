<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext Tree JSON SSH</title>
<link href="${ctx}/js/extjs-3.3.1-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/ext-all.js"></script>

<script type="text/javascript" src="${ctx}/extjs3/ux/TreeCheckNodeUI.js"></script>
<SCRIPT type="text/javascript" src="Ext.hoojo.tree.CheckBoxCheckNodeTree.js"></SCRIPT>

<SCRIPT type="text/javascript">

//异步树
Ext.hoojo.tree.CheckBoxCheckNodeTree.TREE_DATA_URL = "../ext_tree_getNodes.jsp";

Ext.onReady(function () {
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = "side";
	new Ext.hoojo.tree.CheckBoxCheckNodeTree();
});

</SCRIPT>

<STYLE type="text/css">
</STYLE>
</head>
<body >
	<h4><a target="main" href="${ctx}/treedemo.action">[JSON DATA FOR TEST]</a></h4>

	<div id="showTree" style="float: left;border:solid 1px #99BBE8;" class="left-tree"></div>
  	<iframe name="content" frameborder=0 style="float: right; width: 71%; height: 100%;"></iframe>

</body>
</html>