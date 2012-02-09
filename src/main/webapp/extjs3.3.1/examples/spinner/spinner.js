Ext.onReady(function(){
    var simple = new Ext.FormPanel({
        labelWidth: 40, // label settings here cascade unless overridden
        frame: true,
        title: 'Simple Form',
        bodyStyle: 'padding:5px 5px 0',
        width: 210,
        defaults: {width: 135},
        defaultType: 'textfield',

        items: [
            new Ext.ux.form.SpinnerField({	//两种方式使用组件,一种是直接new
                fieldLabel: 'Age',
                name: 'age'
            }),
            {
            	xtype: 'spinnerfield',		//另一种是设置xtype类型为组件的类型.其实这种方法在别的组件中也是适用的
            	fieldLabel: 'Test',
            	name: 'test',
            	minValue: 0,
            	maxValue: 100,
            	allowDecimals: true,
            	decimalPrecision: 1,
            	incrementValue: 0.4,
            	alternateIncrementValue: 2.1,
            	accelerate: true
            }
        ]
    });

    simple.render('form-ct');
});
