package com.xuyuan.spring3.recipes.jbpm4.customers;

import org.apache.commons.lang.exception.ExceptionUtils;

import org.apache.log4j.Logger;

import org.jbpm.api.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.core.io.ClassPathResource;

import org.springframework.orm.hibernate3.HibernateTemplate;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;


/**
 * This class uses jBPM to manage the lifecycle of a new Customer using a workflow.
 */
public class CustomerServiceImpl implements CustomerService {
    private static final String REGISTER_CUSTOMER_PROCESS_KEY = "RegisterCustomer";
    private static final Logger logger = Logger.getLogger(CustomerServiceImpl.class);
    
    /**
	 * @uml.property  name="processDefinitions"
	 */
    private List<String> processDefinitions;
    
    /**
	 * @uml.property  name="processEngine"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Autowired
    private ProcessEngine processEngine;
    
    /**
	 * @uml.property  name="repositoryService"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Value("#{ processEngine.getRepositoryService() }")
    private RepositoryService repositoryService;
    
    /**
	 * @uml.property  name="executionService"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Value("#{ processEngine.getExecutionService() }")
    private ExecutionService executionService;
   
    /**
	 * @uml.property  name="hibernateTemplate"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @PostConstruct
    public void setupProcessDefinitions() {
        try {
            for (String processDefinition : processDefinitions) {
                NewDeployment deployment = repositoryService.createDeployment();
                deployment.addResourceFromUrl(new ClassPathResource(processDefinition).getURL());
                deployment.deploy();
            }
        } catch (IOException e) {
            logger.info("IOException occurred: " + ExceptionUtils.getFullStackTrace(e));
            throw new RuntimeException("An error occured while trying to deploy a process definition", e);
        }
    }

    /**
     * Return a customer by the primary key
     */
    public Customer getCustomerById(Long id) {
        return (Customer) hibernateTemplate.get(Customer.class, id);
    }
    
    /**
     *  Inside the createCustomer  method, we use jBPM to start the business process to track the Customer.
     *  1.（Main方法中调用该方法模拟）启动流程，参数customerId（流程参数的上下文变量）放入流程实例ProcessInstance中
     *  
     */
    public Customer createCustomer(String email, String passphrase, String firstName, String lastName) {
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setEmail(email);
        customer.setPassphrase(passphrase);
        customer.setAuthorized(false);
        hibernateTemplate.saveOrUpdate(customer);

        Map<String, Object> vars = new HashMap<String, Object>();
        vars.put("customerId", customer.getId());

        ProcessInstance pi = executionService.startProcessInstanceByKey(REGISTER_CUSTOMER_PROCESS_KEY, vars, Long.toString(customer.getId()));
        System.out.println("pi.started " + pi.getProcessDefinitionId());
        return customer;
    }
    
    /**
     * 2. <java name="send-verification-email" expr="#{customerService}" method="sendCustomerVerificationEmail">
     * 参数customerId由RegisterCustomer.jpdl.xml的 <object expr="#{customerId}"/> 传入，
     * 而EL表达式 #{customerId} 保存在流程实例里，即上面的方法放入Map的正是。
     */
    public void sendCustomerVerificationEmail(Long customerId) {
        System.out.println("Sending customer verification email to " + customerId);
    }

    /**
     * There may be other use cases that aren't handled by this scenrio such as creation of system resources or
     * processing on data that happens on things given by the user at the time of the creation of the account.
     * 3. 用户需要点击邮箱的验证链接，才继续下面的步骤。Main方法里通过模拟调用该方法，使得流程继续走下去。（真实环境中，用户点击链接调用该方法）
     * 如何调用： 
     * I. 找到对应的流程实例，因为在启动流程实例时，是以CustomerId为Key，所以传入customerId查询表即可得到该流程实例的所有执行列表。
     * II.找到当前活动的节点名称：confirm-receipt-of-verification-email，触发执行的动作。改变流程等待的状态到下一个步骤。
     */
    @SuppressWarnings("unchecked")
    public void authorizeCustomer(Long customerId) {
        Customer customer = getCustomerById(customerId);
        customer.setAuthorized(true);

        String processInstanceKey = Long.toString(customerId);
        String hqlToFindProcessInstanceByProcessInstanceKey = "SELECT processInstance FROM ExecutionImpl AS processInstance WHERE  processInstance.key = :processInstanceKey";
        List<Execution> executions = hibernateTemplate.findByNamedParam(hqlToFindProcessInstanceByProcessInstanceKey, new String[] { "processInstanceKey" }, new Object[] { processInstanceKey });
        System.out.println("executions: " + executions);

        for (Execution execution : executions) {
            Execution subExecution = execution.findActiveExecutionIn("confirm-receipt-of-verification-email");
            executionService.signalExecutionById(subExecution.getId());
        }

        hibernateTemplate.saveOrUpdate(customer); //更新Customer的状态，表示已经验证过了
    }

    /**
     * 4.<java name="send-welcome-email" expr="#{customerService}" method="sendWelcomeEmail">
     * 流程流转到下一步，调用该方法，因为customerId是在流程实例中共享的，所以RegisterCustomer.jpdl.xml里传参数<object expr="#{customerId}"/>
     */
    public void sendWelcomeEmail(Long customerId) {
        System.out.println("Sending customer welcome email to " + customerId);
    }
    
    /**
     * There may be other use cases that aren't handled by this method where it might be appropriate to spin off a
     * workflow. Examples include revocation of specialized service accounts (FTP, e-mail, whatever), file shares, etc.
     */
    public void deauthorizeCustomer(Long customerId) {
        Customer customer = getCustomerById(customerId);
        customer.setAuthorized(false);
        hibernateTemplate.saveOrUpdate(customer);
    }

    /**
     * A simple mutator to facilitate configuration.
     */
    public void setProcessDefinitions(List<String> pd) {
        this.processDefinitions = pd;
    }

}
