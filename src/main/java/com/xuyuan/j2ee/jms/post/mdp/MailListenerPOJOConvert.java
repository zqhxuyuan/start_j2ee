package com.xuyuan.j2ee.jms.post.mdp;

import com.xuyuan.j2ee.jms.post.Mail;

//Converting JMS Messages
public class MailListenerPOJOConvert { 
 
	public void handleMessage(Mail mail) { 
        System.out.println("Mail #" + mail.getMailId() + " received"); 
    }
}
