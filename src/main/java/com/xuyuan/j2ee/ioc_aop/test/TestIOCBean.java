package com.xuyuan.j2ee.ioc_aop.test;

import java.util.Collection;
import java.util.Map;
import java.util.Properties;

/*
 * By Bingluo 2012.8.17
 * cose.seu.edu.cn
 * 测试Bean
 */
public class TestIOCBean {
	/**
	 * @uml.property  name="a"
	 */
	private int a;
	/**
	 * @uml.property  name="aa"
	 */
	private Integer aa;
	/**
	 * @uml.property  name="b"
	 */
	private String b;

	/**
	 * @uml.property  name="innerBean"
	 * @uml.associationEnd  
	 */
	private TestIOCBean innerBean;
	/**
	 * @uml.property  name="outterBean"
	 * @uml.associationEnd  
	 */
	private TestIOCBean outterBean;

	/**
	 * @uml.property  name="collection"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.String"
	 */
	private Collection<String> collection;
	/**
	 * @uml.property  name="map"
	 * @uml.associationEnd  qualifier="constant:java.lang.String java.lang.String"
	 */
	private Map<String, String> map;
	/**
	 * @uml.property  name="props"
	 * @uml.associationEnd  multiplicity="(0 -1)" ordering="true" elementType="java.lang.Object" qualifier="constant:java.lang.String java.lang.Object"
	 */
	private Properties props;

	public TestIOCBean(){

	}

	public TestIOCBean(int a,String b,TestIOCBean oBeanTest) {
		this.setA(a);
		this.setB(b);
		this.setOutterBean(oBeanTest);
	}

	public Integer getA() {
		return a;
	}

	/**
	 * @param a
	 * @uml.property  name="a"
	 */
	public void setA(int a){
		this.a = a;
	}

	/**
	 * @return
	 * @uml.property  name="aa"
	 */
	public Integer getAa() {
		return aa;
	}

	/**
	 * @param aa
	 * @uml.property  name="aa"
	 */
	public void setAa(Integer aa) {
		this.aa = aa;
	}

	/**
	 * @return
	 * @uml.property  name="b"
	 */
	public String getB() {
		return b;
	}

	/**
	 * @param b
	 * @uml.property  name="b"
	 */
	public void setB(String b) {
		this.b = b;
	}

	/**
	 * @return
	 * @uml.property  name="innerBean"
	 */
	public TestIOCBean getInnerBean() {
		return innerBean;
	}

	/**
	 * @param innerBean
	 * @uml.property  name="innerBean"
	 */
	public void setInnerBean(TestIOCBean innerBean) {
		this.innerBean = innerBean;
	}

	/**
	 * @return
	 * @uml.property  name="outterBean"
	 */
	public TestIOCBean getOutterBean() {
		return outterBean;
	}

	/**
	 * @param outterBean
	 * @uml.property  name="outterBean"
	 */
	public void setOutterBean(TestIOCBean outterBean) {
		this.outterBean = outterBean;
	}

	public Collection<String> getCollection() {
		return collection;
	}

	public void setCollection(Collection<String> collection) {
		this.collection = collection;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	/**
	 * @return
	 * @uml.property  name="props"
	 */
	public Properties getProps() {
		return props;
	}

	/**
	 * @param props
	 * @uml.property  name="props"
	 */
	public void setProps(Properties props) {
		this.props = props;
	}
}
