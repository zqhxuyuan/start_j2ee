package com.xuyuan.j2ee.rmi;

import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

/**
 * 创建RMI注册表，启动RMI服务，并将远程对象注册到RMI注册表中。
 * 1.创建一个远程对象
 * 2.本地主机上的远程对象注册表Registry的实例，并指定端口。如果缺少注册表创建，则无法绑定对象到远程注册表上
 * 3. 把远程对象注册到RMI注册服务器上，并命名
 * 绑定的URL标准格式为：rmi://host:port/name(其中协议名可以省略)
 */
public class HelloServer {
	
	public static void main(String[] args) throws RemoteException, MalformedURLException {
		MyServer myServer = new MyServerImpl();
		LocateRegistry.createRegistry(19898);
		Naming.rebind("rmi://:19898/liuyanrmi", myServer);
		System.out.println("RMI Server start--rmi://:19898/liuyanrmi");
	}
}
