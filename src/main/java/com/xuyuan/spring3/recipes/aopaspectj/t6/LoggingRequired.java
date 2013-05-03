package com.xuyuan.spring3.recipes.aopaspectj.t6;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 3-6. Writing AspectJ Pointcut Expressions
 * 
 * Although the AspectJ pointcut language is powerful in matching various join points, sometimes, 
 * you may not be able to find any common characteristics (e.g., modifiers, return types, method name patterns, or arguments) 
 * for the methods you would like to match. In such cases, you can consider providing a custom annotation for them.
 * 
 * 1. 定义注解
 * 2. 在需要的业务类（注意是实现类，不是接口）的方法上添加该注解（见t1.ArithmeticCalculatorImpl）
 * 3. 在Aspect的PointCut表达式使用该注解来匹配（见t5.CalculatorPointcuts）
 * 4. 在XML配置文件定义Aspect
 */
@Target( { ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LoggingRequired {
}
