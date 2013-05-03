package com.xuyuan.ssh.common.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.xuyuan.ssh.common.hibernate.HibernateDao;
import com.xuyuan.ssh.common.util.ReflectUtil;
import com.xuyuan.ssh.entity.base.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 扩展Struts2的ActionSupport的泛型基类 : 封装CRUD基本方法，可在子类进行覆盖重写
 *
 * 实体类的主键ID : 改为Long会出现一大堆问题!要跟实体类的ID类型一致!
 * entityClass和entity的区别.entityClass是获得类型,entity是获取实体对象.
 * 真正业务方法使用的是entity,但使用entity之前需要先确定entityClass才能使用entity.这是泛型使用的基础.
 *
 * 封装好该类之后,对于基本的CRUD操作.Dao,Service,Action实现类都不需要任何的代码.[Beautiful Code]
 * @param <T> 实体类型
 */
public class StrutsAction<T> extends ActionSupport implements ModelDriven, Preparable{
	private static final long serialVersionUID = 1L;
	/**
	 * @uml.property  name="logger"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * @uml.property  name="entityClass"
	 */
	protected Class<T> entityClass; //T的反射类型
	
	/**
	 * @uml.property  name="id"
	 */
	protected Integer id;
	/**
	 * @uml.property  name="entity"
	 */
	protected T entity; //T类型对象
	/**
	 * @uml.property  name="list"
	 */
	protected List<T> list; //页面列表list

	public static final String RELOAD = "reload"; 					//重定向的返回字符串
	public static final String REDIRECT = "redirect"; 				//重定向
	public static final String REDIRECT_ACTION = "redirectAction"; 	//Action之间重定向
	public static final String VIEW = "view"; 						//查看方法的返回字符串

	/**
	 * 在Action里面使用了Dao,似乎有点不妥,应该使用的是Service吧. 再者使用了HibernateDao,就绑定了只能使用Hibernate了.
	 * @uml.property  name="hibernateDao"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	@Qualifier("hibernateDao")
	protected HibernateDao hibernateDao;

	/**
	 * 在构造函数中利用反射机制获得参数T的具体类
	 */
	public StrutsAction(){
		this.entityClass = ReflectUtil.getClassGenricType(getClass());
	}

	/**
	 * ModelDriven接口定义的方法，返回实体对象
	 *
	 * ModelDriven和Preparable接口:struts.xml使用paramsPrepareParamsStack的原因.
	 * paramsPrepareParamsStack主要解决了ModelDriven和Preparable的配合问题，
	 * 这个stack的拦截器调用的顺序为：首先params，然后prepare，接下来modelDriven，最后再params。
	 */
	public T getModel() {
		return entity;
	}

	/**
	 * Preparable接口的方法，设置为空方法体是屏蔽它去拦截所有的方法,即屏蔽所有Action函数公共的二次绑定.
	 *
	 * Preparable接口的prepare()方法，会在action类的所有方法执行前执行
	 * 按照它的规则来写一些其它形式的prepare方法，例如aciton中有一个方法叫input(),那么我们可以实现一个prepareInput方法，这样在input()执行前，会自动先执行prepareInput()方法
	 */
	public void prepare() throws Exception {}

	/**
	 * Action的默认执行方法
	 */
	@Override
	public String execute() throws Exception{
		doListEntity();
		return SUCCESS;
	}

	/**
	 * 进入新增或修改页面
	 */
	@Override
	public String input() throws Exception{
		doInputEntity();
		return INPUT;
	}

	/**
	 * 进入查看页面
	 */
	public String view() throws Exception{
		doViewEntity();
		return VIEW;
	}

	/**
	 * 新增或修改
	 */
	public String save() throws Exception{
		doSaveEntity();
		return RELOAD;
	}

	/**
	 * 删除
	 */
	public String delete() throws Exception{
		doDeleteEntity();
		return RELOAD;
	}

	/**
	 * execute回调方法，处理进入主页面的相关逻辑，可在子类中覆盖此方法
	 */
	protected void doListEntity() throws Exception{
		list = hibernateDao.getAll(entityClass);
	}

	/**
	 * input回调方法，处理进入新增或修改页面前的相关逻辑，可在子类中覆盖此方法
	 */
	protected void doInputEntity() throws Exception{}

	/**
	 * view回调方法，处理进入查看页面的相关逻辑，可在子类中覆盖此方法
	 */
	protected void doViewEntity() throws Exception{}

	/**
	 * save回调方法，处理删除的相关逻辑，可在子类中覆盖此方法
	 */
	protected void doSaveEntity() throws Exception{
		try {
			hibernateDao.saveOrUpdate(entity);
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	/**
	 * delete回调方法，处理删除相关逻辑，可在子类中覆盖此方法
	 */
	protected void doDeleteEntity() throws Exception{
		try {
			hibernateDao.delete(entityClass,id);
		}catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	/**
	 * 在input()前执行二次绑定.
	 */
	public void prepareInput() throws Exception {
		prepareEntity();
	}

	/**
	 * 在save()前执行二次绑定.
	 */
	public void prepareSave() throws Exception {
		prepareEntity();
	}

	/**
	 * 在view()前执行二次绑定.
	 */
	public void prepareView() throws Exception {
		prepareEntity();
	}

	/**
	 * input进入修改页面时需要获取对象,回显数据;save保存时需要获取对象,保存数据;查看和进入修改页面一样需要回显数据.
	 * 等同于prepare()的内部函数,供prepareInput(),prepareSave(),prepareView()函数调用.
	 */
	protected void prepareEntity() throws Exception{
		if (id != null) {
			entity = (T)hibernateDao.get(entityClass,id);
		} else {
			entity = entityClass.newInstance();
		}
	}

	/**
	 * 页面列表显示的list
	 * @uml.property  name="list"
	 */
	public List getList() {
		return list;
	}

	/**
	 * 获取页面传递的id值
	 * @param id  主键ID
	 * @uml.property  name="id"
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 取得HttpSession函数
	 */
	public static HttpSession getSession() {
		return ServletActionContext.getRequest().getSession();
	}

	/**
	 * 取得HttpRequest函数.
	 */
	public static HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	/**
	 * 取得HttpResponse函数
	 */
	public static HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	/**
	 * 从Session中获取User对象
	 * @return
	 */
	public static User getUserFromSession(){
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user != null){
			return user;
		}
		return null;
	}
}
