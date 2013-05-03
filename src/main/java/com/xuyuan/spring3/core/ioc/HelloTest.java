package com.xuyuan.spring3.core.ioc;

import java.io.File;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;

import com.xuyuan.spring3.core.ioc.bean.Hello;
import com.xuyuan.spring3.core.ioc.bean.IHello;
import com.xuyuan.spring3.core.ioc.di.BeanDefinition;
import com.xuyuan.spring3.core.ioc.di.DefaultBeanFactory;

public class HelloTest {

	/**
	 * @uml.property  name="configFilePath"
	 */
	private String configFilePath = "spring/beans.xml";
	
	@Test
	public void test01_GetBeanFromNew(){
		IHello hello = new Hello();
		hello.hello();
	}
	
	/**
	 * 1、读取配置文件实例化一个IoC容器
	 * 2、从容器中获取Bean
	 * 3、执行业务逻辑 
	 */
	@Test
	public void test02_GetBeanFromAC() {
		ApplicationContext context = new ClassPathXmlApplicationContext(configFilePath);
		IHello hello = context.getBean("spring_ioc_hello", IHello.class); //同时指定id和name,name作为别名
		hello.hello();
		
		//hello = context.getBean(IHello.class); //配置文件不需要指定id
		//hello.hello();
	}
	
	public void test03_GetBeanFactory(){
		//ClassPathXmlApplicationContext
		BeanFactory 
		beanFactory = new ClassPathXmlApplicationContext(configFilePath);
		
		//FileSystemXmlApplicationContext
		beanFactory = new FileSystemXmlApplicationContext("D:/../beans.xml");
		
		//XmlBeanFactory
		beanFactory = new XmlBeanFactory(new FileSystemResource(new File("D:/../beans.xml")));
		beanFactory = new XmlBeanFactory(new ClassPathResource(configFilePath));
	}

	//对于单例Bean每次应该返回相同的Bean,返回true
	//1.创建Bean工厂
	//2.创建原型 Bean定义
	@Test
	public void test04_Singleton () throws Exception {
		DefaultBeanFactory bf = new DefaultBeanFactory();
		BeanDefinition bd = new BeanDefinition();
		bd.setId("bean");
		bd.setClazz(Hello.class.getName());
		bf.registerBeanDefinition(bd);
		System.out.println(bf.getBean("bean") == bf.getBean("bean"));
	}

	//对于原型Bean每次应该返回一个全新的Bean,返回false
	@Test
	public void test04_Prototype () throws Exception {
		DefaultBeanFactory bf = new DefaultBeanFactory();
		BeanDefinition bd = new BeanDefinition();
		bd.setId("bean");
		bd.setScope(BeanDefinition.SCOPE_PROTOTYPE);
		bd.setClazz(Hello.class.getName());
		bf.registerBeanDefinition(bd);
		System.out.println(bf.getBean("bean") == bf.getBean("bean"));
	}

	//在同一线程中两次获取的Bean应该是相等的
	@Test
	public void test05_ScopeSingleThread() {
		BeanFactory beanFactory = new ClassPathXmlApplicationContext(configFilePath);
		Hello bean1 = beanFactory.getBean("spring_scope_thread", Hello.class);
	    Hello bean2 = beanFactory.getBean("spring_scope_thread", Hello.class);
		Assert.assertEquals(bean1, bean2);
	}    
	
	//在两个线程中两次获取的Bean应该是不相等的
	@Test
	public void test06_ScopeTwoThread() throws InterruptedException {
		final BeanFactory beanFactory = new ClassPathXmlApplicationContext(configFilePath);
		final Hello[] beans = new Hello[2];
		Thread thread1 = new Thread() {
		    public void run() {
		       beans[0] = beanFactory.getBean("spring_scope_thread", Hello.class);
		    }
		};
		Thread thread2 = new Thread() {
		   public void run() {
			   beans[1] = beanFactory.getBean("spring_scope_thread", Hello.class);
		   }
		};
		thread1.start();
		thread1.sleep(1000);
		thread2.start();
		thread2.sleep(1000);
		Assert.assertNotSame(beans[0], beans[1]);
	}    

}
