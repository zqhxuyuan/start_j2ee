package com.xuyuan.extjs3.grid.service;

import java.util.List;

import com.xuyuan.extjs3.grid.bean.Level;

public interface ILevelService {

	public Level findLevelById(Long id) throws Exception;

	public List<Level> findAllLevels() throws Exception;

	public void persistLevel(Level level) throws Exception;

	public void removeLevel(Level level) throws Exception;

	public void removeLevelById(Long id) throws Exception;
}
