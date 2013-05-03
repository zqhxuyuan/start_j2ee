package com.xuyuan.spring3.recipes.aopaspectj.t5;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 3-5. Reusing Pointcut Definitions
 * 将PointCut抽取出来。这样可以复用。
 */
@Aspect
public class CalculatorPointcuts {

	//1.Method Signature
	//@Pointcut("execution(* com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculator.*(..)) ")
	//@Pointcut("@annotation(com.xuyuan.spring3.recipes.aopaspectj.t6.LoggingRequired)") //annotation->method
	
	//2.Type Signature
	//@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t1.*)")	//package
	//@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj..*)")		//package and subpackages
	//@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t6.LoggingRequired)")	//annotation->class
    //@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculatorImpl)") //class
	@Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculator+)")	//interface
    public void arithmeticOperation() {}

    @Pointcut("within(com.xuyuan.spring3.recipes.aopaspectj.t1.UnitCalculator+)")
    public void unitOperation() {}

    @Pointcut("arithmeticOperation() || unitOperation()")
    public void loggingOperation() {}

    @Pointcut("execution(* *.*(..)) && target(target) && args(a,b)")
    public void parameterPointcut(Object target, double a, double b) {} 
}
