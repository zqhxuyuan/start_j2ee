Ext.onReady(function(){
    // basic tabs 1, built from existing content 使用已经存在的内容构建Tab
    var tabs = new Ext.TabPanel({	//创建TabPanel
        renderTo: 'tabs1',			//呈现到id为tabs1的元素
        width:450,
        activeTab: 0,				//默认激活第一个Tab
        frame:true,
        defaults:{
        	autoHeight: true		//Tab里的内容,高度自适应
        },
        items:[						//Tab项组成
            {contentEl:'script', title: 'Short Text'},	//内容对应的div的id
            {contentEl:'markup', title: 'Long Text'}
        ]
    });

    // second tabs built from JS 使用JS构建Tab
    var tabs2 = new Ext.TabPanel({
        renderTo: document.body,
        activeTab: 0,
        width:600,
        height:250,
        plain:true,
        defaults:{
        	autoScroll: true			//高度固定,当内容超过高度时,出现竖直滚动条
        },
        items:[{
                title: 'Normal Tab',
                html: "My content was added during construction."	//直接往Tab里写入内容
            },{
                title: 'Ajax Tab 1',
                autoLoad:'ajax1.htm'	//自动加载URL里的内容
            },{
                title: 'Ajax Tab 2',
                autoLoad: {
                	url: 'ajax2.htm', 
                	params: 'foo=bar&wtf=1'	//也可以接收参数.比如多个Tab共用一个URL,不同的Tab里的内容根据点击的Tab来展现对应的数据
                }
            },{
                title: 'Event Tab',
                listeners: {activate: handleActivate},
                html: "I am tab 4's content. I also have an event listener attached."
            },{
                title: 'Disabled Tab',
                disabled:true,		//不可操作
                html: "Can't see me cause I'm disabled"
            }
        ]
    });

    function handleActivate(tab){
        alert(tab.title + ' was activated.');
    }
});