package com.xuyuan.j2ee.jms.activemq;

import javax.jms.*; 
import org.apache.activemq.ActiveMQConnectionFactory; 
import org.apache.activemq.command.ActiveMQQueue;

public class TemporaryQueueTest {
	
    public static void main(String[] args) throws Exception { 
        ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("vm://localhost"); 
        Connection connection = factory.createConnection(); 
        connection.start(); 
        Queue queue = new ActiveMQQueue("testQueue2"); 
        final Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        
        //使用session创建一个TemporaryQueue。 
        TemporaryQueue replyQueue = session.createTemporaryQueue(); 
        //接收消息，并回复到指定的Queue中（即replyQueue） 
        MessageConsumer comsumer = session.createConsumer(queue); 
        comsumer.setMessageListener(new MessageListener(){ 
            public void onMessage(Message m) { 
                try { 
                    System.out.println("Get Message: " + ((TextMessage)m).getText()); 
                    MessageProducer producer = session.createProducer(m.getJMSReplyTo()); 
                    producer.send(session.createTextMessage("ReplyMessage")); 
                } catch (JMSException e) { } 
            } 
        }); 
        
        //使用同一个Connection创建另一个Session，来读取replyQueue上的消息。 
        Session session2 = connection.createSession(true, Session.AUTO_ACKNOWLEDGE); 
        MessageConsumer replyComsumer = session2.createConsumer(replyQueue); 
        replyComsumer.setMessageListener(new MessageListener(){ 
            public void onMessage(Message m) { 
                try { 
                    System.out.println("Get reply: " + ((TextMessage)m).getText()); 
                } catch (JMSException e) { } 
            } 
        }); 
        MessageProducer producer = session.createProducer(queue); 
        TextMessage message = session.createTextMessage("SimpleMessage"); 
        message.setJMSReplyTo(replyQueue); 
        producer.send(message); 
    } 
} 
