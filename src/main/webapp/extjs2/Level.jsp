<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext2.0 Grid CRUD Demo</title>
<link rel="stylesheet" type="text/css" href="resources/css/ext-all.css" />
<script src="adapter/ext/ext-base.js" type="text/javascript"></script>
<script src="ext-core.js" type="text/javascript"></script>
<script src="ext-all.js"  type="text/javascript"></script>
<script src="init.js"  type="text/javascript"></script>
<script src="ext-lang-zh_CN.js"  type="text/javascript"></script>

<!-- 使用extjs2,添加,删除,修改无法起作用.删除的时候能看到删掉.但是删除后又显示全部数据. SSH2EXT里是可以正常的.转移到这里不知道为什么就不行了.难道是Spring版本的问题?
SSH2EXT中使用Spring2.5. 这里使用Spring3. 配置文件?..晕死了!!!
 -->
<!-- 使用extjs3,添加,删除,修改无法起作用 -->
<!--
<link rel="stylesheet" type="text/css" href="resource/ext3.3/resources/css/ext-all.css" />
<script src="resource/ext3.3/adapter/ext/ext-base.js" type="text/javascript"></script>
<script src="resource/ext3.3/ext-all.js"  type="text/javascript"></script>
-->
<SCRIPT type="text/javascript" src="Level.js"></SCRIPT>
<!--
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
-->
</head>
<body class="x-vista">
sth wrong with id.plz lool SSH2EXT project .
<div id="topic-grid"></div>


<div id="topic-win" class="x-hidden">
<div class="x-window-header">Hello Dialog</div>
<div id="topic-tabs"></div>
</div>
</body>
</html>