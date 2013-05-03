package com.xuyuan.spring3.recipes.dataaccess.course;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.GregorianCalendar;
import java.util.List;


public class Main {
    
	@Test
	public void testHibernateXML(){
		CourseDao courseDao = new com.xuyuan.spring3.recipes.dataaccess.course.t7.HibernateCourseDao(); 
		//CourseDao courseDao = new com.xuyuan.spring3.recipes.dataaccess.course.jpa.JpaCourseDao(); 
		 
        Course course = new Course(); 
        course.setTitle("Core SpringIII"); 
        course.setBeginDate(new GregorianCalendar(2007, 8, 1).getTime()); 
        course.setEndDate(new GregorianCalendar(2007, 9, 1).getTime()); 
        course.setFee(1000); 
        courseDao.store(course); 
 
        List<Course> courses = courseDao.findAll(); 
        Long courseId = courses.get(courses.size()-1).getId(); 
 
        course = courseDao.findById(courseId); 
        System.out.println("Course Title: " + course.getTitle()); 
        System.out.println("Begin Date: " + course.getBeginDate()); 
        System.out.println("End Date: " + course.getEndDate()); 
        System.out.println("Fee: " + course.getFee()); 
 
        //courseDao.delete(courseId);
	}
	
	@Test
	public void testHibernateAnnotation(){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans.xml"); 
        //ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans-hibernate-t8.xml"); 
        //ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans-jpa-t8.xml"); 
        //ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans-hibernate-t9.xml");
        //ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans-hibernate-t10.xml");
        
        CourseDao courseDao = (CourseDao) context.getBean("courseDao");

        Course course = new Course();
        course.setTitle("Core Spring VII");
        course.setBeginDate(new GregorianCalendar(2007, 8, 1).getTime());
        course.setEndDate(new GregorianCalendar(2007, 9, 1).getTime());
        course.setFee(1000);
        courseDao.store(course);

        List<Course> courses = courseDao.findAll();
        Long courseId = courses.get(courses.size()-1).getId();

        course = courseDao.findById(courseId);
        System.out.println("Course Title: " + course.getTitle());
        System.out.println("Begin Date: " + course.getBeginDate());
        System.out.println("End Date: " + course.getEndDate());
        System.out.println("Fee: " + course.getFee());

        //courseDao.delete(courseId);
    }
}
