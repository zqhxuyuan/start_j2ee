package com.xuyuan.j2ee.jms.post.spring;

import org.springframework.jms.core.support.JmsGatewaySupport;

import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.j2ee.jms.post.BackOffice;
import com.xuyuan.j2ee.jms.post.Mail;


public class BackOfficeImpl extends JmsGatewaySupport implements BackOffice {
    @Transactional
    public Mail receiveMail() {
        return (Mail) getJmsTemplate().receiveAndConvert();
    }
}
