    /**
     * Custom function used for column renderer
     */
    function change(val) {
        if (val > 0) {
            return '<span style="color:green;">' + val + '</span>';
        } else if (val < 0) {
            return '<span style="color:red;">' + val + '</span>';
        }
        return val;
    }

    /**
     * Custom function used for column renderer
     */
    function pctChange(val) {
        if (val > 0) {
            return '<span style="color:green;">' + val + '%</span>';
        } else if (val < 0) {
            return '<span style="color:red;">' + val + '%</span>';
        }
        return val;
    }
    
    // sample static data for the store
    var myData = [
        ['3m Co',                               71.72, 0.02,  0.03,  '9/1 12:00am'],
        ['Alcoa Inc',                           29.01, 0.42,  1.47,  '9/1 12:00am'],
        ['Altria Group Inc',                    83.81, 0.28,  0.34,  '9/1 12:00am'],
        ['American Express Company',            52.55, 0.01,  0.02,  '9/1 12:00am'],
        ['American International Group, Inc.',  64.13, 0.31,  0.49,  '9/1 12:00am'],
        ['AT&T Inc.',                           31.61, -0.48, -1.54, '9/1 12:00am'],
        ['Boeing Co.',                          75.43, 0.53,  0.71,  '9/1 12:00am'],
        ['Caterpillar Inc.',                    67.27, 0.92,  1.39,  '9/1 12:00am'],
        ['Citigroup, Inc.',                     49.37, 0.02,  0.04,  '9/1 12:00am'],
        ['E.I. du Pont de Nemours and Company', 40.48, 0.51,  1.28,  '9/1 12:00am'],
        ['Exxon Mobil Corp',                    68.1,  -0.43, -0.64, '9/1 12:00am'],
        ['General Electric Company',            34.14, -0.08, -0.23, '9/1 12:00am'],
        ['General Motors Corporation',          30.27, 1.09,  3.74,  '9/1 12:00am'],
        ['Hewlett-Packard Co.',                 36.53, -0.03, -0.08, '9/1 12:00am'],
        ['Honeywell Intl Inc',                  38.77, 0.05,  0.13,  '9/1 12:00am'],
        ['Intel Corporation',                   19.88, 0.31,  1.58,  '9/1 12:00am'],
        ['International Business Machines',     81.41, 0.44,  0.54,  '9/1 12:00am'],
        ['Johnson & Johnson',                   64.72, 0.06,  0.09,  '9/1 12:00am'],
        ['JP Morgan & Chase & Co',              45.73, 0.07,  0.15,  '9/1 12:00am'],
        ['McDonald\'s Corporation',             36.76, 0.86,  2.40,  '9/1 12:00am'],
        ['Merck & Co., Inc.',                   40.96, 0.41,  1.01,  '9/1 12:00am'],
        ['Microsoft Corporation',               25.84, 0.14,  0.54,  '9/1 12:00am'],
        ['Pfizer Inc',                          27.96, 0.4,   1.45,  '9/1 12:00am'],
        ['The Coca-Cola Company',               45.07, 0.26,  0.58,  '9/1 12:00am'],
        ['The Home Depot, Inc.',                34.64, 0.35,  1.02,  '9/1 12:00am'],
        ['The Procter & Gamble Company',        61.91, 0.01,  0.02,  '9/1 12:00am'],
        ['United Technologies Corporation',     63.26, 0.55,  0.88,  '9/1 12:00am'],
        ['Verizon Communications',              35.57, 0.39,  1.11,  '9/1 12:00am'],            
        ['Wal-Mart Stores, Inc.',               45.45, 0.73,  1.63,  '9/1 12:00am']
    ];
    
Ext.onReady(function(){
    Ext.QuickTips.init();

    // NOTE: This is an example showing simple state management状态管理. During development,
    // it is generally best to disable state management as dynamically-generated ids动态生成的id列表会随着页面的加载而改变
    // can change across page loads, leading to unpredictable results.  The developer
    // should ensure that stable state ids are set for stateful components in real apps.    
    Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

    // create the data store
    var store = new Ext.data.ArrayStore({
        fields: [
           {name: 'company'},
           {name: 'price',      type: 'float'},
           {name: 'change',     type: 'float'},
           {name: 'pctChange',  type: 'float'},
           {name: 'lastChange', type: 'date', dateFormat: 'n/j h:ia'}
        ]
    });
    // manually load local data用ArrayStore加载本地数据
    store.loadData(myData);

    // create the Grid
    var grid = new Ext.grid.GridPanel({
        store: store,						//Grid的数据源
        columns: [							//列
            {
                id       : 'company',		//id,Grid的每一行最好能对应一个唯一的id
                header   : 'Company', 		//Grid的每一列的标题
                width    : 160, 
                sortable : true, 			//排序
                dataIndex: 'company'		//对应上面的Store的fields
            },
            {
                header   : 'Price', 
                width    : 75, 
                sortable : true, 
                renderer : 'usMoney', 		//自定义UI展现
                dataIndex: 'price'
            },
            {
                header   : 'Change', 
                width    : 75, 
                sortable : true, 
                renderer : change, 			//自定义UI展现:函数change(val)
                dataIndex: 'change'
            },
            {
                header   : '% Change', 
                width    : 75, 
                sortable : true, 
                renderer : pctChange, 
                dataIndex: 'pctChange'
            },
            {
                header   : 'Last Updated', 
                width    : 85, 
                sortable : true, 
                renderer : Ext.util.Format.dateRenderer('m/d/Y'), 
                dataIndex: 'lastChange'
            },
            {
                xtype: 'actioncolumn',		//ActionColumn动作列
                width: 50,
                items: [{
                    icon   : '../shared/icons/fam/delete.gif',  // Use a URL in the icon config
                    tooltip: 'Sell stock',
                    handler: function(grid, rowIndex, colIndex) {	//动作处理,回调函数.三个参数,分别可以获取到想要的对象和数据,比如grid..
                        var rec = store.getAt(rowIndex);			//由ArrayStore对象的getAt(index)定位到当前选中的某一条记录
                        alert("Sell " + rec.get('company'));		//每一行又可以定位到行上的每一列,类似map的get(key)操作
                    }
                }, {
                    getClass: function(v, meta, rec) {          	// Or return a class from a function
                        if (rec.get('change') < 0) {
                            this.items[1].tooltip = 'Do not buy!';
                            return 'alert-col';
                        } else {
                            this.items[1].tooltip = 'Buy stock';
                            return 'buy-col';
                        }
                    },
                    handler: function(grid, rowIndex, colIndex) {
                        var rec = store.getAt(rowIndex);
                        alert("Buy " + rec.get('company'));
                    }
                }]
            }
        ],
        stripeRows: true,
        autoExpandColumn: 'company',
        height: 350,
        width: 600,
        title: 'Array Grid',
        stateful: true,				// config options for stateful behavior
        stateId: 'grid'				// 对应new出来的GridPanel对象
    });

    grid.render('grid-example');	// render the grid to the specified div in the page
});