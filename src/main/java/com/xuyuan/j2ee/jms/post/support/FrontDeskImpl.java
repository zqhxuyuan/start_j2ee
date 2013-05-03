package com.xuyuan.j2ee.jms.post.support;

import java.util.HashMap;
import java.util.Map;

import org.springframework.jms.core.support.JmsGatewaySupport;

import com.xuyuan.j2ee.jms.post.FrontDesk;
import com.xuyuan.j2ee.jms.post.Mail;

public class FrontDeskImpl extends JmsGatewaySupport implements FrontDesk { 
    public void sendMail(Mail mail) { 
        Map<String, Object> map = new HashMap<String, Object>(); 
        map.put("mailId", mail.getMailId()); 
        map.put("country", mail.getCountry()); 
        map.put("weight", mail.getWeight()); 
        getJmsTemplate().convertAndSend(map); 
    } 
}