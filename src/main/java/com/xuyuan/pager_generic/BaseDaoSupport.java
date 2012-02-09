package com.xuyuan.pager_generic;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.xuyuan.pager_generic.model.PageModel;
import com.xuyuan.pager_generic.util.GenericsUtils;

/**
 * DAO层封装使用了泛型，包含常用的CURD和分页操作   
 * @author http://www.blogjava.net/lishunli/archive/2010/03/10/315055.html   传智播客巴巴运动网
 */
@SuppressWarnings("unchecked")
public abstract class BaseDaoSupport<T> extends HibernateDaoSupport implements BaseDao<T> {
	
	protected Class<T> entityClass = GenericsUtils.getSuperClassGenricType(this.getClass());	//User.class,用在查询的参数中传递
	protected String entityClassName = getEntityName(this.entityClass);							//User用在HQL查询语句中
	protected String keyFieldName = getKeyFieldName(this.entityClass);

	// 为父类HibernateDaoSupport注入sessionFactory的值
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void save(Object entity) {
		super.getHibernateTemplate().save(entity);
	}

	public void update(Object entity) {
		super.getHibernateTemplate().update(entity);
	}
	
	public void delete(Serializable... entityids) {
		for (Object id : entityids) {
			super.getHibernateTemplate().delete(find((Serializable) id));
		}
	}

	public T find(Serializable entityId) {
		if (null != entityId)
			return (T) super.getHibernateTemplate().get(entityClass, entityId);
		return null;
	}
	
	public List<T> findByEntity(Object entiey) {
		return super.getHibernateTemplate().findByExample(entiey);
	}

	public List<T> findByProperty(String propertyName, Object value) {
		String queryString = "from " + entityClassName + " o where o." + propertyName + "= ?";
		return super.getHibernateTemplate().find(queryString, value);
	}

	//---------------------------------------------------------
	/**
	 * 获取分页数据
	 * @param firstindex 	开始索引
	 * @param maxresult 	每页显示记录数
	 * @param wherejpql 	where语句
	 * @param queryParams 	查询参数
	 * @param orderby 		排序序列.多个排序字段
	 * @return 分页数据
	 */
	public PageModel<T> getScrollData(final int firstindex, final int maxresult, final String wherejpql, 
			final Object[] queryParams, final LinkedHashMap<String, String> orderby) {
		final PageModel<T> pageModel = new PageModel<T>();
		super.getHibernateTemplate().execute(new HibernateCallback<T>() {
			public T doInHibernate(Session session) throws HibernateException, SQLException {
				String hql = "from " + entityClassName + " o " + (wherejpql == null || "".equals(wherejpql.trim()) ? "" : " where " + wherejpql) + buildOrderby(orderby);
				Query query = session.createQuery(hql);
				setQueryParams(query, queryParams);		// where
				
				pageModel.setTotal(query.list().size());// first get size
				if (firstindex != -1 && maxresult != -1)
					query.setFirstResult(firstindex).setMaxResults(maxresult);// last page
				pageModel.setList(query.list());
				return null;
			}
		});
		return pageModel;
	}

	/**
	 * 分页重载:没有排序
	 */
	public PageModel<T> getScrollData(int firstindex, int maxresult, String wherejpql, Object[] queryParams) {
		return getScrollData(firstindex, maxresult, wherejpql, queryParams, null);
	}

	/**
	 * 分页重载:有排序,没有查询条件
	 */
	public PageModel<T> getScrollData(final int firstindex, final int maxresult, final LinkedHashMap<String, String> orderby) {
		return getScrollData(firstindex, maxresult, null, null, orderby);
	}

	/**
	 * 分页重载:没有排序,没有查询条件.
	 */
	public PageModel<T> getScrollData(final int firstindex, final int maxresult) {
		return getScrollData(firstindex, maxresult, null, null, null);
	}

	/**
	 * 不分页,查出所有.
	 */
	public PageModel<T> getScrollData() {
		return getScrollData(-1, -1, null, null, null);
	}
	/**
	 * 所有数据.没有查询条件的总记录数.如果带上查询条件. getCount方法没能处理查询条件.
	 * getScrollData()  +  getCount() 
	 */
	public int getCount() {
		String hql = "select count( " + keyFieldName + ") from " + entityClassName;
		//或者from entityClassName; 然后list.size
		//String hql = "select count(*) from " + entityClassName;
		int count = Integer.parseInt(super.getHibernateTemplate().find(hql).get(0).toString());
		return count;
	}
	
	//---------------------------------------------------------
	/**
	 * 获取实体的名称
	 * @param clazz 实体类 User.class->User
	 */
	public static <T> String getEntityName(Class<T> clazz) {
		String entityname = clazz.getSimpleName();
		Entity entity = clazz.getAnnotation(Entity.class);
		if (entity.name() != null && !"".equals(entity.name())) {
			entityname = entity.name();
		}
		return entityname;
	}

	/**
	 * 获取实体的主键
	 * @return 主键名
	 */
	protected static <T> String getKeyFieldName(Class<T> clazz) {
		try {
			PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
			for (PropertyDescriptor propertydesc : propertyDescriptors) {
				Method method = propertydesc.getReadMethod();
				if (null != method && null != method.getAnnotation(javax.persistence.Id.class)) {
					return propertydesc.getName();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "id";
	}

	/**
	 * 设置HQL里边的属性值
	 * @param query
	 * @param queryParams
	 */
	protected static void setQueryParams(Query query, Object[] queryParams) {
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i, queryParams[i]);// 从0开始
			}
		}
	}

	/**
	 * 组装order by语句
	 * @param orderby
	 */
	protected static String buildOrderby(LinkedHashMap<String, String> orderby) {
		StringBuffer orderbyql = new StringBuffer("");
		if (orderby != null && orderby.size() > 0) {
			orderbyql.append(" order by ");
			for (String key : orderby.keySet()) {
				orderbyql.append("o.").append(key).append(" ").append(orderby.get(key)).append(",");
			}
			orderbyql.deleteCharAt(orderbyql.length() - 1);
		}
		return orderbyql.toString();
	}

	/**
	 * 没用到.
	 */
	protected static <T> String getCountField(Class<T> clazz) {
		String out = "o";
		try {
			PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(clazz).getPropertyDescriptors();
			for (PropertyDescriptor propertydesc : propertyDescriptors) {
				Method method = propertydesc.getReadMethod();
				if (method != null && method.isAnnotationPresent(EmbeddedId.class)) {
					PropertyDescriptor[] ps = Introspector.getBeanInfo(propertydesc.getPropertyType()).getPropertyDescriptors();
					out = "o." + propertydesc.getName() + "." + (!ps[1].getName().equals("class") ? ps[1] .getName() : ps[0].getName());
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return out;
	}
}
