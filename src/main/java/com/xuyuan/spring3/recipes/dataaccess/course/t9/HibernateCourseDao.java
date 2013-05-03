package com.xuyuan.spring3.recipes.dataaccess.course.t9;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

/**
 * 15-9. Persisting Objects with Spring’s ORM Templates
 * 					<- TransactionManager （事务控制使用注解，不再使用编程方式手动写了）
 *  SessionFactory  
 *					<- HibernateTemplate	<- HibernateCourseDao
 *
 *  继承HibernateDaoSupport，使用getHibernateTemplate()获取HibernateTemplate对象。Dao仍然注入SessionFactory对象
 *  SessionFactory  <- HibernateCourseDao
 *  
 */
public class HibernateCourseDao implements CourseDao {
	
	/**
	 * @uml.property  name="hibernateTemplate"
	 * @uml.associationEnd  
	 */
	private HibernateTemplate hibernateTemplate; 
	 
    /**
	 * @param hibernateTemplate
	 * @uml.property  name="hibernateTemplate"
	 */
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate; 
    } 
    
    @Transactional 
    public void store(Course course) { 
        hibernateTemplate.saveOrUpdate(course); 
    } 
 
    @Transactional 
    public void delete(Long courseId) { 
        Course course = (Course) hibernateTemplate.get(Course.class, courseId); 
        hibernateTemplate.delete(course); 
    } 
 
    @Transactional(readOnly = true) 
    public Course findById(Long courseId) { 
        return (Course) hibernateTemplate.get(Course.class, courseId); 
    } 
 
    @Transactional(readOnly = true) 
    public List<Course> findAll() { 
        return hibernateTemplate.find("from Course"); 
    } 
}
