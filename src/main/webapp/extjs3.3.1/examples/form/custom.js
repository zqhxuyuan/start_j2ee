Ext.onReady(function(){
    var ds = new Ext.data.Store({
    	//跨域访问远程的服务器数据时,采用ScriptTagProxy
    	//返回的是JSON字符串,见文件topics-remote.json
        //proxy: new Ext.data.ScriptTagProxy({
        //    url: 'http://extjs.com/forum/topics-remote.php'
        //}),
        //通过HTTP协议代理请求远程的服务器数据
        proxy: new Ext.data.HttpProxy({
            url: 'topics-remote.json'
        }),
        //Grid?Noo,It's Ext.XTemplate
        reader: new Ext.data.JsonReader({
            root: 'topics',
            totalProperty: 'totalCount',
            id: 'post_id'
        }, [
            {name: 'postId', mapping: 'post_id'},
            {name: 'title', mapping: 'topic_title'},
            {name: 'topicId', mapping: 'topic_id'},
            {name: 'author', mapping: 'author'},
            {name: 'lastPost', mapping: 'post_time', type: 'date', dateFormat: 'timestamp'},
            {name: 'excerpt', mapping: 'post_text'}
        ]),

        baseParams: {limit:20, forumId: 4}
    });

    // Custom rendering Template for the View
    var resultTpl = new Ext.XTemplate(
    	// tpl + for 循环构造出每一条记录
        '<tpl for=".">',
        '<div class="search-item">',
            '<h3><span>{lastPost:date("M j, Y")}<br />by {author}</span>',
            '<a href="http://extjs.com/forum/showthread.php?t={topicId}&p={postId}" target="_blank">{title}</a></h3>',
            '<p>{excerpt}</p>',
        '</div></tpl>'
    );

	//上面的结果集(模板数据)放置在Panel里: tpl: resultTpl, 数据源:  store: ds,
    var panel = new Ext.Panel({
        applyTo: 'search-panel',
        title:'Forum Search',
        height:300,
        autoScroll:true,

        items: new Ext.DataView({
            tpl: resultTpl,
            store: ds,
            itemSelector: 'div.search-item'
        }),

        tbar: [
            'Search: ', ' ',
            //搜索: 对目标数据进行搜索.目标数据集数据源ds
            new Ext.ux.form.SearchField({
                store: ds,
                width:320
            })
        ],

		//分页
        bbar: new Ext.PagingToolbar({
            store: ds,
            pageSize: 20,
            displayInfo: true,
            displayMsg: 'Topics {0} - {1} of {2}',
            emptyMsg: "No topics to display"
        })
    });

	//加载数据
    ds.load({params:{start:0, limit:20, forumId: 4}});
});
