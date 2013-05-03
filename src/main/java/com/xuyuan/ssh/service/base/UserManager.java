package com.xuyuan.ssh.service.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuyuan.ssh.dao.base.UserDao;
import com.xuyuan.ssh.entity.base.User;

@Service
public class UserManager {

	/**
	 * @uml.property  name="userDao"
	 * @uml.associationEnd  readOnly="true"
	 */
	@Autowired
	private UserDao userDao;
	
	public User getUser(Serializable id){
		//userDao.get(User.class, id);
		return userDao.get(id);
	}

	public User getUser(String username,String password){
		List<User> list = userDao.getUser(username,password);
		return list.isEmpty() ? null : list.get(0);
	}
	
	public List queryResult(HttpServletRequest request){
		List<Criterion> criterions = new ArrayList<Criterion>();
		String name = request.getParameter("username");
		if(StringUtils.isNotBlank(name))
			criterions.add(Restrictions.like("username",name,MatchMode.ANYWHERE));
		String role_id = request.getParameter("role_id");
		if(StringUtils.isNotBlank(role_id))
			criterions.add(Restrictions.eq("role.id",Integer.valueOf(role_id)));
		return userDao.query(criterions.toArray(new Criterion[criterions.size()]));
	}
	
}
