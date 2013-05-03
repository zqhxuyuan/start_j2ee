package com.xuyuan.j2ee.ioc_aop.test;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.xuyuan.j2ee.ioc_aop.ConfigManager;

public class Driver {

	@SuppressWarnings("rawtypes")
	public static void main(String[] args) {
		// 解析IOC配置文件
		ConfigManager configManager = new ConfigManager("com/xuyuan/j2ee/ioc_aop/test/config.xml");
		// 获取id为“bean”的Bean
		TestIOCBean beanTest = (TestIOCBean) configManager.getBean("bean");
		System.out.println(beanTest.getA() + ":" + beanTest.getAa() + ":"
				+ beanTest.getB());

		System.out.println(beanTest.getInnerBean().getB());
		System.out.println(beanTest.getInnerBean().getOutterBean().getB());

		String string = (String) configManager.getBean("str1");
		System.out.println(string);

		string = (String) configManager.getBean("str2");
		System.out.println(string);

		// 装配集合测试
		List<String> list = (List<String>) beanTest.getCollection();
		System.out.println(list.get(0));

		Set<String> set = (Set<String>) beanTest.getInnerBean().getCollection();
		for (Iterator it = set.iterator(); it.hasNext();) {
			System.out.println("value=" + it.next().toString());
		}

		TestIOCBean outterBeanTest = (TestIOCBean) configManager
				.getBean("outterBean");
		System.out.println(outterBeanTest.getMap().get("s1"));
		System.out.println(outterBeanTest.getProps().get("s3"));

		//测试构造函数注入
		TestIOCBean constructorBeanTest = (TestIOCBean) configManager
				.getBean("constructorInit");
		System.out.println(constructorBeanTest.getA()
				+ constructorBeanTest.getB()
				+ constructorBeanTest.getOutterBean().getAa());

		//测试AOP功能
		System.out.println("\n***************** AOP测试 *****************");
		ITestAOPBean testBean = (ITestAOPBean) configManager.getBean("shoutBean");
		testBean.shout();
	}
}