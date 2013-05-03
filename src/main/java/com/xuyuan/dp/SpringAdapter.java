package com.xuyuan.dp;

interface Controller {
	public void handleRequest();
}

class Action implements Controller {
	public void handleRequest() {
		System.out.println("Action...");
	}
}

interface HandlerAdapter {
	public void handle(Object handler);
}

class SimpleControllerHandlerAdapter implements HandlerAdapter {
	public void handle(Object handler) {
		((Controller)handler).handleRequest();
	}
}

public class SpringAdapter {
	public static void main(String[] args) {
		Controller controller = new Action();
		
		HandlerAdapter ha = new SimpleControllerHandlerAdapter();
		ha.handle(controller);
	}
}
