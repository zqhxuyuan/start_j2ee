package com.xuyuan.j2ee.ioc_aop;

import org.w3c.dom.Node;
/*
 * By Bingluo 2012.8.17
 * cose.seu.edu.cn
 * Parser辅助方法
 */
public class ParserHelper {

	//查看Node中是否存在名为name的子节点
	public static boolean containNode(Node node,String name){
		for (Node currentNode = node.getFirstChild(); currentNode!=null; currentNode = currentNode.getNextSibling()) {
			if (currentNode.getNodeName().equals(name)) {
				return true;
			}
		}
		return false;
	}

	//返回名称对应的节点
	public static Node getNode(Node node, String name){
		for (Node currentNode = node.getFirstChild(); currentNode!=null; currentNode = currentNode.getNextSibling()) {
			if (currentNode.getNodeName().equals(name)) {
				return currentNode;
			}
		}
		return null;
	}
}
