package com.xuyuan.j2ee.jms.activemq;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;

//3.分别发送一个Persistent和nonpersistent的消息，然后关闭退出JMS
public class D_DeliveryModeSendTest {

	public static void main(String[] args) throws Exception {
		ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost");
		Connection connection = factory.createConnection();
		connection.start();
		Queue queue = new ActiveMQQueue("testQueue");
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		
		MessageProducer producer = session.createProducer(queue);
		
		// 设置发送模式为PERSISTENT
		producer.setDeliveryMode(DeliveryMode.PERSISTENT);
		producer.send(session.createTextMessage("A persistent Message"));
		
		// 设置模式为NON_PERSISTENT
		producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
		producer.send(session.createTextMessage("A non persistent Message"));
		
		System.out.println("Send messages sucessfully!");
	}
}
