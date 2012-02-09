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

<script type="text/javascript" src="${ctx}/js/ext.ux/ComboBoxCheckTree.js"></script>
<SCRIPT type="text/javascript" src="Ext.hoojo.tree.ComboBoxCheckNodeTree.js"></SCRIPT>

<script type="text/javascript" src="${ctx}/js/ext.ux/ComboBoxTree.js"></script>
<SCRIPT type="text/javascript" src="Ext.hoojo.tree.ComboBoxTree.js"></SCRIPT>
<SCRIPT type="text/javascript">

//下拉选择树ComboBoxCheckTree ComboBoxCheckNodeTree
Ext.hoojo.tree.ComboBoxCheckNodeTree.TREE_DATA_URL = "treedemo.action";
Ext.onReady(function () {
	new Ext.hoojo.tree.ComboBoxCheckNodeTree();
});

//下拉树ComboBoxTree
Ext.hoojo.tree.ComboBoxTree.TREE_DATA_URL = "treedemo.action";
Ext.onReady(function () {
	new Ext.hoojo.tree.ComboBoxTree();
});
</SCRIPT>

<STYLE type="text/css">
</STYLE>
</head>
<body >
  	<div style="position:absolute;top:300px;left:0px;">下拉列表选择节点树</div>
  	<div id="comboBoxCheckTree" style="position:absolute;top:320px;left:0px;width:250px;border:solid 0px #00FF00;" class="left-tree"></div>

  	<div style="position:absolute;top:300px;left:300px;">下拉树</div>
  	<div id="comboBoxTree" style="position:absolute;top:320px;left:300px;width:250px;border:solid 0px #00FF00;" class="left-tree"></div>
</body>
</html>