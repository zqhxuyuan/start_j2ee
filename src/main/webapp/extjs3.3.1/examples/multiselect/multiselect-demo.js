Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.form.Field.prototype.msgTarget = 'side';

    /*
     * Ext.ux.form.MultiSelect Example Code
     */
    var msForm = new Ext.form.FormPanel({	//放置在一个Form中
        title: 'MultiSelect Test',
        width: 700,
        bodyStyle: 'padding:10px;',
        renderTo: 'multiselect',
        items:[{
            xtype: 'multiselect',			//多选的组件类型
            fieldLabel: 'Multiselect<br />(Required)',
            name: 'multiselect',
            width: 250,
            height: 200,
            allowBlank:false,
            //数据源
            store: [[123,'One Hundred Twenty Three'],
                    ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
                    ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
            tbar:[{							//multiselect中的topbar	
                text: 'clear',
                handler: function(){
                	//formId.getForm.findField('someId')获取Form中的某个Field
	                msForm.getForm().findField('multiselect').reset();
	            }
            }],
            ddReorder: true					//支持拖拽drag
        }],
        tbar:[{								//表单中的topbar
            text: 'Options',
            menu: [{
	            text: 'Set Value (2,3)',
	            handler: function(){
	            	//同上,获取表单中的Filed的方式
	                msForm.getForm().findField('multiselect').setValue('2,3');
	            }
	        },{
	            text: 'Toggle Enabled',
	            handler: function(){
	                var m = msForm.getForm().findField('multiselect');
	                if (!m.disabled) {
	                    m.disable();
	                } else {
	                    m.enable();
	                }
	            }
            }]
        }],

        buttons: [{
            text: 'Save',
            handler: function(){
                if(msForm.getForm().isValid()){		//支持表单验证,只要组件放入FormPanel,那么就支持表单验证
	                Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />'+
	                    msForm.getForm().getValues(true));
                }
            }
        }]
    });


    /*
     * Ext.ux.form.ItemSelector Example Code
     */
	//数据源配置
    var ds = new Ext.data.ArrayStore({
        data: [[123,'One Hundred Twenty Three'],
            ['1', 'One'], ['2', 'Two'], ['3', 'Three'], ['4', 'Four'], ['5', 'Five'],
            ['6', 'Six'], ['7', 'Seven'], ['8', 'Eight'], ['9', 'Nine']],
        fields: ['value','text'],
        sortInfo: {
            field: 'value',
            direction: 'ASC'
        }
    });
    var isForm = new Ext.form.FormPanel({
        title: 'ItemSelector Test',
        width:700,
        bodyStyle: 'padding:10px;',
        renderTo: 'itemselector',
        items:[{
            xtype: 'itemselector',
            name: 'itemselector',
            fieldLabel: 'ItemSelector',
	        imagePath: '../ux/images/',
            multiselects: [{			//ItemSelector可以看做是MultiSelect的扩展
                width: 250,
                height: 200,
                store: ds,				//源数据
                displayField: 'text',	//显示值
                valueField: 'value'		//字段的实际值
            },{
                width: 250,
                height: 200,
                store: [['10','Ten']],	//目标数据
                tbar:[{
                    text: 'clear',
                    handler:function(){
	                    isForm.getForm().findField('itemselector').reset();
	                }
                }]
            }]
        }],

        buttons: [{
            text: 'Save',
            handler: function(){
                if(isForm.getForm().isValid()){
                    Ext.Msg.alert('Submitted Values', 'The following will be sent to the server: <br />'+
                        isForm.getForm().getValues(true));
                }
            }
        }]
    });

});
