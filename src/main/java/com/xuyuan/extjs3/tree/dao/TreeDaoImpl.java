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
	 * 将Sort对象的查询到的数据封装在Ext认识的Tree对象中
	 *
	 * 看看这条HQL语句,可以先分解成 select * from Sort 也就是说我们要的数据来自Sort这张表.
	 * 查询后如果按照一般的HQL语句,返回的应该是个Sort对象吧.因为from Sort.但是我们要把Sort对象转为Ext认识的Tree对象.
	 *
	 * 所以,我们在select * 这个* 中转为Tree对象.
	 * Tree对象需要的属性有: Tree(String text, Integer id, Integer nodeid, Integer pid,Integer nodelevel)
	 * 就要求Sort中和Tree的对应上  categoryname,        id,          nodeid,         pid,       nodelevel
	 *
	 * 这里我们可以看出Sort对象的categoryname属性和Tree的text属性是对应的.其他依次类推.
	 *
	 * HQL可以这么理解: select categoryname,id,nodeid,pid,nodelevele from Sort where show=1
	 * 然后把查询出来的对象(Object,因为不是完整的Sort对象) 转为Tree对象.
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

	/**
	 * 查找
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

