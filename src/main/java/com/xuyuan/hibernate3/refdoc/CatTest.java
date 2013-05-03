package com.xuyuan.hibernate3.refdoc;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;

import com.xuyuan.hibernate3.tutorial.util.HibernateUtil;

public class CatTest {

	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        Cat cat = new Cat("皇阿玛", new Date());
        
        Color color = new Color("正宗的");
        cat.setColor(color);
        
        Cat cat1 = new Cat("大爷",new Date());
        Cat cat2 = new Cat("二爷",new Date());
        Cat cat3 = new Cat("三爷",new Date());
        Cat cat4 = new Cat("三爷的儿子",new Date());
        cat.addKitten(cat1);
        cat.addKitten(cat2);
        cat.addKitten(cat3);
        cat4.setMother(cat3);

        session.save(color);
        long boss = (Long)session.save(cat);
        session.save(cat1);
        session.save(cat2);
        session.save(cat3);
        session.save(cat4);
        session.getTransaction().commit();
        
        session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        
        List<Cat> cats = session.createQuery("from Cat").list();
        for(Cat c : cats){
        	Cat mother = c.getMother();
        	if(null != mother)
        		System.out.println("	" + c.getName() + " <<<<" + mother.getName());
        	else
        		System.out.println(c.getName());
        }
        
        Cat bigBoss = (Cat)session.load(Cat.class, boss);
        System.out.println("---------------------------");
        System.out.println(bigBoss.getName());
        Set<Cat> kitt = bigBoss.getKittens();
        for(Cat c : kitt){
        	System.out.println("	" + c.getName());
        }
        
        
        session.getTransaction().commit();   
	}
}
