package com.xuyuan.spring3.recipes.dataaccess.course.t10;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

/**
 * 15-10. Persisting Objects with Hibernate’s Contextual Sessions
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

    @Transactional
    public void store(Course course) {
        sessionFactory.getCurrentSession().saveOrUpdate(course);
    }

    @Transactional
    public void delete(Long courseId) {
        Course course = (Course) sessionFactory.getCurrentSession().get(Course.class, courseId);
        sessionFactory.getCurrentSession().delete(course);
    }

    @Transactional(readOnly = true)
    public Course findById(Long courseId) {
        return (Course) sessionFactory.getCurrentSession().get(Course.class, courseId);
    }

    @Transactional(readOnly = true)
    public List<Course> findAll() {
        Query query = sessionFactory.getCurrentSession().createQuery("from Course");
        return query.list();
    }
}
