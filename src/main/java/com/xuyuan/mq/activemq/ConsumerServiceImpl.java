package com.xuyuan.mq.activemq;
import javax.jms.TextMessage;
import org.springframework.jms.core.JmsTemplate;

public class ConsumerServiceImpl {
	
	/**
	 * @uml.property  name="jmsTemplate"
	 * @uml.associationEnd  
	 */
	private JmsTemplate jmsTemplate;
	
	public ConsumerServiceImpl() {
	}
	
	public void receiveMotorist() throws Exception{
		TextMessage message  = (TextMessage)jmsTemplate.receive();
		System.out.println("接收消息:" + message.getText());
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
}