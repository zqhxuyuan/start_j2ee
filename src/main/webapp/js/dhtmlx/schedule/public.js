function addorupdate(ev) {
	var url = "";
	var startdate = formatDate(ev.start_date);
	var enddate = formatDate(ev.end_date);
	
	//url += "event.do?method=addOrUpdateEvent&eventId=" + ev.id + "&startDate=" + startdate + "&endDate=" + enddate + "&text=" + encodeURI(ev.text);
	url += "event!addOrUpdateEvent.action?eventId=" + ev.id + "&startDate=" + startdate + "&endDate=" + enddate + "&text=" + encodeURI(ev.text);
	$.get(url); 
}

function delEvent(eventId){
	var url = "";
	url = "event.do?method=delEvent&eventId=" + eventId;
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

