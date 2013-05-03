package com.xuyuan.j2ee.jms.activemq;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
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
 * 0. 直接运行类，不需要启动ActiveMQ
 * 
 * 运行后，可以使用jconsole，连接本地进程，或者使用远程进程：service:jmx:rmi:///jndi/rmi://localhost:1099/jmxrmi
 * 在MBean--org.apache.activemq--localhost--Queue--testQueue的操作中
 * 修改sendTextMessage (body String)中String的参数值，点击方法按钮，相当于发送了一个消息到队列中
 * 如果消费者采用监听器的方式，就可以接收到这个消息。如果采用阻塞模式，则无法接受到该消息
 * 
 * 也可以对Broker进行操作，比如removeQueue("testQueue")，addQueue("testQueue")
 * 其他对比如Subscription，Topic的操作是没有反应的，因为这个例子中建立的是Queue对象
 */
public class A_MessageSendAndReceive {

	public static void main(String[] args) throws Exception {
		ConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost");
		Connection connection = factory.createConnection();
		connection.start();
		
		// 创建一个消息队列。生产者和消费者都在这个队列上操作
		Queue queue = new ActiveMQQueue("testQueue");
		
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		Message message = session.createTextMessage("Hello JMS!");
		
		//创建生产者，发送消息到队列中
		MessageProducer producer = session.createProducer(queue);
		producer.send(message);
		System.out.println("Send Message Completed!");
		
		//创建消费者，从队列中取出消息
		MessageConsumer comsumer = session.createConsumer(queue);
		
		//消息的消费者接收消息:阻塞
		/**
		Message recvMessage = comsumer.receive();
		System.out.println(((TextMessage) recvMessage).getText());
		*/
		
		//消息的消费者注册监听器，以监听器方式监听消息队列中的消息。当消息队列中有消息，则消费者就会接收到该消息
        comsumer.setMessageListener(new MessageListener(){ 
            @Override 
            public void onMessage(Message m) { 
                TextMessage textMsg = (TextMessage) m; 
                try { 
                    System.out.println(textMsg.getText()); 
                } catch (JMSException e) { 
                    e.printStackTrace(); 
                } 
            } 
        });
	}

}
