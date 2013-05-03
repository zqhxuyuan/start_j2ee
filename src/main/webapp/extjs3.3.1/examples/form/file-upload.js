Ext.onReady(function(){
    Ext.QuickTips.init();

	//函数复用
    var msg = function(title, msg){
        Ext.Msg.show({
            title: title,
            msg: msg,
            minWidth: 200,
            modal: true,
            icon: Ext.Msg.INFO,
            buttons: Ext.Msg.OK
        });
    };

	//1.最简单的文件上传,只要创建一个Ext.ux.form.FileUploadField即可
    var fibasic = new Ext.ux.form.FileUploadField({
        renderTo: 'fi-basic',
        width: 400
    });

	//获取文件路径
    new Ext.Button({
        text: 'Get File Path',
        renderTo: 'fi-basic-btn',
        handler: function(){
            var v = fibasic.getValue();
            msg('Selected File', v && v != '' ? v : 'None');
        }
    });

	//2.只有上传按钮,没有了文件上传前的输入域.
    var fbutton = new Ext.ux.form.FileUploadField({
        renderTo: 'fi-button',
        buttonOnly: true,		//只有上传按钮,没有上传输入域
        listeners: {
        	//当选中文件后,将文件的路径显示在一个div里
            'fileselected': function(fb, v){
                var el = Ext.fly('fi-button-msg');	//获取div的id
                el.update('<b>Selected:</b> '+v);	//v:选中的文件路径信息
                if(!el.isVisible()){				//效果:第一次上传文件,有个slideIn效果
                    el.slideIn('t', {
                        duration: .2,
                        easing: 'easeIn',
                        callback: function(){
                            el.highlight();
                        }
                    });
                }else{
                    el.highlight();					//已经显示有文件了,第二次上传别的文件,直接高亮显示
                }
            }
        }
    });

	//3.上传文件放置在Form里
    var fp = new Ext.FormPanel({
        renderTo: 'fi-form',
        fileUpload: true,	//设置文件上传为true
        width: 500,
        frame: true,
        title: 'File Upload Form',
        autoHeight: true,
        bodyStyle: 'padding: 10px 10px 0 10px;',
        labelWidth: 50,
        defaults: {
            anchor: '95%',
            allowBlank: false,
            msgTarget: 'side'
        },
        items: [{
            xtype: 'textfield',
            fieldLabel: 'Name'
        },{
            xtype: 'fileuploadfield',	//上传文件的类型,使用xtype.前面两个都是直接new出一个Ext.ux.form.FileUploadField对象
            id: 'form-file',
            emptyText: 'Select an image',
            fieldLabel: 'Photo',
            name: 'photo-path',
            buttonText: '',
            buttonCfg: {				//自定义上传按钮样式
                iconCls: 'upload-icon'
            }
        }],
        buttons: [{
            text: 'Save',
            handler: function(){
                if(fp.getForm().isValid()){			//支持表单验证
	                fp.getForm().submit({			//提交表单
	                    //url: 'file-upload.php',
	                    url: 'file-upload.jsp',		//服务器端数据
	                    waitMsg: 'Uploading your photo...',
	                    success: function(fp, o){	//服务器必须返回JSON数据
	                        msg('Success', 'Processed file "'+o.result.file+'" on the server');
	                    }
	                });
                }
            }
        },{
            text: 'Reset',
            handler: function(){
                fp.getForm().reset();
            }
        }]
    });

	// ExtJS表单提交
	// ExtJs 备忘录（4）—— Form表单（四） [ 数据提交 ]
	// http://www.cnblogs.com/over140/archive/2009/09/25/1573948.html
    var form1 = new Ext.FormPanel({
        renderTo: 'submit-form',
        width: 500,
        frame: true,
        title: '<center>表单提交</center>',
		//style: 'margin-left:auto;margin-right:auto;width:500px;margin-top:8px;',
		labelAlign: 'right',
		labelWidth: 170,
		buttonAlign:'center',
        items: [{
            xtype: 'textfield',
            fieldLabel: 'Name'
        },{
            xtype: 'fileuploadfield',	//上传文件的类型,使用xtype.前面两个都是直接new出一个Ext.ux.form.FileUploadField对象
            emptyText: 'Select an image',
            fieldLabel: 'Photo',
            name: 'photo-path',
            buttonText: '',
            buttonCfg: {				//自定义上传按钮样式
                iconCls: 'upload-icon'
            }
        }],
        buttons: [{
            text: "普通方式",
			handler:function(){
				if(form1.form.isValid()){
					//只用指定TextField的id或者name属性，服务器端Form中就能取到表单的数据
					//如果同时指定了id和name，那么name属性将作为服务器端Form取表单数据的Key
					var form = form1.getForm().getEl().dom;
					form.action = 'redirect.jsp';
					//指定为GET方式时,url中指定的参数将失效，表单项转换成url中的key=value传递给服务端
					//例如这里指定为GET的话,url为:submit.aspx?param2=你输入的值
					//form.method = 'GET';//GET、POST
					form.submit();
				}
			}
        },{
        	text: "默认方式",
            handler:function(){
                form1.getForm().submit({
                    url:'file-upload.jsp',
                    method:'POST',
                    //waitTitle : "提示",
                    //waitMsg: '正在提交,请稍候...',
                    success: function(form, action){
	                    msg('ajax',action.response.responseText);
                    },
                    failure: function(form, action){
                        msg('ajax',action.response.responseText);
                    }
                });
            }
        },{
			text: "Connect方式",
			handler:function(){
				var conn = new Ext.data.Connection();
				conn.request({
					url: 'file-upload.jsp',
					method: 'POST',	//此处与params对应，如果为POST，则服务器端从Request.Form中可以取得到数据，反之从QueryString中取数据
					params:form1.form.getValues(),
					success: function(response, opts) {
						 msg('connect',response.responseText);
					}
				});
			}
		},{
			//Ext.Ajax是继承Ext.data.Connection而来
			text: "Ajax方式",
			handler:function(){
				Ext.Ajax.request({
　　　　　　　　   		url: 'file-upload.jsp',
　　　　　　　　    		method: 'POST',
					params:form1.form.getValues(),//取得key/value对象数组
　　　　　　　　    		//jsonData://指定需要发送给服务器端的JSON数据。如果指定了该属性则其它的地方设置的要发送的参数值将无效。
　　　　　　　　    		//指定Ajax请求的回调函数，该函数不管是调用成功或失败，都会执行。
　　　　　　　　    		callback: function (options, success, response) {
　　　　　　　　    			if(success){
　　　　　　　　　　    			msg('connect',response.responseText);
　　　　　　　　　　    		}
　　　　　　　　   		}
　　　　　  		});
			}
		}]
    });

});