package com.xuyuan.spring3.recipes.advanceioc.t7;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Date;

import com.xuyuan.spring3.recipes.advanceioc.t1.Product;
import com.xuyuan.spring3.recipes.advanceioc.t6.ShoppingCart;

/**
 * be used to check out the products in a shopping cart. 
 * It records the time and the amount of each checkout in a text file.
 * 
 * 初始化方法的四种方法：
 * 3.bean配置init-method和destroy-method。就不需要实现接口了。
 */
public class Cashier  {//implements InitializingBean, DisposableBean{

    /**
	 * @uml.property  name="name"
	 */
    private String name;
    /**
	 * @uml.property  name="path"
	 */
    private String path;
    /**
	 * @uml.property  name="writer"
	 */
    private BufferedWriter writer;
    
    //1.构造方法里，在设置完属性值后，调用openFile初始化方法
//    public Cashier(){}
//    public Cashier(String name, String path) throws IOException {
//		this.name = name;
//		this.path = path;
//		this.openFile();
//	}
    
    //2.实现Spring的InitializingBean, DisposableBean接口，在回调方法里调用初始化和关闭方法
//	@Override
//	public void destroy() throws Exception {
//		this.openFile();
//	}
//	@Override
//	public void afterPropertiesSet() throws Exception {
//		this.closeFile();
//	}
    
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
        this.name = name;
    }
    /**
	 * @param path
	 * @uml.property  name="path"
	 */
    public void setPath(String path) {
        this.path = path;
    }

    //4.注解方式，在需要初始化的方法加上@PostConstruct，在需要销毁的方法加上@PreDestroy.
    //bean需要配置<context:annotation-config /> 或者CommonAnnotationBeanPostProcessor
    //@PostConstruct
    public void openFile() throws IOException {
        File logFile = new File(path, name + ".txt");
        writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(logFile, true)));
    }

    public void checkout(ShoppingCart cart) throws IOException {
        double total = 0;
        for (Product product : cart.getItems()) {
            total += product.getPrice();
        }
        writer.write(new Date() + "\t" + total + "\r\n");
        writer.flush();
    }
    
    //@PreDestroy
    public void closeFile() throws IOException { 
        writer.close(); 
    }
}
