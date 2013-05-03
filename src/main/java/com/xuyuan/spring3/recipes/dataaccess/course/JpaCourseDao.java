package com.xuyuan.spring3.recipes.dataaccess.course;

import com.xuyuan.spring3.recipes.dataaccess.course.Course;
import com.xuyuan.spring3.recipes.dataaccess.course.CourseDao;

import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.persistence.*;

//@Repository("courseDao")
public class JpaCourseDao implements CourseDao {

	/**
	 * @uml.property  name="entityManagerFactory"
	 * @uml.associationEnd  readOnly="true"
	 */
	@PersistenceUnit
    private EntityManagerFactory entityManagerFactory;
    
	/**
	 * @uml.property  name="entityManager"
	 * @uml.associationEnd  readOnly="true" multiplicity="(0 -1)" elementType="com.xuyuan.spring3.recipes.dataaccess.course.Course"
	 */
	@PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public void store(Course course) {
        entityManager.merge(course);
    }

    @Transactional
    public void delete(Long courseId) {
        Course course = entityManager.find(Course.class, courseId);
        entityManager.remove(course);
    }

    @Transactional(readOnly = true)
    public Course findById(Long courseId) {
        return entityManager.find(Course.class, courseId);
    }

    @Transactional(readOnly = true)
    public List<Course> findAll() {
        Query query = entityManager.createQuery("from Course");

        return query.getResultList();
    }
}
