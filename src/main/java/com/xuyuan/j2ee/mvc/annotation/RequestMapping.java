package com.xuyuan.j2ee.mvc.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
@Target(ElementType.METHOD) 
@Retention(RetentionPolicy.RUNTIME)  
@Documented  
@Inherited  
public @interface RequestMapping {

	public String value() default "";
}
