package com.xuyuan.j2ee.jms.activemq;

import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;

/**
 * selector是一个字符串，用来过滤消息。这种方式可以创建一个可以只接收特定消息的一个消费者,消息消费者只会取走它自己感兴趣的消息。
 * Selector的格式可以用来比较消息头信息和属性。
 */
public class JMSSelectorTest {

	public static void main(String[] args) throws Exception {
		ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost");
		Connection connection = factory.createConnection();
		connection.start();
		Queue queue = new ActiveMQQueue("testQueue");
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

		MessageConsumer comsumerA = session.createConsumer(queue, "receiver = 'A'");
		comsumerA.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println("ConsumerA get " + ((TextMessage) m).getText());
				} catch (JMSException e1) {
				}
			}
		});
		MessageConsumer comsumerB = session.createConsumer(queue, "receiver = 'B'");
		comsumerB.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println("ConsumerB get " + ((TextMessage) m).getText());
				} catch (JMSException e) {
				}
			}
		});
		
		MessageProducer producer = session.createProducer(queue);
		for (int i = 0; i < 10; i++) {
			String receiver = (i % 3 == 0 ? "A" : "B");
			TextMessage message = session.createTextMessage("Message" + i + ", receiver:" + receiver);
			message.setStringProperty("receiver", receiver);
			producer.send(message);
		}
	}
}
