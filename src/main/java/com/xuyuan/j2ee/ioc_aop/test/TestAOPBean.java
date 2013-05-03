package com.xuyuan.j2ee.ioc_aop.test;

/*
 * 测试AOP功能
 * 用jdk动态代理实现，故必须继承接口
 */
public class TestAOPBean implements ITestAOPBean{
	/**
	 * @uml.property  name="name"
	 */
	private String name = "aop-test";

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int shout() {
		System.out.println("Hello, My name is "+name);
		return 1;
	}
}
