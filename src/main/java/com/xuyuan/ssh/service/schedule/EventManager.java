package com.xuyuan.ssh.service.schedule;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuyuan.ssh.dao.schedule.EventDao;
import com.xuyuan.ssh.entity.schedule.Event;

@Service
public class EventManager {

	/**
	 * @uml.property  name="eventDao"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private EventDao eventDao;
	
	public String getAllEvent(){
		List<Event> eventList = eventDao.getAll();
		
		StringBuffer strb = new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strb.append("<data>");
		for (Iterator iter = eventList.iterator(); iter.hasNext();) {
			Event event = (Event)iter.next();
			strb.append("<event id=\"" + event.getEventId() + "\">");
			strb.append("<start_date><![CDATA[" + sdf.format(event.getStartDate()) + "]]></start_date>");
			strb.append("<end_date><![CDATA[" + sdf.format(event.getEndDate()) + "]]></end_date>");
			strb.append("<text><![CDATA[" + event.getText() + "]]></text>");
			strb.append("<details><![CDATA[" + event.getDetails() + "]]></details>");
			strb.append("</event>");
		}
		strb.append("</data>");
		return strb.toString();
	}

	public void addOrUpdate(Event event) {
		Event find = this.findEventById(event.getEventId());
		System.out.println("EventId:" + event.getEventId());
		if(null == find){
			System.out.println("save...................");
			eventDao.save(event);
		}else{
			System.out.println("update...................");
			eventDao.update(event);
		}
	}

	public void delete(String eventid) {
		eventDao.delete(eventid);
	}

	public Event findEventById(String eventId) {
		return eventDao.get(eventId);
	}
}
