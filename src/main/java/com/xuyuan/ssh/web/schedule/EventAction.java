package com.xuyuan.ssh.web.schedule;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.xuyuan.ssh.common.web.StrutsAction;
import com.xuyuan.ssh.entity.schedule.Event;
import com.xuyuan.ssh.service.schedule.EventManager;

//@Results({
//	@Result(name=StrutsAction.RELOAD,location="null",type=StrutsAction.REDIRECT)
//})
public class EventAction extends StrutsAction<Event>{

	/**
	 * @uml.property  name="eventManager"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private EventManager eventManager;
//	private Event event;
//	public Event getEvent() {
//		return event;
//	}
//	public void setEvent(Event event) {
//		this.event = event;
//	}
	
	
	public String list() throws Exception{
		String strb = eventManager.getAllEvent();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().print(strb.toString());
		return null;
	}
	
//	public String save() throws Exception{
//		eventManager.addOrUpdate(event);
//		return null;
//	}
//	
//	public String delete() throws Exception{
//		eventManager.delete(event.getEventId());
//		return null;
//	}
//
	
	public String addOrUpdateEvent() throws Exception {
//		if(event == null){
//			event = new Event();
//		}
		Event event = new Event();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String text = request.getParameter("text");
		String eventId = request.getParameter("eventId");
		
		event.setEventId(eventId);
		event.setStartDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(startDate));
		event.setEndDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(endDate));
		event.setText(text);
		
		eventManager.addOrUpdate(event);
		return null;
	}
	
	public String delEvent() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String eventId = request.getParameter("eventId");
		eventManager.delete(eventId);
		return null;
	}
	
	public String findEventById() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String eventId = request.getParameter("eventId");
		eventManager.findEventById(eventId);
		return null;
	}
}
