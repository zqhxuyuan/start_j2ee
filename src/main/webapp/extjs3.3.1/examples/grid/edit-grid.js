    /**
     * Handler specified for the 'Available' column renderer
     */
    function formatDate(value){
        return value ? value.dateFormat('M d, Y') : '';
    }
    
Ext.onReady(function(){
    var fm = Ext.form;

    // 1.定义列模式:the column model has information about grid columns
    // dataIndex maps the column to the specific data field in the data store (created below)
    var cm = new Ext.grid.ColumnModel({
        defaults: {						// specify any defaults for each column
            sortable: true 				// columns are not sortable by default           
        },
        columns: [{
            id: 'common',
            header: 'Common Name',
            dataIndex: 'common',
            width: 220,
            editor: new fm.TextField({	// 这里是重点,每一列都是可编辑的.在editor属性中定义可编辑的列类型:文本框,下拉框..
                allowBlank: false
            })
        }, {
            header: 'Light',
            dataIndex: 'light',
            width: 130,
            editor: new fm.ComboBox({
                typeAhead: true,
                triggerAction: 'all',
                transform: 'light',		// transform the data already specified in html
                lazyRender: true,
                listClass: 'x-combo-list-small'
            })
        }, {
            header: 'Price',
            dataIndex: 'price',
            width: 70,
            align: 'right',
            renderer: 'usMoney',
            editor: new fm.NumberField({
                allowBlank: false,
                allowNegative: false,
                maxValue: 100000
            })
        }, {
            header: 'Available',
            dataIndex: 'availDate',
            width: 95,
            renderer: formatDate,
            editor: new fm.DateField({
                format: 'm/d/y',
                minValue: '01/01/06',
                disabledDays: [0, 6],
                disabledDaysText: 'Plants are not available on the weekends'
            })
        }, {
            xtype: 'checkcolumn',
            header: 'Indoor?',
            dataIndex: 'indoor',
            width: 55
        }]
    });

    // 2.创建数据源:create the Data Store,Reader中的fields要和ColumnModel中的columns的dataIndex对应上.
    var store = new Ext.data.Store({
        autoDestroy: true,					// destroy the store if the grid is destroyed
        url: 'plants.xml',					// load remote data using HTTP. So It can't access directory,must in web env.
        reader: new Ext.data.XmlReader({	// specify a XmlReader (coincides with the XML format of the returned data)
            record: 'plant',				// records will have a 'plant' tag
            fields: [						// use an Array of field definition objects to implicitly create a Record constructor
                {name: 'common', type: 'string'},		// the 'name' below matches the tag name to read, except 'availDate' which is mapped to the tag 'availability'
                {name: 'botanical', type: 'string'},
                {name: 'light'},
                {name: 'price', type: 'float'},             
                {name: 'availDate', mapping: 'availability', type: 'date', dateFormat: 'm/d/Y'},		// dates can be automatically converted by specifying dateFormat
                {name: 'indoor', type: 'bool'}
            ]
        }),
        sortInfo: {field:'common', direction:'ASC'}
    });

    // 3.创建表格组件,将上面的创建好的数据源和列模式结合起来:create the editor grid,好比创建一个普通的GridPanel..
    var grid = new Ext.grid.EditorGridPanel({
        store: store,
        cm: cm,
        renderTo: 'editor-grid',
        width: 600,
        height: 300,
        autoExpandColumn: 'common', // column with this id will be expanded
        title: 'Edit Plants?',
        frame: true,
        clicksToEdit: 1,			//单击列,编辑状态
        tbar: [{
            text: 'Add Plant',
            handler : function(){
                var Plant = grid.getStore().recordType;	// access the Record constructor through the grid's store
                var p = new Plant({				//将要被插入的新行的数据		
                    common: 'New Plant 1',
                    light: 'Mostly Shade',
                    price: 0,
                    availDate: (new Date()).clearTime(),
                    indoor: false
                });
                grid.stopEditing();
                store.insert(0, p);				//插入新的一行
                grid.startEditing(0, 0);
            }
        }]
    });

    // 4.手动触发数据源加载:manually trigger the data store load.由于是异步加载数据,使用监听器或者回调函数
    store.load({
        callback: function(){					// store loading is asynchronous, use a load listener or callback to handle results
            Ext.Msg.show({
                title: 'Store Load Callback',
                msg: 'store was loaded, data available for processing',
                modal: false,
                icon: Ext.Msg.INFO,
                buttons: Ext.Msg.OK
            });
        }
    });
});