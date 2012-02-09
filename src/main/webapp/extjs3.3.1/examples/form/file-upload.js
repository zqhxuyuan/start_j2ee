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
        fileUpload: true,
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
	                    success: function(fp, o){	//返回JSON数据
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

});