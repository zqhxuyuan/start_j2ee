package com.xuyuan.j2ee.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;


//定义一个远程接口，必须继承Remote接口，其中需要远程调用的方法必须抛出RemoteException异常
/**
 * @author  Administrator
 */
public interface MyServer extends Remote {

	public String helloWorld(String name) throws RemoteException;
	
	/**
	 * @uml.property  name="userDTO"
	 * @uml.associationEnd  
	 */
	public User getUserDTO() throws RemoteException;
}

