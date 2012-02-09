package com.xuyuan.ssh.service.base;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xuyuan.ssh.dao.base.RoleDao;
import com.xuyuan.ssh.entity.base.Role;

@Service
public class RoleManager {

	@Autowired
	private RoleDao roleDao;
	
	public List<Role> getAllRoles(){
		return roleDao.getAll();
	}
	
	public Role getRole(Serializable id){
		return roleDao.get(id);
	}
}
