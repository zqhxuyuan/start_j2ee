package com.xuyuan.spring3.recipes.ws;

import java.net.MalformedURLException;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.caucho.hessian.client.HessianProxyFactory;

/**
 * 测试类时，需要启动Tomcat
 */
public class Client {

	/**
	 * http://localhost:8888/start_j2ee/services/WeatherService
	 */
	@Test
	public void testHessianByProgram() throws MalformedURLException {
		String url = "http://localhost:8888/start_j2ee/services/WeatherService";   
        HessianProxyFactory factory = new HessianProxyFactory();   
        WeatherService service = (WeatherService) factory.create(WeatherService.class, url);
        service.hello();
	}
	
	@Test
	public void testHessianBySpring(){
		ApplicationContext context = new ClassPathXmlApplicationContext("client.xml");
		WeatherService service = (WeatherService) context.getBean("weatherService");
		service.hello();
	}
	
	@Test
	public void testByHttpInvoker(){
		ApplicationContext context = new ClassPathXmlApplicationContext("client.xml");
		WeatherService service = (WeatherService) context.getBean("weatherService2");
		service.hello();
	}
	
	@Test
	public void testCXF(){
		ApplicationContext context = new ClassPathXmlApplicationContext("client.xml");
		com.xuyuan.spring3.recipes.ws.cxf.WeatherService service = 
			(com.xuyuan.spring3.recipes.ws.cxf.WeatherService) context.getBean("weatherService3");
		service.hello();
	}
}
