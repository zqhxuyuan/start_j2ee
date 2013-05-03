package com.xuyuan.j2ee.jms.post.convert;

import org.springframework.jms.core.support.JmsGatewaySupport;

import com.xuyuan.j2ee.jms.post.BackOffice;
import com.xuyuan.j2ee.jms.post.Mail;

public class BackOfficeImpl extends JmsGatewaySupport implements BackOffice { 
    public Mail receiveMail() { 
        return (Mail) getJmsTemplate().receiveAndConvert(); 
    } 
}