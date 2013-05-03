package com.xuyuan.cache.ehcache.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.criterion.Criterion;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.hibernate3.util.HibernateUtil;
import com.xuyuan.ssh.dao.base.UserDao;
import com.xuyuan.ssh.entity.base.User;
import com.xuyuan.ssh.service.base.UserManager;

/**
 * http://www.cnblogs.com/hoojo/archive/2012/07/12/2587941.html
 * Spring+Hibernate3+EHCache
 * Hibernate4+EHCache版本采用hibernate-ehcache，不采用ehcache了
 * 
 * 1. applicationContext_ssh.xml添加配置
 * 		<prop key="hibernate.cache.use_query_cache">true</prop>
 * 		<prop key="hibernate.cache.use_second_level_cache">true</prop>
 *  	<prop key="hibernate.cache.provider_class">net.sf.ehcache.hibernate.EhCacheProvider</prop>
 * 2. 在获取Criteria的时候设置缓存属性为true
 * 		criteria.setCacheable(true);
 *    HibernateDao中有两个方法要设置：
 *  	public Criteria createCriteria(final Class clazz)
 *  	public Criteria createCriteria(final Class clazz, final Criterion... criterions)
 * 3. 因为采用注解方式配置实体，在实体类上加上注解：
 * 		@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
 * 4. 运行测试方法testGetAllUserFromCache，发现第一次查询会打印SQL，第二次则没有打印，说明第二次从缓存中获取数据
 * 5. 页面测试
 * 	  	登录系统后，点击User，第一次会打印HibernateSQL语句，接下来点击User都不会再打印SQL了。
 *   	点击Role链接也不会打印SQL，因为查询User时也查询了Role，再次点击就是从缓存中取了。
 *   	如果新增加User，则查询时会重新查询一次。因为Hibernate对于更新操作会清空所有缓存。
 */
public class HibernateCacheTest {

	private static UserManager userManager;
	private static UserDao userDao;
	
	@Before
	public void setUp() throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext_ssh.xml");
		userManager = (UserManager)context.getBean("userManager");
		userDao = (UserDao)context.getBean("userDao");
	}
	
	@Test
	public void testGetAllUserFromCache(){
		List<User> users = userDao.getAll(User.class);
		for(User u : users){
			System.out.print(u.getUsername() + " ");
		}
		
		System.out.println("\n从缓存中获取数据，而不是从数据库，下面的查询并没有打印出Hibernate的查询语句===========");
		users = userDao.getAll(User.class);
		for(User u : users){
			System.out.print(u.getUsername() + " ");
		}
	}
	
	/**
	 * 如果更新了数据库中的数据，Hibernate会清空缓存，再次查询时，就会重新查询一次。
	 */
	@Test
	public void testUpdateCache(){
		// db
		List<User> users = userDao.getAll(User.class);
		// cache
		users = userDao.getAll(User.class);
		
		// insert
		User user = new User();
		user.setUsername("test33");
		user.setPassword("test33");
		userDao.saveOrUpdate(user);

		// db
		users = userDao.getAll(User.class);
		for(User u : users){
			System.out.print(u.getUsername() + " ");
		}
		// cache
		users = userDao.getAll(User.class);
	}
	
	public void testUseHibernateConfig(){
		Session s = HibernateUtil.getSession();
		Criteria c = s.createCriteria(User.class);
		c.setCacheable(true);//这句必须要有
		System.out.println("第一次读取");
		List<User> users = c.list();
		System.out.println(users.size());
		HibernateUtil.closeSession(s);
		 
		s = HibernateUtil.getSession();
		c = s.createCriteria(User.class);
		c.setCacheable(true);//这句必须要有
		System.out.println("第二次读取");
		users = c.list();
		System.out.println(users.size());
		HibernateUtil.closeSession(s);
	}
}
