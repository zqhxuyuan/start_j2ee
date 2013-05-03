package com.xuyuan.mq.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;

/**
 * http://lavasoft.blog.51cto.com/62575/190815
 * 
 * http://localhost:8161/admin/
 * @author Administrator
 *
 */
public class QueueSend {
	private static final int SEND_NUMBER = 5;

	public static void main(String[] args) {
		
		ConnectionFactory connectionFactory;	// ConnectionFactory ：连接工厂，JMS 用它创建连接
		Connection connection = null;			// Connection ：JMS 客户端到JMS Provider 的连接
		Session session;						// Session： 一个发送或接收消息的线程
		Destination destination;				// Destination ：消息的目的地;消息发送给谁.
		MessageProducer producer;				// MessageProducer：消息发送者
		
		connectionFactory = new ActiveMQConnectionFactory(
				ActiveMQConnection.DEFAULT_USER,
				ActiveMQConnection.DEFAULT_PASSWORD, "tcp://localhost:61616");

		try {
			connection = connectionFactory.createConnection(); // 构造从工厂得到连接对象
			connection.start(); // 启动
			session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE); // 获取操作连接
			destination = session.createQueue("queue1"); 
			producer = session.createProducer(destination); // 得到消息生成者
			producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);	// 设置不持久化
			sendMessage(session, producer);	// 构造消息，此处写死，项目就是参数，或者方法获取
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != connection)
					connection.close();
			} catch (Throwable ignore) {
			}
		}
	}

	public static void sendMessage(Session session, MessageProducer producer) throws Exception {
		for (int i = 1; i <= SEND_NUMBER; i++) {
			TextMessage message = session.createTextMessage("ActiveMq 发送的消息" + i);
			System.out.println("发送消息:" + i + "成功");  
			producer.send(message); // 发送消息到目的地方
		}
	}
}
