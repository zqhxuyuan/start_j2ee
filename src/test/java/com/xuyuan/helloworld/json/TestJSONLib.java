package com.xuyuan.helloworld.json;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.Assert;
import junit.framework.TestCase;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;

/**
 * http://json.org/json-zh.html
 *   JSON数组:值的有序集合: 		[ value ]
 *   JSON对象:无序的"键值对"集合: 	{ string:value }
 *   
 * json-lib初步使用: 		http://json-lib.sourceforge.net/usage.html
 *   JSONArray.fromObject(obj)  = JSONArray
 *   JSONObject.fromObject(obj) = JSONObject
 *   JSONObject.toBean(jsonObj) = Bean
 * @author Administrator 2011/12/12
 */
public class TestJSONLib extends TestCase{
	
	/**
	 * 对象转为 JSONArray/JSONObject对象
	 * 1.对象转为JSONArray
	 * 2.Map转为JSONObject
	 * 3.Bean转为JSONObject
	 */
	public void test2JSONArray(){
		System.out.println("-----Object to JSONArray:-----");
		//Array
		boolean[] boolArray = new boolean[]{true,false,true};  
		JSONArray jsonArray = JSONArray.fromObject( boolArray );  
		System.out.println( jsonArray );
		
		//List
		List list = new ArrayList();  
		list.add( "first" );  
		list.add( "second" );  
		JSONArray jsonArray2 = JSONArray.fromObject( list );  
		System.out.println( jsonArray2 );  
		
		//JSON字符串
		JSONArray jsonArray3 = JSONArray.fromObject( "['json','is','easy']" );  
		System.out.println( jsonArray3 ); 
	}
	
	public void testMap2JSONObject(){
		System.out.println("\n-----Object(Map) to JSONObject:-----");
		Map map = new HashMap();  
		map.put( "name", "json" );  
		map.put( "bool", Boolean.TRUE );  
		map.put( "int", new Integer(1) );  
		map.put( "arr", new String[]{"a","b"} );  
		map.put( "func", "function(i){ return this.arr[i]; }" );  
		  
		JSONObject jsonObject = JSONObject.fromObject( map );  
		System.out.println( jsonObject );  
	}
	
	public void testBean2JSONObject(){
		Bean1 myBean = new Bean1();
		myBean.setName("json");
		myBean.setOptions(new char[]{'a','f'});
		myBean.setPojoId(1);
		myBean.setFunc1("function(i){ return this.options[i]; }");

		Bean2 func2 = new Bean2();
		func2.setField1(new String[]{"i"});
		func2.setField2("return this.options[i];");
		myBean.setFunc2(func2);

		System.out.println("\n-----Object(Bean) to JSONObject:-----");
		JSONObject jsonObject = JSONObject.fromObject( myBean );  
		System.out.println( jsonObject );  
	}
	
	/**
	 * JSON字符串转为Bean
	 * 1.JSON字符串转为动态Bean
	 * 2.JSON字符串转为Bean
	 * 3.
	 */
	public void testJSON2DyBean() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{
		//JSON字符串
		String json = "{name=\"json\",bool:true,int:1,double:2.2,func:function(a){ return a; },array:[1,2]}";  
		//JSONObject << JSON字符串转为JSONObject
		JSONObject jsonObject = JSONObject.fromObject( json );
		//Bean <<JSONObject转为Bean对象
		Object bean = JSONObject.toBean( jsonObject );
		
		//测试JSONObject的值和Bean的值是否相同:
		assertEquals( jsonObject.get( "name" ), PropertyUtils.getProperty( bean, "name" ) );  
		assertEquals( jsonObject.get( "bool" ), PropertyUtils.getProperty( bean, "bool" ) );  
		assertEquals( jsonObject.get( "int" ), PropertyUtils.getProperty( bean, "int" ) );  
		assertEquals( jsonObject.get( "double" ), PropertyUtils.getProperty( bean, "double" ) );  
		assertEquals( jsonObject.get( "func" ), PropertyUtils.getProperty( bean, "func" ) );  
		List expected = JSONArray.toList( jsonObject.getJSONArray( "array" ) );  
		Assert.assertEquals(expected, (List) PropertyUtils.getProperty( bean, "array" ));
	}
	
	public void testJSON2Bean1(){
		String json = "{bool:true,integer:1,string:\"json\"}";  
		JSONObject jsonObject = JSONObject.fromObject( json );
		System.out.println("JSONStr 2 JSONObject:" + jsonObject);
		Bean3 bean = (Bean3) JSONObject.toBean( jsonObject, Bean3.class );  
		
		assertEquals( jsonObject.get( "bool" ), Boolean.valueOf( bean.getBool() ) );  
		assertEquals( jsonObject.get( "integer" ), new Integer( bean.getInteger() ) );  
		assertEquals( jsonObject.get( "string" ), bean.getString() );
		
		System.out.println("\n-----JSON to Bean:-----");
		System.out.println(bean);
	}
	
	public void testJSON2Bean2(){
		String json = "{'data':[{'name':'Wallace','pass':'123456'},{'name':'Grommit'}]}";
		JSONObject jsonObject = JSONObject.fromObject( json );
		System.out.println("JSONStr 2 JSONObject:" + jsonObject);
		
		
		Map classMap = new HashMap();  
		classMap.put( "data", Person.class );  
		MyBean bean = (MyBean)JSONObject.toBean( jsonObject, MyBean.class, classMap ); 
		
		List<Person> persons = bean.getData();
		for(Person p : persons){
			System.out.println("MyBean[name:" + p.getName() + ";pass:" + p.getPass() + "]");
		}
	}
}