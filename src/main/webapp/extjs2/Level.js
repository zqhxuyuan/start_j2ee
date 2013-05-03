Ext.onReady(function() {
	    Ext.QuickTips.init();
	    var newFormWin;
	    var form1;
    
		//定义一个JsonReader对象，用于表格列表数据显示，即grid对象
	    var _jsonReader = new Ext.data.JsonReader( {
	        root : 'list',
	        totalProperty : 'totalCount',
	        id : 'levelid',
	        successProperty : '@success'
	    }, [ {
	        name : 'levelid',
	        mapping : 'levelid',
	        type : 'int'
	    }, {
	        name : 'levelname',
	        mapping : 'levelname'
	    }, {
	        name : 'description',
	        mapping : 'description'
	    }]);
    
    	// Store对象，注意proxy配置参数，如果url : 'LevelAjaxJsonData.action'与程序在同一应用下面，就用new Ext.data.HttpProxy，如果不在同一应用中要用Ext.data.ScriptTagProxy对象
        var ds = new Ext.data.Store( {
            proxy : new Ext.data.HttpProxy( {
                url : 'LevelAjaxJsonData.action'
            }),
            reader : _jsonReader
        });
        ds.setDefaultSort('levelid', 'desc');//设置默认的排序字段
 
        // ColumnModel对象，用于grid对象中的列格式化配置
        var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
            id : 'levelid',
            header : '序号',
            dataIndex : 'levelid',
            width : 40
        }, {
            header : "级别名称",
            dataIndex : 'levelname',
            width : 50,
            sortable : true,
            locked : false
        }, {
            header : "描述",
            dataIndex : 'description',
            width : 100
        }]);
        cm.defaultSortable = true;
		
		// GridPanel对象
        var grid = new Ext.grid.GridPanel( {   // var grid = new Ext.grid.EditorGridPanel( {
            collapsible : true,// 是否可以展开
            animCollapse : false,// 展开时是否有动画效果
            title : '级别管理',
            iconCls : 'icon-grid',
            store : ds,
            cm : cm,
            renderTo : 'topic-grid',
            viewConfig : {
                forceFit : true
            },

            // 添加分页工具栏
            bbar : new Ext.PagingToolbar( {
                pageSize : 30,
                store : ds,
                displayInfo : true,
                displayMsg : '显示 {0}-{1}条 / 共 {2} 条',
                emptyMsg : "无数据。",
                items : ['-', {
                    pressed : true,
                    enableToggle : true,
                    text : '按钮',
                    cls : 'x-btn-text-icon details',
                    toggleHandler : ptb_bt1
                }]
            }),
            
            // 添加内陷的工具条
            tbar : [ {
                id : 'New1',
                text : ' 新建  ',
                tooltip : '新建一个表单',
                iconCls : 'add',
                handler : function() {
                    ptb_bt1();
                }
            }, '-', {
                text : '修改',
                tooltip : '修改',
                iconCls : 'edit',
                handler : function() {
                    ptb_bt2();
                }
            }, '-', {
                text : '删除',
                tooltip : '删除被选择的内容',
                iconCls : 'remove',
                handler : function() {
                    ptb_bt3();
                }
            }],
            width : 700,
            height : 400,
            frame : true,
            loadMask : true,// 载入遮罩动画
            autoShow : true
        });
		
		//数据载入
        ds.load( {
            params : {
                start : 0,//开始数
                limit : 30,//每次载入数量，服务器段就根据这两个参数来处理数据分页
                forumId : 4
            }
        });
        grid.render();
		
		//添加行双击事件，双击是可以打开修改窗口
        grid.on("rowdblclick", function(grid) {
            loadFormData(grid);
        });
        
        // 载入被选择的数据行的表单数据
        var loadFormData = function(grid) {
            var _record = grid.getSelectionModel().getSelected();
            if (!_record) {//这里判断是否有行已经被选择
                Ext.example.msg('修改操作', '请选择要修改的一项！');
                return
            } else {
                myFormWin();
                form1.form.load( {
                    url : 'LoadLevel.action?level.levelid=' + _record.get('levelid'),
                    waitMsg : '正在载入数据...',
 
                    failure : function() {
                        Ext.example.msg('编辑', '载入失败');
                    },
                    success : function() {
                        Ext.example.msg('编辑', '载入成功！');
                    }
                });
            }
        }
        
        // 分页工具栏按钮--新建事件
        var ptb_bt1 = function() {
            myFormWin();
        };
        // 修改操作事件
        var ptb_bt2 = function() {
            loadFormData(grid);
        };
        // 删除事件
        var ptb_bt3 = function() {
            var _record = grid.getSelectionModel().getSelected();
            if (_record) {//判断是否有行被选择
                Ext.MessageBox.confirm('确认删除', '你确认要删除这条数据吗？', function(btn) {
                    if (btn == "yes") {
                        var m = grid.getSelections();//所有被选择的行
                        var jsonData = "";//
                        for (var i = 0, len = m.length;i < len; i++) {
                            var ss = m[i].get("levelid");
                            if (i == 0) {
                                jsonData = jsonData + ss;
                            } else {
                                jsonData = jsonData + "," + ss;
                            }
                            ds.remove(m[i]);
                        }
                        ds.load( {
                            params : {
                                start : 0,
                                limit : 30,
                                delData : jsonData//这里是向服务器段发送的数据信息，一般采用JSON协议，这儿直接采用，只发送用逗号分割的ID号序列， 以方便
                            }
                        });
                        // Ext.example.msg('---删除操作---', '你删除的数据是');
                    }
                });
            } else {
                Ext.example.msg('删除操作', '请选择要删除的数据项！');
            }
        };
 
        // form_win定义一个Window对象，用于新建和修改时的弹出窗口。 create the window on the first click and reuse on subsequent
        var myFormWin = function() {
            if (!newFormWin) {
                newFormWin = new Ext.Window( {
                    el : 'topic-win',
                    layout : 'fit',
                    width : 400,
                    height : 300,
                    closeAction : 'hide',
                    plain : true,
                    title : '窗口',
                    items : form1,
                    reader : _jsonReader
                });
            }
            newFormWin.show('New1');
        }
		
		//用窗体Form的JsonReader对象，修改时数据载入解析
        var _jsonFormReader = new Ext.data.JsonReader( {
            root : 'list',
            totalProperty : 'totalCount',
            id : 'levelid',
            successProperty : '@success'
        }, [ {
            name : 'level.levelid',
            mapping : 'levelid',
            type : 'int'
        }, {
            name : 'level.levelname',
            mapping : 'levelname'
        }, {
            name : 'level.description',
            mapping : 'description'
        }]);
 
        // 窗体
        form1 = new Ext.FormPanel( {
            // collapsible : true,// 是否可以展开
            labelWidth : 75, // label settings here cascade unless overridden
            url : 'AddLevel.action',
            frame : true,
            title : '添加级别',
            bodyStyle : 'padding:5px 5px 0',
            width : 350,
            waitMsgTarget : true,
            reader : _jsonFormReader,
            defaults : {
                width : 230
            },
            defaultType : 'textfield',
            items : [ {
                fieldLabel : '级别ID',
                name : 'level.levelid',
                allowBlank : false
            }, {
                fieldLabel : '级别名称',
                name : 'level.levelname',
                allowBlank : false
            }, new Ext.form.TextArea( {
                fieldLabel : '描述',
                name : 'level.description',
                growMin : 234
            })],
 
            buttons : [ {
                text : '保存',
                disabled : false,
                handler : function() {
                    if (form1.form.isValid()) {
                        form1.form.submit( {
                            url : 'AddLevel.action',
                            success : function(from, action) {
                                Ext.example.msg('保存成功', '添加级别成功！');
                                ds.load( {
                                    params : {
                                        start : 0,
                                        limit : 30,
                                        forumId : 4
                                    }
                                });
                            },
                            failure : function(form, action) {
                                Ext.example.msg('保存失败', '添加级别失败！');
                            },
                            waitMsg : '正在保存数据，稍后...'
                        });
                        dialog.hide();
                    } else {
                        Ext.Msg.alert('信息', '请填写完成再提交!');
                    }
                }
            }, {
                text : '取消',
                handler : function() {
                    newFormWin.hide();
                }
            }]
        });
    });