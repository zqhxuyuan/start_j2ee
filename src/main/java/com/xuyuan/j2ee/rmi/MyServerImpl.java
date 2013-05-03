package com.xuyuan.j2ee.rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class MyServerImpl extends UnicastRemoteObject implements MyServer {
	private static final long serialVersionUID = 1L;

	protected MyServerImpl() throws RemoteException {
		super();
	}
	
	@Override
	public String helloWorld(String name) throws RemoteException {
		return "hello world----" + name;
	}
	
	@Override
	public User getUserDTO() throws RemoteException {
		User userDTO = new User();
		userDTO.setId("1");
		userDTO.setName("素还真");
		return userDTO;
	}

}
