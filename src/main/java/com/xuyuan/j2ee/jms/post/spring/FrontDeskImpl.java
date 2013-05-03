package com.xuyuan.j2ee.jms.post.spring;

import org.springframework.jms.core.support.JmsGatewaySupport;

import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.j2ee.jms.post.FrontDesk;
import com.xuyuan.j2ee.jms.post.Mail;


public class FrontDeskImpl extends JmsGatewaySupport implements FrontDesk {
    @Transactional
    public void sendMail(final Mail mail) {
        getJmsTemplate().convertAndSend(mail);
    }
}
