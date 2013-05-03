package com.xuyuan.spring3.recipes.beanconfig;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.beanconfig.t14.SequenceService;
import com.xuyuan.spring3.recipes.beanconfig.t2.SequenceGenerator;
import com.xuyuan.spring3.recipes.beanconfig.t3.Product;

public class BeanConfigTest {

	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	ApplicationContext context; 
	
	@Before
	public void setUp() {
		context = new ClassPathXmlApplicationContext("spring/1/beans.xml");
	}
	
	@Test
    public void test02_ConfigBean() {
        SequenceGenerator generator = (SequenceGenerator) context.getBean("sequenceGenerator");
        System.out.println(generator.getSequence());
        System.out.println(generator.getSequence());
        
//        //List
//        generator = (SequenceGenerator) context.getBean("sequenceGenerator3");
//        System.out.println(generator.getSequence1());
//        System.out.println(generator.getSequence1());
//        //Map
//        generator = (SequenceGenerator) context.getBean("sequenceGenerator4");
//        System.out.println(generator.getSequence2());
//        System.out.println(generator.getSequence2());
//        //Properties
//        generator = (SequenceGenerator) context.getBean("sequenceGenerator5");
//        System.out.println(generator.getSequence3());
//        System.out.println(generator.getSequence3());
        
        //1-5. Specifying Bean References
        generator = (SequenceGenerator) context.getBean("sequenceGenerator6");
        System.out.println(generator.getSequence4());
        System.out.println(generator.getSequence4());
        
        //1-11. Auto-Wiring Beans with XML Configuration
//        generator = (SequenceGenerator) context.getBean("sequenceGenerator15");
//        System.out.println(generator.getSequence4());
//        System.out.println(generator.getSequence4());
        
    }
    
	@Test
    public void test03_CreateBean(){
		//1-3. Creating Beans by Invoking a Constructor
		/**
		Battery aaa = new Battery(); 
		aaa.setName("AAA"); 
		aaa.setPrice(2.5); 
		aaa.setRechargeable(true); 
		 
		Disc cdrw = new Disc("CD-RW", 1.5); 
		cdrw.setCapacity(700); 
		*/
    	Product aaa = (Product) context.getBean("aaa"); 
        Product cdrw = (Product) context.getBean("cdrw"); 
        System.out.println(aaa); 
        System.out.println(cdrw); 
        
        //1-7. Creating Beans Using Spring’s FactoryBean
        /**
        DiscountFactoryBean aaa = new DiscountFactoryBean(); 
        aaa.setProduct(new Battery("AAA", 2.5)); 
        aaa.setDiscount(0.2); 
        Product aaa = (Product) aaa.createInstance();
        */ 
        aaa = (Product) context.getBean("bbb"); 
        cdrw = (Product) context.getBean("ccc"); 
        System.out.println(aaa); 
        System.out.println(cdrw); 
    }
	
	@Test
    public void test04_AutoWire() {
		context = new ClassPathXmlApplicationContext("spring/1/beans1.xml");
        SequenceGenerator generator = (SequenceGenerator) context.getBean("sequenceGenerator");
        System.out.println(generator.getSequence4());
        System.out.println(generator.getSequence4());
	}
	
	@Test
	public void test05_ComponentScan() {
		context = new ClassPathXmlApplicationContext("spring/1/beans1.xml");
		SequenceService service = (SequenceService)context.getBean("sequenceService");
		service.generate("IT");
		service.generate("IT");
	}
}
