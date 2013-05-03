package com.xuyuan.j2ee.jms.post.mdp;

import java.util.Map;

import com.xuyuan.j2ee.jms.post.Mail;

// Listening for JMS Messages with POJOs
public class MailListenerPOJO { 
 
	public void displayMail(Map map) { 
        Mail mail = new Mail(); 
        mail.setMailId((String) map.get("mailId")); 
        mail.setCountry((String) map.get("country")); 
        mail.setWeight((Double) map.get("weight")); 
        System.out.println("Mail #" + mail.getMailId() + " received"); 
    } 
	
}
