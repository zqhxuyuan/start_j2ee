package com.xuyuan.extjs3.grid.dao;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xuyuan.extjs3.grid.bean.Level;
public class LevelDAO extends HibernateDaoSupport  implements ILevelDAO {
    public LevelDAO() {
       super();
    }
    
    public Level findLevelById(Long id) {
       return (Level) getHibernateTemplate().get(Level.class, id);
    }
    
    public List<Level> findAllLevels() {
       return getHibernateTemplate().loadAll(Level.class);// .find("from Level o");//
    }
    
    public void persistLevel(Level level) {
       getHibernateTemplate().saveOrUpdate(level);
    }
    
    public void removeLevel(Level level) {
       getHibernateTemplate().delete(level);
    }
 
    public void removeById(final Long id) {
       this.getHibernateTemplate().execute(new HibernateCallback() {
           public Object doInHibernate(Session session) {
              session.createQuery("delete from Level o where o.levelid=" + id + "").executeUpdate();
              return 1;
           }
       });
    }
}
