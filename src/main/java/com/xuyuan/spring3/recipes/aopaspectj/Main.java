package com.xuyuan.spring3.recipes.aopaspectj;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t1.UnitCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t7.MaxCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t7.MinCalculator;
import com.xuyuan.spring3.recipes.aopaspectj.t8.Counter;

public class Main {

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/beans03_aopaspectj.xml");

        ArithmeticCalculator arithmeticCalculator = (ArithmeticCalculator) context.getBean("arithmeticCalculator");
        arithmeticCalculator.add(1, 2);
        arithmeticCalculator.sub(4, 3);
        arithmeticCalculator.mul(2, 3);
        arithmeticCalculator.div(4, 2);
        
        UnitCalculator unitCalculator = (UnitCalculator) context.getBean("unitCalculator");
        unitCalculator.kilogramToPound(10);
        unitCalculator.kilometerToMile(5);

        // Introduce behavior to beans
        MaxCalculator maxCalculator = (MaxCalculator) arithmeticCalculator;
        maxCalculator.max(1, 2);

        MinCalculator minCalculator = (MinCalculator) arithmeticCalculator;
        minCalculator.min(1, 2);

        // Introduce state to beans
        Counter arithmeticCounter = (Counter) arithmeticCalculator;
        System.out.println(arithmeticCounter.getCount());

        Counter unitCounter = (Counter) unitCalculator;
        System.out.println(unitCounter.getCount());

        // aspectj
//        ComplexCalculator complexCalculator = (ComplexCalculator) context.getBean("complexCalculator");
//        complexCalculator.add(new Complex(1, 2), new Complex(2, 3));
//        complexCalculator.sub(new Complex(5, 8), new Complex(2, 3));
    }
}
