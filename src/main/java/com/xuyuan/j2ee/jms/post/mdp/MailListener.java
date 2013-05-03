package com.xuyuan.j2ee.jms.post.mdp;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.springframework.jms.support.JmsUtils;

import com.xuyuan.j2ee.jms.post.Mail;

// 或者采用匿名类的方式，比如com.xuyuan.j2ee.jms.activemq.MessageSendAndReceive
// Listening for JMS Messages with Message Listeners
public class MailListener implements MessageListener { 
 
    public void onMessage(Message message) { 
        MapMessage mapMessage = (MapMessage) message; 
        try { 
            Mail mail = new Mail(); 
            mail.setMailId(mapMessage.getString("mailId")); 
            mail.setCountry(mapMessage.getString("country")); 
            mail.setWeight(mapMessage.getDouble("weight")); 
            displayMail(mail); 
        } catch (JMSException e) { 
            throw JmsUtils.convertJmsAccessException(e); 
        } 
    } 
 
    private void displayMail(Mail mail) { 
        System.out.println("Mail #" + mail.getMailId() + " received"); 
    } 
}
