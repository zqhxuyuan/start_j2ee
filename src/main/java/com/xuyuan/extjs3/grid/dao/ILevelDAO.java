package com.xuyuan.extjs3.grid.dao;

import java.util.List;

import com.xuyuan.extjs3.grid.bean.Level;

public interface ILevelDAO {

	public Level findLevelById(Long id);
	
    public List<Level>  findAllLevels();
    
    public void persistLevel(Level level);
    
    public void removeLevel(Level level);
    
    public void removeById(Long id);
    
}
