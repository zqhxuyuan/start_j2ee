package com.xuyuan.j2ee.jms.activemq;

import javax.jms.*;
import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQQueue;

/**
 * JMSCorrelationID主要是用来关联多个Message，例如需要回复一个消息的时候，通常把回复的消息的JMSCorrelationID设置为原来消息的ID。
 * 生产者A给消费者A发送一个消息，同时需要消费者A给它回复一个消息。
 */
public class JMSCorrelationIDTest {
	/**
	 * @uml.property  name="queue"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Queue queue;
	/**
	 * @uml.property  name="session"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Session session;

	public JMSCorrelationIDTest() throws JMSException {
		ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost");
		Connection connection = factory.createConnection();
		connection.start();
		queue = new ActiveMQQueue("testQueue");
		session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		setupConsumer("ConsumerA");
		setupConsumer("ConsumerB");
		setupConsumer("ConsumerC");
		setupProducer("ProducerA", "ConsumerA");
		setupProducer("ProducerB", "ConsumerB");
		setupProducer("ProducerC", "ConsumerC");
	}

	private void setupConsumer(final String name) throws JMSException {
		// 创建一个消费者，它只接受属于它自己的消息
		MessageConsumer consumer = session.createConsumer(queue, "receiver='" + name + "'");
		consumer.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println(name + " get:" + ((TextMessage) m).getText());
					// 回复一个消息（此时作为主动方，当做生产者）
					MessageProducer producer = session.createProducer(queue);
					Message replyMessage = session.createTextMessage("Reply from " + name);
					replyMessage.setJMSCorrelationID(m.getJMSMessageID()); // 设置JMSCorrelationID为刚才收到的消息的ID
					producer.send(replyMessage);
				} catch (JMSException e) {
				}
			}
		});
	}

	private void setupProducer(final String name, String consumerName) throws JMSException {
		MessageProducer producer = session.createProducer(queue);
		producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
		// 创建一个消息，并设置一个属性receiver，为消费者的名字。
		Message message = session.createTextMessage("Message from " + name);
		message.setStringProperty("receiver", consumerName);
		producer.send(message);
		// 等待回复的消息
		MessageConsumer replyConsumer = session.createConsumer(queue, "JMSCorrelationID='" + message.getJMSMessageID() + "'");
		replyConsumer.setMessageListener(new MessageListener() {
			public void onMessage(Message m) {
				try {
					System.out.println(name + " get reply:" + ((TextMessage) m).getText());
				} catch (JMSException e) {
				}
			}
		});
	}

	public static void main(String[] args) throws Exception {
		new JMSCorrelationIDTest();
	}
}
