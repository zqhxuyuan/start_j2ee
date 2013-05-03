package com.xuyuan.j2ee.jms.post.support;

import java.util.Map;

import org.springframework.jms.core.support.JmsGatewaySupport;

import com.xuyuan.j2ee.jms.post.BackOffice;
import com.xuyuan.j2ee.jms.post.Mail;

public class BackOfficeImpl extends JmsGatewaySupport implements BackOffice { 
    public Mail receiveMail() { 
        Map map = (Map) getJmsTemplate().receiveAndConvert(); 
        Mail mail = new Mail(); 
        mail.setMailId((String) map.get("mailId")); 
        mail.setCountry((String) map.get("country")); 
        mail.setWeight((Double) map.get("weight")); 
        return mail; 
    } 
}
