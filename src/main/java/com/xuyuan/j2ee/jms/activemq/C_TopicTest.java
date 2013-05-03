package com.xuyuan.j2ee.jms.activemq;

import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTopic;

//2.与Queue不同的是，Topic实现的是发布/订阅模型，在下面的例子中，启动2个消费者共同监听一个Topic，然后循环给这个Topic中发送多个消息
public class C_TopicTest {

	public static void main(String[] args) throws Exception {
		ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost");
		Connection connection = factory.createConnection();
		connection.start();
		
		// 创建一个Topic
		Topic topic = new ActiveMQTopic("testTopic");
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		
		// 注册消费者1
		MessageConsumer comsumer1 = session.createConsumer(topic);
		comsumer1.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println("Consumer1 get "
							+ ((TextMessage) m).getText());
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		});
		// 注册消费者2
		MessageConsumer comsumer2 = session.createConsumer(topic);
		comsumer2.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println("Consumer2 get "
							+ ((TextMessage) m).getText());
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		});
		
		// 创建一个生产者，然后发送多个消息。
		MessageProducer producer = session.createProducer(topic);
		for (int i = 0; i < 10; i++) {
			producer.send(session.createTextMessage("Message:" + i));
		}
	}

}
