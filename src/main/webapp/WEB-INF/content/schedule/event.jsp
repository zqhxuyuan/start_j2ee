<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>dhtmlxschedule示例</title>
	<link rel="stylesheet" href="${ctx}/js/dhtmlx/schedule/dhtmlxscheduler.css" type="text/css" media="screen"/>
	<script src="${ctx}/js/dhtmlx/schedule/dhtmlxscheduler.js" type="text/javascript"></script>
	<script src="${ctx}/js/dhtmlx/schedule/jquery.js" type="text/javascript"></script>
	<style type="text/css" media="screen">
		html, body{
			margin:0px;
			padding:0px;
			height:100%;
			overflow:hidden;
		}	
	</style>
	<script type="text/javascript" charset="utf-8">
		function init() {
			scheduler.config.xml_date="%Y-%m-%d %H:%i";
			scheduler.init('scheduler_here',null,"month");
			//scheduler.load("${ctx}/js/dhtmlx/schedule/common/events.xml?teim=" + new Date().getTime());
			//scheduler.load("event.do?method=findAllEvent&?teim=" + new Date().getTime());
			scheduler.load("${ctx}/schedule/event!list.action?teim=" + new Date().getTime());
		}
		
function addorupdate(ev) {
	var url = "";
	var startdate = formatDate(ev.start_date);
	var enddate = formatDate(ev.end_date);
	
	//url += "event.do?method=addOrUpdateEvent&eventId=" + ev.id + "&startDate=" + startdate + "&endDate=" + enddate + "&text=" + encodeURI(ev.text);
	//url += "${ctx}/schedule/event!addOrUpdateEvent.action?event.eventId=" + ev.id + "&event.startDate=" + startdate + "&event.endDate=" + enddate + "&event.text=" + encodeURI(ev.text);
	url += "${ctx}/schedule/event!addOrUpdateEvent.action?eventId=" + ev.id + "&startDate=" + startdate + "&endDate=" + enddate + "&text=" + encodeURI(ev.text);
	$.get(url); 
}

function delEvent(eventId){
	var url = "";
	//url = "event.do?method=delEvent&eventId=" + eventId;
	url = "${ctx}/schedule/event!delEvent.action?eventId=" + eventId;
	$.get(url);
}

function formatDate(dateObj){
	var result;
	var year;
	var month;
	var date;
	var hours;
	var minutes;
	var seconds;
	
	if ($.browser.msie) {
		year = dateObj.getYear();
	} else {
		year = dateObj.getYear() + 1900;
	}
	month = dateObj.getMonth() + 1;
	date = dateObj.getDate();
	hours = dateObj.getHours();
	minutes = dateObj.getMinutes();
	seconds = dateObj.getSeconds();
	result = year + "-" + month + "-" + date + " " +  hours + ":" + minutes + ":" + seconds;
	
	return result;
}
</script>
</head>


<body onload="init();">
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>
</body>