package com.xuyuan.j2ee.jms.post.convert;

import org.springframework.jms.core.support.JmsGatewaySupport;

import com.xuyuan.j2ee.jms.post.FrontDesk;
import com.xuyuan.j2ee.jms.post.Mail;

public class FrontDeskImpl extends JmsGatewaySupport implements FrontDesk { 
    public void sendMail(Mail mail) { 
        getJmsTemplate().convertAndSend(mail); 
    } 
}