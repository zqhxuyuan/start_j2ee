package com.xuyuan.extjs3.tree.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.xuyuan.extjs3.base.BaseDaoImpl;
import com.xuyuan.extjs3.tree.bean.Exttree;
import com.xuyuan.extjs3.tree.bean.Tree;

public class TreeDaoImpl<T extends Tree> extends BaseDaoImpl<T> implements TreeDao<T>{

	//1.直接继承BaseDaoImpl,applicationContext_ssh.xml中treeDao直接注入sessionFactory.
	//2.将BaseDao接口作为Dao实现类的一个属性注入.
//	private BaseDao<T> dao;
//	public void setDao(BaseDao<T> dao) {
//		this.dao = dao;
//	}

	/**
	 * @author hoojo
	 */
	public List<T> getTreeListByParentId(T entity) throws Exception {
		String hql = "select new com.xuyuan.extjs3.tree.bean.Tree(categoryname, id, nodeid, pid, nodelevel) from Sort where show = 1";
		if (entity == null || entity.getNodeid() == null || "".equals(entity.getNodeid())) {
			hql += " and pid is null";
		} else {
			hql += " and pid = '" + entity.getNodeid() + "'";
		}
		//return dao.getList(hql);
		return this.getList(hql);
	}
	//---------------------------------------------------------------

	/**
	 * 查找
	 * @author BruceLeey
	 */
	public Exttree findById(Long id) throws Exception {
        List<Exttree> list = this.getHibernateTemplate().find("from Exttree where id=?", id);
        return list.size() >= 1 ? list.get(0) : null;
    }
    public List<Exttree> findChildById(Long parentId) throws Exception {
    	System.out.println("parentid:::::::::::::::::::::::::::::::::"+ parentId);
        return this.getHibernateTemplate().find("from Exttree where parentId=?", parentId);
    }

    /**
     * 保存/更新
     */
    public void save(Exttree node) throws Exception {
        this.getHibernateTemplate().save(node);
    }
    public void modify(Exttree node) throws Exception {
        this.getHibernateTemplate().merge(node);  //相当于SaveOrUpdate
    }
    public void modifyBySQL(String sql) throws Exception {
//        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
//        Transaction tm = session.beginTransaction();
//        tm.begin();
//        Query query = session.createSQLQuery(sql);	//createSQLQuery:SQL语句
//        query.executeUpdate();
//        tm.commit();
    	this.sqlQuery(sql);
    }

    /**
     * 删除
     */
    public void removeChildById(Exttree node) throws Exception {
    	//this.getHibernateTemplate().delete("delete from Exttree where id=?", node.getId());
    	//this.getHibernateTemplate().delete(node);

        String hql = "delete from Exttree where id=" + node.getId();
        this.hqlQuery(hql);
//        Session session = this.getHibernateTemplate().getSessionFactory().openSession();
//        Transaction tm = session.beginTransaction();
//        tm.begin();
//        Query query = session.createQuery(hql);		//createQuery:SQL语句?
//        query.executeUpdate();
//        tm.commit();
    }
    public void ajaxRemoveNode(Long id) throws Exception {
        List<Exttree> list = this.findChildById(id);
        for (Exttree object : list) { // 移除子节点
            ajaxRemoveNode(object.getId());//递归移除节点下的所有节点
        }
        Exttree tree = new Exttree(); // 需改进
        tree.setId(id);
        this.removeChildById(tree); // 父节点始终会移除
    }

    public void hqlQuery(String hql){
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
        Transaction tm = session.beginTransaction();
        tm.begin();
        Query query = session.createQuery(hql);
        query.executeUpdate();
        tm.commit();
    }
    public void sqlQuery(String sql){
    	Session session = this.getHibernateTemplate().getSessionFactory().openSession();
    	Transaction tm = session.beginTransaction();
    	tm.begin();
    	Query query = session.createSQLQuery(sql);
    	query.executeUpdate();
    	tm.commit();
    }
}

