<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext Tree ComboBox Demo</title>
<link href="${ctx}/js/extjs-3.3.1-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/extjs-3.3.1-min/ext-all.js"></script>

<SCRIPT type="text/javascript">
Ext.onReady(function () {
	Ext.QuickTips.init();
	var Artform = new Ext.form.FormPanel({
		labelAlign: 'right',
		labelWidth: 150,
		width: 600,
		frame: true,
		items: [{
			layout: 'column',
			items: [{
				width:580,
				xtype:'fieldset',
				title: '输入标题',
				autoHeight:true,
				defaults: {width: 300},
				defaultType: 'textfield',
				items: [{
					fieldLabel: '标题',
					name: 'title',
					id:'title',
					allowBlank:false,
					blankText:'标题不能为空'
				},{
					xtype:"combo",			//下拉框
					fieldLabel: '选择',
					name: 'combo',
					id:'combotree',
					store: new Ext.data.SimpleStore({fields:[],data:[[]]}),
					editable:false,			//是否可编辑的表格
					selectClass:'',			//适用于所有样式
					mode: 'local',   		//本地数据
					triggerAction:'all', 	//是否自动匹配
					autoHeight: true,
					tpl: "<tpl for='.'><div style='height:200px'><div id='tree'></div></div></tpl>",   //模板 循环
					emptyText:'请选择'
				}]
			}]
		},{
			layout: 'form',
			labelAlign: 'top',
			items: [{
				xtype: 'htmleditor',		//HTML编辑器
				fieldLabel: '请输入文章内容',
				id: 'context',
				height:400,
				allowBlank:false,
				blankText:'内容不能为空',
				anchor: '98%'
			}]
		}] ,
		buttons: [
			{text: '保存',handler:add},
			{text: '取消'}
		] 
	});
	
	var treedata = new Ext.tree.TreeLoader({
		url:'treedemo.action'
	});
	
	var tree = new Ext.tree.TreePanel({
		loader:treedata,
		border:false, 
		root:new Ext.tree.AsyncTreeNode({
			text:'目录结构',
			id:'1'
		})
	});

	//点击树节点,不包括根节点.显示节点的值.
	tree.on('click',function(node){   
		Artform.findById('combotree').value=node.id;			//设置combo的键值
		Artform.findById('combotree').setRawValue(node.text);   //给combo设置显示的值
		Artform.findById('combotree').collapse();   			//隐藏下拉列表中，如果它展开，这个属性将会完成数据的加载	
	});   

	Artform.findById('combotree').on('expand',function(){
		tree.render('tree');									//ComboBox的tpl里的<div id='tree'>这个ID可以改成别的, 但必须要在'expand'事件里, 将树显示在这个div上
	});
		
	function add(){
		if(Artform.form.isValid()){
			//btn.disabled=true;//确认按钮有效默认为false
			Ext.MessageBox.show({
				msg: '正在请求数据, 请稍侯',
				progressText: '正在请求数据',
				width:300,
				wait:true,
				waitConfig: {interval:200}
			}); 
			Ext.Ajax.request({
				url:'treeSaveOrupdate.action',
				params:{
					title:Ext.getCmp('title').getValue(),
					context:Ext.getCmp('context').getValue(),
					type:Artform.findById('combotree').value
				},
				failure:function(){
					Ext.MessageBox.alert('友情提示',"异步通讯失败，请与管理员联系！");
				},
				success:function(request){
					Ext.MessageBox.hide();
					Ext.MessageBox.alert("友情提示","信息保存成功");
				}
			});
		 }else{
			Ext.MessageBox.alert("信息","请填写完整");
		 }
	}

	Artform.render("form");
});
</SCRIPT>
 
<STYLE type="text/css">
</STYLE>
</head>
<body >
  	<div>ext 下拉树: http://hi.baidu.com/mniz/blog/item/04f055f8c4f26608d8f9fd1f.html/cmtid/c88212af7ee053c77cd92a9a</div>
  	<div id="form"></div>
</body>
</html>