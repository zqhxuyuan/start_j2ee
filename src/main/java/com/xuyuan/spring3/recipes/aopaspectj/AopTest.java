package com.xuyuan.spring3.recipes.aopaspectj;

import java.io.IOException;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t1.UnitCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t7.MaxCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t7.MinCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t8.Counter;

public class AopTest {

	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	ApplicationContext context; 
	
	@Before
	public void setUp() {
		//AspectJ Annotation
		context = new ClassPathXmlApplicationContext("spring/3/beans.xml");
		//XML Config
		//context = new ClassPathXmlApplicationContext("spring/3/beans2.xml");
	}
	
	@Test
    public void test01() {
		ArithmeticCalculator arithmeticCalculator = (ArithmeticCalculator) context.getBean("arithmeticCalculator");
        arithmeticCalculator.add(1, 2);
        arithmeticCalculator.sub(4, 3);
        arithmeticCalculator.mul(2, 3);
        arithmeticCalculator.div(4, 2);
        arithmeticCalculator.test();
        
        UnitCalculator unitCalculator = (UnitCalculator) context.getBean("unitCalculator");
        unitCalculator.kilogramToPound(10);
        unitCalculator.kilometerToMile(5);
        
        //3-4. Specifying Aspect Precedence
        //arithmeticCalculator.add(1, -2); //CalculatorValidationAspect抛出异常
        
        //3-7. Introducing Behaviors to Your Beans
        MaxCalculator maxCalculator = (MaxCalculator) arithmeticCalculator;
        maxCalculator.max(1, 2);

        MinCalculator minCalculator = (MinCalculator) arithmeticCalculator;
        minCalculator.min(1, 2);
        
        //3-8. Introducing States to Your Beans
        arithmeticCalculator.test(); //5+1
        Counter arithmeticCounter = (Counter) arithmeticCalculator;
        System.out.println(arithmeticCounter.getCount()); //调用了几次方法：6

        Counter unitCounter = (Counter) unitCalculator;
        System.out.println(unitCounter.getCount());
	}
	
	@Test
	public void test02() throws IOException {
	      
	}
	
	@Test
	public void test03() throws IOException {

	}
	
	@Test
	public void test04() throws IOException {

	}
	
}
