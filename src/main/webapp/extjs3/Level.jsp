<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext Grid JSON SSH</title>
<link href="../js/extjs-3.3.1-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../js/extjs-3.3.1-min/ext-all.js"></script>
<SCRIPT type="text/javascript" src="Level.js"></SCRIPT>
<SCRIPT type="text/javascript">
Ext.BLANK_IMAGE_URL = resource/ext2.0/resources/images/default/s.gif';
</SCRIPT>
 
<STYLE type="text/css">
.ss {
    text-align: left;;
}
.icon-grid {
    background-image: url(grid.png) !important;
}
.add {
    background-image: url(new.png) !important;
}
.edit {
    background-image: url(edit.png) !important;
}
.remove {
    background-image: url(del.png) !important;
}
</STYLE>
</head>
<body class="x-vista">
 <h4><a target="main" href="${ctx}/LevelAjaxJsonData.action">[JSON DATA FOR TEST]</a></h4>
<div id="topic-grid"></div>
<div id="topic-win" class="x-hidden">
<div class="x-window-header">Hello Dialog</div>
<div id="topic-tabs"></div>
</div>
</body>
</html>