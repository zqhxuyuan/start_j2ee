<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="../css/table.css" />
	<script type="text/javascript" src="i.js"></script>
	<script type="text/javascript" src="i.ajax.js"></script>
	<script type="text/javascript" src="i.scroll.js"></script>
	<script type="text/javascript">
	I.ready(function(){
		/*
		* 三个必须的参数
		* 1.呈现数据的表格
		* 2.表头数组
		* 3.请求数据的后台url
		* 两个可选参数
		* 1.一屏数据显示的条数，默认为100
		* 2.滚动屏幕数据的加载条数,默认为10
		*/
		//I.SCROLL.scroll(I.$('tag','table')[0],['ID','年龄','姓名','爱好'],'DataServlet');
		//I.SCROLL.scroll(I.$('tag','table')[0],['ID','年龄','姓名','爱好'],'/DataServlet');
		I.SCROLL.scroll(I.$('tag','table')[0],['ID','年龄','姓名','爱好'],'/start_j2ee/DataServlet');

		I.listen(window,'scroll',function(){
			var water = document.getElementById("water");
	        water.style.top = (document.documentElement.scrollTop|document.body.scrollTop)+'px';
	        water.innerHTML = "scrollTop:" + (document.documentElement.scrollTop|document.body.scrollTop) + "<br/>ClientHeight:" + document.documentElement.clientHeight + "<br/>scrollHeight:" + document.documentElement.scrollHeight;
		});
	});
    </script>
    </head>
    <body>
        <div id="water" style="position:absolute;top:0px;left:0px;color:#ccc;width:150px;height:55px;background-color:navy">
            Water
        </div>
       	<table style="margin: 0px;" cellspacing="0" class="data"></table>
    </body>
</html>