package com.xuyuan.j2ee.jms.post.jmstemplate;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MapMessage;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.support.JmsUtils;

import com.xuyuan.j2ee.jms.post.BackOffice;
import com.xuyuan.j2ee.jms.post.Mail;

public class BackOfficeImpl implements BackOffice { 
	 
    /**
	 * @uml.property  name="jmsTemplate"
	 * @uml.associationEnd  
	 */
    private JmsTemplate jmsTemplate; 
//    private Destination destination; 
 
    /**
	 * @param jmsTemplate
	 * @uml.property  name="jmsTemplate"
	 */
    public void setJmsTemplate(JmsTemplate jmsTemplate) { 
        this.jmsTemplate = jmsTemplate; 
    }
    
//    public void setDestination(Destination destination) { 
//        this.destination = destination; 
//    } 
 
    public Mail receiveMail() { 
//        MapMessage message = (MapMessage) jmsTemplate.receive(destination); 
        MapMessage message = (MapMessage) jmsTemplate.receive(); 
        try { 
            if (message == null) return null; 
            Mail mail = new Mail(); 
            mail.setMailId(message.getString("mailId")); 
            mail.setCountry(message.getString("country")); 
            mail.setWeight(message.getDouble("weight")); 
            return mail; 
        } catch (JMSException e) { 
            throw JmsUtils.convertJmsAccessException(e); 
        } 
    }
}
