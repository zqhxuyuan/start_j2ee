package com.xuyuan.spring3.recipes.aopaspectj.t7;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.DeclareParents;

import com.xuyuan.spring3.recipes.aopaspectj.t8.Counter;
import com.xuyuan.spring3.recipes.aopaspectj.t8.CounterImpl;


/**
 * 3-7. Introducing Behaviors to Your Beans
Sometimes, you may have a group of classes that share a common behavior. 
In OOP, they must extend the same base class or implement the same interface. 
This issue is actually a crosscutting concern(横切性关注点) that can be modularized with AOP. 

3-8. Introducing States to Your Beans
Sometimes, you may want to add new states to a group of existing objects to keep track of their usage, 
such as the calling count(CounterImpl就是这么用的), the last modified date, and  so on. 
It should not be a problem if all the objects have the same base class. 
However, it’s difficult for you to add such states to different classes 
if they are not in the same class hierarchy.

You can introduce a new interface to your objects with an implementation class that holds the state field. 
Then, you can write another advice to change the state according to a particular condition. 
 */
@Aspect
public class CalculatorIntroduction {

    /**
	 * @uml.property  name="maxCalculator"
	 * @uml.associationEnd  readOnly="true"
	 */
    @DeclareParents(
        value = "com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculatorImpl",
        defaultImpl = MaxCalculatorImpl.class)
    public MaxCalculator maxCalculator;

    /**
	 * @uml.property  name="minCalculator"
	 * @uml.associationEnd  readOnly="true"
	 */
    @DeclareParents(
        value = "com.xuyuan.spring3.recipes.aopaspectj.t1.ArithmeticCalculatorImpl",
        defaultImpl = MinCalculatorImpl.class)
    public MinCalculator minCalculator;

    //3-8. Introducing States to Your Beans
    /**
	 * @uml.property  name="counter"
	 * @uml.associationEnd  readOnly="true"
	 */
    @DeclareParents(
        value = "com.xuyuan.spring3.recipes.aopaspectj.t1.*CalculatorImpl",
        defaultImpl = CounterImpl.class)
    public Counter counter;

    @After("execution(* com.xuyuan.spring3.recipes.aopaspectj.t1.*Calculator.*(..)) && this(counter)")
    public void increaseCount(Counter counter) {
        counter.increase();
    }
}
