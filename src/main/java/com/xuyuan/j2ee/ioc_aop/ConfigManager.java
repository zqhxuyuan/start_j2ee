package com.xuyuan.j2ee.ioc_aop;

import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/*
 * By Bingluo 2012.8.17
 * cose.seu.edu.cn
 */
public class ConfigManager {
	// 存放dom
	/**
	 * @uml.property  name="dom"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Document dom;
	/**
	 * @uml.property  name="root"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	private Element root;
	// 从配置中生成的bean放入map中
	/**
	 * @uml.property  name="beans"
	 * @uml.associationEnd  multiplicity="(0 -1)" ordering="true" elementType="java.lang.Object" qualifier="getAttribute:java.lang.String java.lang.Object"
	 */
	private HashMap<String, Object> beans = new HashMap<String, Object>();

	// 在构造函数时，初始化dom树
	public ConfigManager(String xmlUrl) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setIgnoringElementContentWhitespace(true);
		DocumentBuilder db;
		try {
			db = factory.newDocumentBuilder();
			InputStream is = ConfigManager.class.getClassLoader().getResourceAsStream(xmlUrl);
			//dom = db.parse(xmlUrl);
			dom = db.parse(is);
			dom.normalize();
			root = dom.getDocumentElement();
			System.out.println("IOC/AOP初始化开始...");
			initBeans();
			System.out.println("IOC/AOP初始化结束...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 初始化配置文件中所有非懒加载的bean
	private void initBeans() {
		for (Node node = root.getFirstChild(); node != null; node = node.getNextSibling()) {
			// 延迟加载Bean
			if (node.getNodeName().equals("bean")
					&& ((Element) node).hasAttribute("lazy-init")
					&& ((Element) node).getAttribute("lazy-init").equals("true"))
				continue;
			else if (node.getNodeType() == Node.ELEMENT_NODE && node.getNodeName().equals("bean"))
				// 普通bean,创建后，存入map中
				beans.put(((Element) node).getAttribute("id"), initBean(node));
			else if (node.getNodeType() == Node.ELEMENT_NODE && node.getNodeName().equals("aop-config")) {
				// aop配置
				initAOP(node);
			}
		}
	}

	//AOP配置
	private void initAOP(Node aopConfig) {
		for (Node node = aopConfig.getFirstChild(); node != null; node = node.getNextSibling()) {
			// 为切面节点，配置增强
			if (node.getNodeType() == Node.ELEMENT_NODE && node.getNodeName().equals("aspect")) {
				initAspect(node);
			}
		}
	}

	//配置AOP切面
	private void initAspect(Node aspect) {
		String aspectRef = ((Element) aspect).getAttribute("ref");
		Object adviceBean = null;
		String expression = "";
		Method beforeMethod = null;
		Method aroundMethod = null;
		Method afterMethod = null;
		if (beans.containsKey(aspectRef)) {
			// 在beans的map中发现已初始化过该bean
			adviceBean = beans.get(aspectRef);
		} else {
			// 未初始化过该bean
			Node e = dom.getElementById(aspectRef);
			if (e.getNodeName().equals("bean")) {
				// 递归调用，初始化被引用的bean
				adviceBean = initBean(e);
			}
		}

		// 获取切点
		// ***************1个切面默认最多只有1个切点、1个前置增强、1个后置增强、1个环绕增强
		Node pointcutNode = ParserHelper.getNode(aspect, "pointcut");
		expression = ((Element) pointcutNode).getAttribute("expression");

		// 获取该切面的增强
		for (Node currentNode = aspect.getFirstChild(); currentNode != null; currentNode = currentNode
				.getNextSibling()) {
			if (currentNode.getNodeType() != Node.ELEMENT_NODE)
				continue;

			// 为相应的增强赋值
			String methodName = ((Element) currentNode).getAttribute("method");
			try {
				if (currentNode.getNodeName().equals("before")) {
					beforeMethod = adviceBean.getClass().getMethod(methodName);
				} else if (currentNode.getNodeName().equals("around")) {
					aroundMethod = adviceBean.getClass().getMethod(methodName,
							ProceedingJoinPoint.class);
				} else if (currentNode.getNodeName().equals("after")) {
					afterMethod = adviceBean.getClass().getMethod(methodName);
				}
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
		}

		// 将该切面交给代理维护
		AspectInfo aspectInfo = new AspectInfo(expression, adviceBean, beforeMethod, aroundMethod, afterMethod);
		ProxyHandler.addAspectInfo(aspectInfo);
	}

	//初始化Bean
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Object initBean(Node node) {
		// 初始化的类型
		Class c = null;
		// 需要初始化的bean
		Object object = null;
		// 生成对象
		try {
			c = Class.forName(((Element) node).getAttribute("class"));
			object = c.newInstance();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}

		// 如果此bean为基本类型bean
		if (isPrimitive(((Element) node).getAttribute("class")) || ((Element) node).hasAttribute("value")) {
			object = getInstanceForName(((Element) node).getAttribute("class"), ((Element) node).getAttribute("value"));
			return object;
		}

		boolean constructorInit = false;// 是否为构造函数注入
		ArrayList<Class> parameterTypes = new ArrayList<Class>();
		ArrayList<Object> parameters = new ArrayList<Object>();
		// 为bean配置属性
		for (Node property = node.getFirstChild(); property != null; property = property.getNextSibling()) {
			if (property.getNodeType() != Node.ELEMENT_NODE) {
				continue;
			}

			if (property.getNodeName().equals("constructor-arg")) {
				// bean为构造函数注入
				constructorInit = true;
				if (((Element) property).hasAttribute("value")) {
					// 该参数为基本类型参数
					getInstanceForName(((Element) property).getAttribute("type"),((Element) property).getAttribute("value"));
					Class temp = nameToPrimitiveClass(((Element) property).getAttribute("type"));
					parameterTypes.add(temp);
					parameters.add(getInstanceForName(((Element) property).getAttribute("type"),((Element) property).getAttribute("value")));
				} else if (((Element) property).hasAttribute("ref")) {
					String refId = ((Element) property).getAttribute("ref");
					// 该参数为外部bean引用属性
					if (beans.containsKey(refId)) {
						// 在beans的map中发现已初始化过该bean
						parameterTypes.add(beans.get(refId).getClass());
						parameters.add(beans.get(refId));
					} else {
						// 未初始化过该bean
						Node e = dom.getElementById(refId);
						if (e.getNodeName().equals("bean")) {
							// 递归调用，初始化被引用的bean
							Class temp = null;
							try {
								temp = Class.forName(((Element) e).getAttribute("class"));
							} catch (ClassNotFoundException e1) {
								e1.printStackTrace();
							}
							parameterTypes.add(temp);
							parameters.add(initBean(e));
						}
					}
				}
			} else if (property.getNodeName().equals("property")) {
				// bean为普通属性注入
				String propertyName = ((Element) property).getAttribute("name");
				// 获取该属性对应的set方法
				Method[] methods = c.getMethods();
				Method method = null;
				for (int k = 0; k < methods.length; k++) {
					if (methods[k].getName().equalsIgnoreCase("set" + propertyName)) {
						method = methods[k];
					}
				}

				Object value = null;// 属性值

				if (((Element) property).hasAttribute("value")) {
					// 该属性为直接属性，非外部bean引用属性
					String propertyValue = ((Element) property).getAttribute("value");
					Class<?>[] types = method.getParameterTypes();
					value = getInstanceForName(types[0].getName(), propertyValue);

				} else if (((Element) property).hasAttribute("ref")) {
					String refId = ((Element) property).getAttribute("ref");
					// 该属性为外部bean引用属性
					if (beans.containsKey(refId)) {
						// 在beans的map中发现已初始化过该bean
						value = beans.get(refId);
					} else {
						// 未初始化过该bean
						Node e = dom.getElementById(refId);
						if (e.getNodeName().equals("bean")) {
							// 递归调用，初始化被引用的bean
							value = initBean(e);
						}
					}
				} else if (ParserHelper.containNode(property, "bean")) {
					// 该属性为内部bean引用属性
					Node innerBeanNode = null;
					for (innerBeanNode = property.getFirstChild(); innerBeanNode != null; innerBeanNode = innerBeanNode.getNextSibling()) {
						if (innerBeanNode.getNodeName().equals("bean")) {
							break;
						}
					}
					value = initBean(innerBeanNode);
				} else if (ParserHelper.containNode(property, "list") || ParserHelper.containNode(property, "set")) {
					// 属性为list、set集合类型
					Collection<Object> collection = ParserHelper.containNode(property, "list") ? new ArrayList<Object>() : new HashSet();
					for (Node currentNode = property.getFirstChild()
							.getFirstChild(); currentNode != null; currentNode = currentNode
							.getNextSibling()) {
						if (currentNode.getNodeName().equals("ref")
								&& (((Element) currentNode).hasAttribute("bean") && beans.containsKey(((Element) currentNode).getAttribute("bean")))) {
							// 该list子元素为引用bean
							String ref = ((Element) currentNode).getAttribute("bean");
							collection.add(beans.get(ref));
						} else if (currentNode.getNodeName().equals("bean")) {
							// 该list子元素为内部bean
							collection.add(initBean(currentNode));
						}
					}
					value = collection;
				} else if (ParserHelper.containNode(property, "map")) {
					// 属性为map集合类型
					HashMap<String, Object> map = new HashMap<String, Object>();
					for (Node currentNode = property.getFirstChild().getFirstChild(); currentNode != null; currentNode = currentNode.getNextSibling()) {
						if (currentNode.getNodeName().equals("entry")
								&& (((Element) currentNode).hasAttribute("key") && (((Element) currentNode)
										.hasAttribute("value-ref") && beans.containsKey(((Element) currentNode).getAttribute("value-ref"))))) {
							// 该list子元素为引用bean
							String key = ((Element) currentNode).getAttribute("key");
							String ref = ((Element) currentNode).getAttribute("value-ref");
							map.put(key, beans.get(ref));
						}
					}
					value = map;
				} else if (ParserHelper.containNode(property, "props")) {
					// 属性为props属性类型
					Properties props = new Properties();
					for (Node currentNode = property.getFirstChild().getFirstChild(); currentNode != null; currentNode = currentNode.getNextSibling()) {
						if (currentNode.getNodeName().equals("prop") && ((Element) currentNode).hasAttribute("key")) {
							// 该list子元素为引用bean
							String key = ((Element) currentNode).getAttribute("key");
							String propValue = currentNode.getTextContent();
							props.setProperty(key, propValue);
						}
					}
					value = props;
				}

				// 调用set方法，初始化bean的属性
				try {
					method.invoke(object, value);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}

		// 若为构造函数注入
		if (constructorInit == true) {
			Class[] aClasses = {};
			Class[] classes = (Class[]) parameterTypes.toArray(aClasses);
			Object[] prams = (Object[]) parameters.toArray();
			try {
				object = c.getConstructor(classes).newInstance(prams);
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}

		if (object.getClass().getInterfaces().length == 0) {
			return object;
		} else {
			// 返回经过代理的bean
			return new ProxyHandler(object).getProxyInstance();
		}
	}

	// 获取hashMap中相应的bean
	public Object getBean(String id) {
		Object bean = beans.get(id);
		// 未初始化的bean，有可能为懒加载，也有可能没有此bean
		if (bean == null) {
			Element element = dom.getElementById(id);
			if (element.getTagName().equals("bean")
					&& element.hasAttribute("lazy-init")
					&& element.getAttribute("lazy-init").equals("true")) {
				// 确实为懒加载
				// 创建后，存入map中
				System.out.println("懒加载：" + id);
				bean = initBean(element);
				beans.put(element.getAttribute("id"), bean);
			} else {
				// 无此Bean的懒加载声明
				System.out.println("找不到此Bean");
			}
		}
		return bean;
	}

	// 检验是否为基本值类型或基本对象
	@SuppressWarnings("rawtypes")
	private boolean isPrimitive(String className) {
		Class clazz = null;
		try {
			clazz = Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String name = clazz.getName();
		if (clazz.isPrimitive() || name.equals("java.lang.String")
				|| name.equals("java.lang.Integer")
				|| name.equals("java.lang.Float")
				|| name.equals("java.lang.Double")
				|| name.equals("java.lang.Character")
				|| name.equals("java.lang.Integer")
				|| name.equals("java.lang.Boolean")
				|| name.equals("java.lang.Short")) {
			return true;
		} else {
			return false;
		}
	}

	// 通过字符串反射类型，增加了对基本类型的包装
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Object getInstanceForName(String name, String value) {
		Class clazz = nameToClass(name);

		Object object = null;
		try {
			object = clazz.getConstructor(String.class).newInstance(value);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		return object;
	}

	//通过类型名返回基本类型Class（Class.forName()貌似不行）
	@SuppressWarnings("rawtypes")
	private Class nameToPrimitiveClass(String name) {
		Class clazz = null;
		if (name.equals("int")) {
			clazz = int.class;
		} else if (name.equals("char")) {
			clazz = char.class;
		} else if (name.equals("boolean")) {
			clazz = boolean.class;
		} else if (name.equals("short")) {
			clazz = short.class;
		} else if (name.equals("long")) {
			clazz = long.class;
		} else if (name.equals("float")) {
			clazz = float.class;
		} else if (name.equals("double")) {
			clazz = double.class;
		} else if (name.equals("byte")) {
			clazz = byte.class;
		} else {
			try {
				clazz = Class.forName(name);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		return clazz;
	}

	//通过类型名获取包装器类
	@SuppressWarnings("rawtypes")
	private Class nameToClass(String name) {
		Class clazz = null;
		if (name.equals("int")) {
			clazz = Integer.class;
		} else if (name.equals("char")) {
			clazz = Character.class;
		} else if (name.equals("boolean")) {
			clazz = Boolean.class;
		} else if (name.equals("short")) {
			clazz = Short.class;
		} else if (name.equals("long")) {
			clazz = Long.class;
		} else if (name.equals("float")) {
			clazz = Float.class;
		} else if (name.equals("double")) {
			clazz = Double.class;
		} else if (name.equals("byte")) {
			clazz = Byte.class;
		} else {
			try {
				clazz = Class.forName(name);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		return clazz;
	}
}
