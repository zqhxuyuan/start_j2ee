package com.xuyuan.spring3.recipes.dataaccess.course;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("courseDao")
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
    @Autowired
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
