package com.xuyuan.spring3.recipes.dataaccess.course.t7;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

public class JpaCourseDao implements CourseDao { 
	 
    /**
	 * @uml.property  name="entityManagerFactory"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="com.xuyuan.spring3.recipes.dataaccess.course.Course"
	 */
    private EntityManagerFactory entityManagerFactory; 
 
    public JpaCourseDao() { 
        entityManagerFactory = Persistence.createEntityManagerFactory("course"); 
    } 
    
    public void store(Course course) { 
        EntityManager manager = entityManagerFactory.createEntityManager(); 
        EntityTransaction tx = manager.getTransaction(); 
        try { 
            tx.begin(); 
            manager.merge(course); 
            tx.commit(); 
        } catch (RuntimeException e) { 
            tx.rollback(); 
            throw e; 
        } finally { 
            manager.close(); 
        } 
    } 
    
    public void delete(Long courseId) { 
        EntityManager manager = entityManagerFactory.createEntityManager(); 
        EntityTransaction tx = manager.getTransaction(); 
        try { 
            tx.begin(); 
            Course course = manager.find(Course.class, courseId); 
            manager.remove(course); 
            tx.commit(); 
        } catch (RuntimeException e) { 
            tx.rollback(); 
            throw e; 
        } finally { 
            manager.close(); 
        } 
    } 
 
    public Course findById(Long courseId) { 
        EntityManager manager = entityManagerFactory.createEntityManager(); 
        try { 
            return manager.find(Course.class, courseId); 
        } finally { 
            manager.close(); 
        } 
    } 
 
    public List<Course> findAll() { 
        EntityManager manager = entityManagerFactory.createEntityManager(); 
        try { 
            Query query = manager.createQuery("select course from Course course"); 
            return query.getResultList(); 
        } finally { 
            manager.close(); 
        } 
    } 
}
