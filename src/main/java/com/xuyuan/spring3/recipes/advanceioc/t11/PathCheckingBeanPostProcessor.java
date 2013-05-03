package com.xuyuan.spring3.recipes.advanceioc.t11;

import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.core.PriorityOrdered;


/**
 *  If a bean implements this interface, you can access its path property by the  getPath() method 
 *  and check for its existence in the file system. If that path doesn’t exist, create it .
 *  
 *  define the processing order of bean post processors, implement the  Ordered or PriorityOrdered interface
 */
public class PathCheckingBeanPostProcessor implements BeanPostProcessor{//, PriorityOrdered {

    /**
	 * @uml.property  name="order"
	 */
    private int order;

    /**
	 * @return
	 * @uml.property  name="order"
	 */
    public int getOrder() {
        return order;
    }
    /**
	 * @param order
	 * @uml.property  name="order"
	 */
    public void setOrder(int order) {
        this.order = order;
    }

    public Object postProcessBeforeInitialization(Object bean, String beanName)throws BeansException {
        if (bean instanceof StorageConfig) {
            String path = ((StorageConfig) bean).getPath();
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        return bean;
    }

    public Object postProcessAfterInitialization(Object bean, String beanName)throws BeansException {
        return bean;
    }
}
