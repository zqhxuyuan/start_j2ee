package com.xuyuan.j2ee.mvc.view;

import com.xuyuan.j2ee.mvc.constant.DispatchActionConstant;

/**
 * mvc底层的实现就是一个大的servlet ，来拦截我们得请求 ，分发到不同处理操作，然后跳转到相应的视图
 * 
 * url:请求的路径 ，我们可以做一个解析:找到你的action类中方法上的注释(RequestMapping上)和你解析出来的路径一致，说明就是这个方法，
 * 接着我们利用java反射机制调用这个类的方法就可以了，接着这个方法会返回一个路径，就是我们跳转的视图返回给我们总的servlet，进行跳转。
 * 
 * 首先考虑你返回的视图的路径，其中还有包含的数据怎么办呢？还有就是服务器端跳转还是客户端跳转呢？
 * 此时我们要定义一个视图类，对这些操作属性进行封装，其中包括跳转的路径 、跳转方式、展现到页面的数据（这里只是做request范围内的：ViewData）。
 * 
 * 我们在每次请求的时候，到达action某个指定的方法的时候，我们会用ViewData.put()往request中存数据。往request中设置数据，在跳转的页面就能接收到这个数据。
 * 
 * 而action中并没有request的情况如何处理呢？可以提供一个在进入action之前进行初始化request的类WebContext。
 * 通过这个类 ，你可以当前请求的request或者session相关请求类的实例变量？？，线程间互不干扰的，因为用到了ThreadLocal这个类。
 * @author ajun
 * @http://blog.csdn.net/ajun_studio  
 **/
public class View {

	/**
	 * @uml.property  name="url"
	 */
	private String url;//跳转路径
	
	/**
	 * @uml.property  name="dispathAction"
	 */
	private String dispathAction = DispatchActionConstant.FORWARD;//跳转方式
	

	public View(String url) {
		this.url = url;
	}
	
	public View(String url,String name,Object value) {
		this.url = url;
		// 封装了数据
		ViewData view = new ViewData();
		view.put(name, value);
	}
	
	
	public View(String url,String name,String dispathAction ,Object value) {
		this.dispathAction = dispathAction;
		this.url = url;
		ViewData view = new ViewData();//请看后面的代码
		view.put(name, value);
	}
	
	
	/**
	 * @return
	 * @uml.property  name="url"
	 */
	public String getUrl() {
		return url;
	}
	
	
	/**
	 * @param url
	 * @uml.property  name="url"
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return
	 * @uml.property  name="dispathAction"
	 */
	public String getDispathAction() {
		return dispathAction;
	}

	/**
	 * @param dispathAction
	 * @uml.property  name="dispathAction"
	 */
	public void setDispathAction(String dispathAction) {
		this.dispathAction = dispathAction;
	}

	
}
