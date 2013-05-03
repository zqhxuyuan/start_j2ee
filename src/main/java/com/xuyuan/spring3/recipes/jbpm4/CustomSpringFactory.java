package com.xuyuan.spring3.recipes.jbpm4;

import org.jbpm.api.ProcessEngine;

import org.jbpm.pvm.internal.cfg.ConfigurationImpl;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


/**
 * A custom BeanFactory that we can use to setup the org.jbpm.api.ProcessEngine. 
 * This is based on jBPM's {@link org.jbpm.pvm.internal.processengine.SpringHelper}.
 */
public class CustomSpringFactory implements FactoryBean, InitializingBean, ApplicationContextAware {
    /**
	 * @uml.property  name="applicationContext"
	 * @uml.associationEnd  
	 */
    private ApplicationContext applicationContext;
    /**
	 * @uml.property  name="processEngine"
	 * @uml.associationEnd  
	 */
    private ProcessEngine processEngine;
    /**
	 * @uml.property  name="jbpmCfg"
	 */
    private String jbpmCfg;

    /**
	 * @param jbpmCfg
	 * @uml.property  name="jbpmCfg"
	 */
    public void setJbpmCfg(final String jbpmCfg) {
        this.jbpmCfg = jbpmCfg;
    }

    @Override
    public Object getObject() throws Exception {
        return processEngine;
    }

    @Override
    public Class<?> getObjectType() {
        return ProcessEngine.class;
    }

    @Override
    public boolean isSingleton() {
        return true;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        processEngine = new ConfigurationImpl().springInitiated(applicationContext).setResource(jbpmCfg).buildProcessEngine();
    }

    /**
	 * @param applicationContext
	 * @throws BeansException
	 * @uml.property  name="applicationContext"
	 */
    @Override
    public void setApplicationContext(final ApplicationContext applicationContext)
        throws BeansException {
        this.applicationContext = applicationContext;
    }
}
