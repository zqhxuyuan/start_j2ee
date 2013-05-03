window.I.SCROLL = (function() {
	var tb;// 进行数据呈现的table
	var heads = [];// 表头数组
	var url;// ajax请求数据的url
	var iniSize=100;// 初始数据显示条数
	var incSize=10;// 滚动条滚动数据增量条数
	var currentStart=0;//当前屏记录起始位置
	var total;//总数据条数

	// 进行表头和iniSize数据初始化
	var init = function() {
		var param = 'start=0&length=' + iniSize;
		// 第一次请求数据
		I.AJAX.post(url, param, function(o) {
					var r = I.AJAX.json(o.responseText);
					total=r.total;
					var list = r.data;
					var table = tb;

					// 创建表头部
					var head = document.createElement('thead');
					var row = document.createElement('tr');
					I.each(heads, function(o, i) {
								var th = document.createElement('th');
								th.appendChild(document.createTextNode(o));
								row.appendChild(th);
							});
					head.appendChild(row);
					table.appendChild(head);

					// 显示数据
					var tbody = document.createElement('tbody');
					I.each(list, function(os, i) {// tr
								var tr = document.createElement('tr');
								I.each(os, function(o, j) {// td
											var td = document.createElement('td');
											td.appendChild(document.createTextNode(o));
											tr.appendChild(td);
										});
								tbody.appendChild(tr);
							});
					table.appendChild(tbody);
				});
	}

	// 滚动条
	var scroll = function() {
		window.onscroll = function() {
			// 滚动条在最底端的时候
			if (document.documentElement.scrollHeight == (document.documentElement.scrollTop | document.body.scrollTop)
					+ document.documentElement.clientHeight) {
				// 到最底端去请求新数据
				var table = tb;
				var start = currentStart+iniSize;
				if(start>=total) return;
				var param = 'start=' + start + '&length=' + incSize;
				I.AJAX.post(url, param, function(o) {
							var r = I.AJAX.json(o.responseText);
							var list = r.data;
							// 加载新的十行数据
							I.each(list, function(os, i) {
										var row = table.insertRow(table.rows.length);
										I.each(os, function(o, j) {
													row.insertCell(j).innerHTML = o;
												});
									});
							// 删除前incSize行数据
							for (var i = 0; i < ((total-start)<incSize?total-start:incSize); i++) {
								table.deleteRow(1);
							}
							currentStart+=((total-start)<incSize?total-start+1:incSize);
							window.scroll(0,parseInt(document.documentElement.scrollTop|document.body.scrollTop)- 10);// 设置滚动条的位置
						});
			}

			// 滚动条在最顶端的时候
			if ((document.documentElement.scrollTop | document.body.scrollTop) == 0) {
				var table = tb;
				var e = currentStart;
				if (e != 0) {
					var s = e - incSize < 0 ? 0 : e- incSize;
					var param = 'start=' + s + '&length=' + (e-incSize<0?incSize-e:incSize);
					I.AJAX.post(url, param, function(o) {
						var list = I.AJAX.json(o.responseText).data;
						// 加载新的十行数据
						I.each(list, function(os, i) {
									var row = table.insertRow(i + 1);
									I.each(os, function(o, j) {
												row.insertCell(j).innerHTML = o;
											});
								});
						// 删除后incSize行数据
						for (var i = 0; i < (e-incSize<0?incSize-e+1:incSize); i++) {
							table.deleteRow(table.rows.length - 1);
						}
						currentStart=(e-incSize<0?0:currentStart-incSize);
						window.scroll(0, 10);// 设置滚动条的位置
					});
				}//end if
			}//end if
		}//end function
	}//end function
	
	//初始化参数
	var initParam=function(p1,p2,p3,p4,p5){
		tb=p1;
		heads=p2;
		url=p3;
		iniSize=p4|iniSize;
		incSize=p5|incSize;
	}
	
	return{
		'scroll':function(p1,p2,p3,p4,p5){
					initParam(p1,p2,p3,p4,p5);
					init();
					scroll();
				}
	}
})();