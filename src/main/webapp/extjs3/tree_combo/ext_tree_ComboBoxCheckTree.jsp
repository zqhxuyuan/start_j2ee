<%@ page language="java" contentType="text/html; charset=UTF8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>[3]Ext2.x ComboBoxCheckTree(xiexueze)</title>
<style>
#wrap {
position: absolute;
width: 500px;
height: 200px;
left: 50%;
top: 50%;
margin-left: -250px;
margin-top: -100px;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/extjs-3.3.1-min/resources/css/ext-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/extjs-3.3.1-min/ext-all.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/extjs3/ux/TreeCheckNodeUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/extjs3/ux/ComboBoxCheckTree.js"></script>
<script>  
Ext.onReady(function(){
	var comboBoxCheckTree = new Ext.ux.ComboBoxCheckTree({
		renderTo : 'comboBoxCheckTree',
		width : 300,
		height : 150,
		tree : {
			xtype:'treepanel',
			height:100,
			checkModel: 'cascade',   //cascade selection
			onlyLeafCheckable: false,//all nodes with checkboxes
			animate: true,
			rootVisible: true,
			autoScroll:true,
			loader: new Ext.tree.TreeLoader({
				dataUrl:'treedemo.action',   
				baseAttrs: { 
					uiProvider: Ext.ux.TreeCheckNodeUI 
				} 
			}),
			root : new Ext.tree.AsyncTreeNode({
				id:'0',
				text:'root'
			})
		},
		
		// define which node's value will be submited
		selectValueModel:'leaf'
	});
	
	var tf = new Ext.form.TextField({
	 	renderTo:'textct'
		,id:'tf'
		,width:300
		,selectOnFocus:false
		,listeners:{
			focus:function() {
				this.setValue(comboBoxCheckTree.getValue());
			}
		}
	});
});
</script>
</head>
<body>
<p>3.下拉选择树(下拉树+选择树)ComboBoxCheckTree</p>
<div id="wrap">
	<div id="comboBoxCheckTree"></div>
	<br><br>
	<div id="textct"></div>
</div>
</body>
</html>
