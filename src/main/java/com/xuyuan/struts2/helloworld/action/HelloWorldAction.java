package com.xuyuan.struts2.helloworld.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.xuyuan.struts2.helloworld.model.MessageStore;

/**
 * It's a Struts2 HelloWorld App.
 * 分别定义了三种变量:对象,成员变量,静态变量.
 * 并在页面上使用s:property标签取出Action中的值.
 *
 * 如果对象实现了toString(),则s:property可以直接使用对象.不需要对每个属性进行都导航.
 *
 * 1.How To Create A Struts 2 Web Application
 * 2.Hello World Using Struts 2
 * 3.Using Struts 2 Tags
 * 4.Coding Struts 2 Actions
 *
 * HelloWorld.jsp
 * @author Administrator
 *
 */
public class HelloWorldAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	//---------------定义需要被页面使用的变量
	//页面上s:property messageStore.message显示对象的属性值
	/**
	 * @uml.property  name="messageStore"
	 * @uml.associationEnd  
	 */
	private MessageStore messageStore;

	//成员变量,页面上可以获取到userName,显示
	/**
	 * @uml.property  name="userName"
	 */
	private String userName;

	//静态变量,每次执行execute,+1
	private static int helloCount = 0;
	
	/**
	 * @uml.property  name="msgs"
	 */
	private List<MessageStore> msgs = new ArrayList<MessageStore>();

	//---------------Action的方法实现,为变量取值设置
	@Override
	public String execute() throws Exception {
		messageStore = new MessageStore();
		if (userName != null) {
			messageStore.setMessage(messageStore.getMessage() + " " + userName);
		}

		helloCount++;
		
		msgs.add(messageStore);
		messageStore = new MessageStore();
		messageStore.setMessage("Welcome!!!");
		msgs.add(messageStore);
		return SUCCESS;
	}
	
	//---------------变量的get,set方法
	/**
	 * @return
	 * @uml.property  name="messageStore"
	 */
	public MessageStore getMessageStore() {
		return messageStore;
	}
	/**
	 * @param messageStore
	 * @uml.property  name="messageStore"
	 */
	public void setMessageStore(MessageStore messageStore) {
		this.messageStore = messageStore;
	}

	/**
	 * @return
	 * @uml.property  name="userName"
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName
	 * @uml.property  name="userName"
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getHelloCount() {
		return helloCount;
	}
	public void setHelloCount(int helloCount) {
		HelloWorldAction.helloCount = helloCount;
	}

	public List<MessageStore> getMsgs() {
		return msgs;
	}

	public void setMsgs(List<MessageStore> msgs) {
		this.msgs = msgs;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

