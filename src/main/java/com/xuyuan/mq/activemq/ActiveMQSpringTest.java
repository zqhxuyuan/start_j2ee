package com.xuyuan.mq.activemq;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * http://blog.csdn.net/xueyepiaoling/article/details/6321100
 * 
 */
public class ActiveMQSpringTest {
 
	@Test
	public void testProducer(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext_activemq.xml");
        ProducerServiceImpl service = (ProducerServiceImpl) context.getBean("producerService");  
        service.sendMotoristInfo();  
        System.out.println("启动生产者 ...");  
	}
	
	//@Test
	public void testConsumer(){
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext_activemq.xml");
        ConsumerServiceImpl service = (ConsumerServiceImpl) context.getBean("consumerService");  
        System.out.println("启动消费者 ...");  
        try {  
            service.receiveMotorist();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
	}
}
