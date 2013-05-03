package com.xuyuan.j2ee.rmi;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;


/**
 * 客户端测试，在客户端调用远程对象上的远程方法，并返回结果
 */
public class HelloClient {

	public static void main(String[] args) throws MalformedURLException,
			RemoteException, NotBoundException {
		//在RMI服务注册表中查找名称为liuyanrm的对象，并调用其上的方法 
		MyServer myServer = (MyServer) Naming.lookup("rmi://:19898/liuyanrmi");

		System.out.println("client:" + myServer.helloWorld("client"));
		System.out.println("client:" + myServer.getUserDTO().toString());
	}

}
