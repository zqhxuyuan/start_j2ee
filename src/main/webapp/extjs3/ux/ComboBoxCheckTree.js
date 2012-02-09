/**
http://www.iteye.com/topic/164424		xiexueze
http://www.iteye.com/topic/212842
本例中的Ext.ux.ComboBoxTree对Ext.form.ComboBox控件进行了简单的扩展，将Ext.tree.TreePanel整合进来，以下拉树的形式显示出来。

扩展的功能点：
一、支持form的提交
二、提供属性selectNodeModel，指选择树结点的模式，提供四种模式，分别是
    1. all：所有结点都可选中
    2. exceptRoot：除根结点，其它结点都可选(默认)
    3. folder:只有目录（非叶子和非根结点）可选
    4. leaf：只有叶子结点可选

使用方法：
  var comboBoxTree = new Ext.ux.ComboBoxTree({   
      renderTo : 'comboBoxTree',   
      width : 250,   
      //listWidth:300, 这是设置下拉框的宽度，默认和comBoxTree的宽度相等  
      tree : new Ext.tree.TreePanel({   
            bbar: ['名称：',{xtype:'trigger',width:200,triggerClass:'x-form-search-trigger',}],   
            loader: new Ext.tree.TreeLoader({dataUrl:'getNodes.jsp'}),   
            root : new Ext.tree.AsyncTreeNode({id:'0',text:'根结点'})   
      }),  
      selectNodeModel:'leaf', //只有选叶子时，才设置值  
      listeners:{  
            beforeselect: function(comboxtree,newNode,oldNode){//选择树结点设值之前的事件  
                   //...  
            },  
            select: function(comboxtree,newNode,oldNode){//选择树结点设值之后的事件  
                  //...  
            },  
            afterchange: function(comboxtree,newNode,oldNode){//选择树结点设值之后，并当新值和旧值不相等时的事件  
                  //...  
            }  
      }  
  }); 
*/
Ext.ux.ComboBoxCheckTree = function() {
	this.treeId = Ext.id() + '-tree';
	this.maxHeight = arguments[0].maxHeight || arguments[0].height
			|| this.maxHeight;
	this.tpl = new Ext.Template('<tpl for="."><div style="height:'
			+ this.maxHeight + 'px"><div id="' + this.treeId
			+ '"></div></div></tpl>');
	this.store = new Ext.data.SimpleStore({
		fields : [],
		data : [[]]
	});
	this.selectedClass = '';
	this.mode = 'local';
	this.triggerAction = 'all';
	this.onSelect = Ext.emptyFn;
	this.editable = false;
	this.selectValueModel = 'leaf';

	Ext.ux.ComboBoxCheckTree.superclass.constructor.apply(this, arguments);
}

Ext.extend(Ext.ux.ComboBoxCheckTree, Ext.form.ComboBox, {

	checkField : 'checked',
	separator : ',',
	initEvents : function() {
		Ext.ux.ComboBoxCheckTree.superclass.initEvents.apply(this, arguments);
		this.keyNav.tab = false;

	},

	initComponent : function() {
		this.on({
			scope : this
		});

	},
	expand : function() {
		Ext.ux.ComboBoxCheckTree.superclass.expand.call(this);
		if (!this.tree.rendered) {
			this.tree.height = this.maxHeight;
			this.tree.border = false;
			this.tree.autoScroll = true;
			if (this.tree.xtype) {
				this.tree = Ext.ComponentMgr.create(this.tree, this.tree.xtype);
			}
			this.tree.render(this.treeId);
			var combox = this;
			this.tree.on('check', function(node, checked) {
				combox.setValue();
			});
			var root = this.tree.getRootNode();
			if (!root.isLoaded())
				root.reload();
		}
	},

	setValue : function() {

		var values = [];
		var texts = [];
		var root = this.tree.getRootNode();

		var checkedNodes = this.tree.getChecked();
		for (var i = 0; i < checkedNodes.length; i++) {
			var node = checkedNodes[i];
			if (this.selectValueModel == 'all'
					|| (this.selectValueModel == 'leaf' && node.isLeaf())
					|| (this.selectValueModel == 'folder' && !node.isLeaf())) {
				values.push(node.id);
				texts.push(node.text);
			}
		}

		this.value = values.join(this.separator);
		this.setRawValue(texts.join(this.separator));
		if (this.hiddenField) {
			this.hiddenField.value = this.value;
		}

	},

	getValue : function() {
		return this.value || '';
	},
	
	clearValue : function() {
		this.value = '';
		this.setRawValue(this.value);
		if (this.hiddenField) {
			this.hiddenField.value = '';
		}

		this.tree.getSelectionModel().clearSelections();
	}
});

Ext.reg('combochecktree', Ext.ux.ComboBoxCheckTree);