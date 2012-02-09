Ext.onReady(function(){
    var chooser, btn;

	//插入图片:向chooser.html#div=images中插入<img src="data.url" style="xxx">的图片
    function insertImage(data){
    	Ext.DomHelper.append('images', {
    		tag: 'img', src: data.url, style:'margin:10px;visibility:hidden;'
    	}, true).show(true).frame();
    	btn.focus();
    };

	//点击chooser.html的插入图片按钮,调用choose方法,弹出供选择图片的Window
    function choose(btn){
    	if(!chooser){
    		//创建一个ImageChooser对象.这个对象封装了选择图片的功能
    		chooser = new ImageChooser({
    			url:'get-images.php',
    			width:515,
    			height:350
    		});
    	}
    	//在chooser.html中调用insertImage方法,显示在Window中选中的图片
    	//insertImage作为一个回调函数,见chooser.js
    	chooser.show(btn.getEl(), insertImage);
    };

    btn = new Ext.Button({
	    text: "Insert Image",
		handler: choose,
        renderTo: 'buttons'
    });
});
