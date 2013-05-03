package com.xuyuan.mq.activemq;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class ProducerServiceImpl { //implements IRantzMarketingGateway {
	
	/**
	 * @uml.property  name="jmsTemplate"
	 * @uml.associationEnd  
	 */
	private JmsTemplate jmsTemplate;
	/**
	 * @uml.property  name="destination"
	 * @uml.associationEnd  
	 */
	private Destination destination;
	
	public void sendMotoristInfo(){
		jmsTemplate.send(
			destination,
			new MessageCreator(){
				public Message createMessage(Session session) throws JMSException {
					return session.createTextMessage("这是一个测试");
				}
			}
		);
		System.out.println("发送消息...");
	}
	
	/**
	 * @return
	 * @uml.property  name="jmsTemplate"
	 */
	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}
	/**
	 * @param jmsTemplate
	 * @uml.property  name="jmsTemplate"
	 */
	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}
	/**
	 * @return
	 * @uml.property  name="destination"
	 */
	public Destination getDestination() {
		return destination;
	}
	/**
	 * @param destination
	 * @uml.property  name="destination"
	 */
	public void setDestination(Destination destination) {
		this.destination = destination;
	}
}
