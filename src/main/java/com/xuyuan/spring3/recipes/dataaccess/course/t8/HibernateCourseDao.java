package com.xuyuan.spring3.recipes.dataaccess.course.t8;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

/**
 * 事务控制都用API编程方式; sessionFactory通过注入方式，注入Dao
 * 
 * SessionFactory  <- HibernateCoureseDao
 */
public class HibernateCourseDao implements CourseDao { 
	 
    /**
	 * @uml.property  name="sessionFactory"
	 * @uml.associationEnd  
	 */
    private SessionFactory sessionFactory; 
 
    /**
	 * @param sessionFactory
	 * @uml.property  name="sessionFactory"
	 */
    public void setSessionFactory(SessionFactory sessionFactory) { 
        this.sessionFactory = sessionFactory; 
    }
 
    public void store(Course course) { 
        Session session = sessionFactory.openSession(); 
        Transaction tx = session.getTransaction(); 
        try { 
            tx.begin(); 
            session.saveOrUpdate(course); 
            tx.commit(); 
        } catch (RuntimeException e) { 
            tx.rollback(); 
            throw e;
        } finally { 
            session.close(); 
        } 
    } 
    
    public void delete(Long courseId) { 
        Session session = sessionFactory.openSession(); 
        Transaction tx = session.getTransaction(); 
        try { 
            tx.begin(); 
            Course course = (Course) session.get(Course.class, courseId); 
            session.delete(course); 
            tx.commit(); 
        } catch (RuntimeException e) { 
            tx.rollback(); 
            throw e; 
        } finally { 
            session.close(); 
        } 
    } 
    
    public Course findById(Long courseId) { 
        Session session = sessionFactory.openSession(); 
        try { 
            return (Course) session.get(Course.class, courseId); 
        } finally { 
            session.close(); 
        } 
    } 
    
    public List<Course> findAll() { 
        Session session = sessionFactory.openSession(); 
        try { 
            Query query = session.createQuery("from Course"); 
            return query.list(); 
        } finally { 
            session.close(); 
        } 
    }
}
