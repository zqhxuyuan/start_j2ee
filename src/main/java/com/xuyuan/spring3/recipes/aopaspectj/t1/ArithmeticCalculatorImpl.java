package com.xuyuan.spring3.recipes.aopaspectj.t1;

import com.xuyuan.spring3.recipes.aopaspectj.t6.LoggingRequired;

/**
 * 3-6. Writing AspectJ Pointcut Expressions
 * 使用注解方式。需要开启@LoggingRequired注解。
 * 
 * 类上使用注解：@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t6.LoggingRequired)")
 * 方法上使用时：@Pointcut("@annotation(com.xuyuan.spring3.recipes.aopaspectj.t6.LoggingRequired)")
 */
//@LoggingRequired
public class ArithmeticCalculatorImpl implements ArithmeticCalculator {

	@LoggingRequired
    public double add(double a, double b) {
        double result = a + b;
        System.out.println(a + " + " + b + " = " + result);
        return result;
    }

	@LoggingRequired
    public double sub(double a, double b) {
        double result = a - b;
        System.out.println(a + " - " + b + " = " + result);
        return result;
    }

	@LoggingRequired
    public double mul(double a, double b) {
        double result = a * b;
        System.out.println(a + " * " + b + " = " + result);
        return result;
    }

	@LoggingRequired
    public double div(double a, double b) {
        if (b == 0) {
            throw new IllegalArgumentException("Division by zero");
        }
        double result = a / b;
        System.out.println(a + " / " + b + " = " + result);
        return result;
    }
    
	@LoggingRequired
    public void test(){
    	System.out.println("just test,no return...");
    }
}
