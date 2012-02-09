<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>ExtJSLogin</title>
<link href="../js/extjs-3.3.1-min/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/extjs-3.3.1-min/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../js/extjs-3.3.1-min/ext-all.js"></script>
<script type="text/javascript">
Ext.onReady(function(){
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = "side";
	
	//Login Form
	var simple = new Ext.FormPanel({
		labelWidth:40,
		baseCls:"x-plain",
		defaultType:"textfield",
		defaults:{width:180},
		items:[{
			fieldLabel:"帐号",
			name:"user.username",  //struts2,在Action中通过user.getUsername可以获取到输入域的值
			allowBlank:false,
			blankText:"帐号不能为空"
		},{
			inputType:"password",
			fieldLabel:"密码",
			name:"user.password",
			allowBlank:false,
			blankText:"密码不能为空"
		}],
		buttons:[{
			text:"提交",
			type:"submit",
			handler:function(){
				if(simple.form.isValid()){
					Ext.MessageBox.show({
						title:"请稍等",
						msg:"正在加载.....",
						progressText:"",
						width:300,
						progress:true,
						closable:false,
						animEl:"loding"
					});
					var f = function(v) {
						return function(){
							var i = v / 11;
							Ext.MessageBox.updateProgress(i, '');
						}
					}
					for(var i = 1; i < 13; i++) {
						setTimeout(f(i), i * 150);
					}
					
					//提交到服务器操作-------------
					//提交方式是??,struts2的result type="json"是什么意思??
					simple.form.doAction("submit",{
						url:"Login.action",
						method:"post",
						params:"",			//params没有传递参数,参数的传递交给了struts2
						success:function(form, action){
							//document.location='user/index.jsp';
							Ext.Msg.alert("登录成功！",action.result.message);
						},
						failure:function(form, action){
							Ext.Msg.alert('登陆失败', action.result.message);
						}
					});
				}
			}
		},{
			text:"重置",
			handler:function(){
				simple.form.reset();
			}
		}]
    });
	
	//定义窗体
	var _window = new Ext.Window({
		title:"登录窗口",
		layout:"fit",
		width:280,
		height:150,
		plain:true,
		bodyStyle:"padding:10px;",
		maximizable:false,
		closeAction:"close",
		closable:false,
		collapsible:true,
		plain:true,
		buttonAlign:"center",
		items:simple
	});
   	_window.show();
});
</script>
</head>
<body>

</body>
</html>