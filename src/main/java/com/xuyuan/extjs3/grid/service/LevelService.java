package com.xuyuan.extjs3.grid.service;

import java.util.List;

import com.xuyuan.extjs3.grid.bean.Level;
import com.xuyuan.extjs3.grid.dao.ILevelDAO;

public class LevelService implements ILevelService {

    /**
	 * @uml.property  name="dao"
	 * @uml.associationEnd  
	 */
    private ILevelDAO dao;

//    private static final String SERVICE_BEAN_ID = "levelService";
//    public static ILevelService getInstance(ApplicationContext context) {
//    	return (ILevelService) context.getBean(SERVICE_BEAN_ID);
//    }

    public Level findLevelById(Long id) throws Exception {
       try {
           return dao.findLevelById(id);
       } catch (RuntimeException e) {
           throw new Exception("findLevelById failed with the id " + id + ": " + e.getMessage());
       }
    }
    public void persistLevel(Level level) throws Exception {
       try {
           dao.persistLevel(level);
       } catch (RuntimeException e) {
           throw new Exception("persistLevel failed: " + e.getMessage());
       }
    }
    public void removeLevel(Level level) throws Exception {
       try {
           dao.removeLevel(level);
       } catch (RuntimeException e) {
           throw new Exception("removeLevel failed: " + e.getMessage());
       }
    }
    public void removeLevelById(Long id) throws Exception {
       try {
           dao.removeById(id);
       } catch (RuntimeException e) {
           throw new Exception("removeLevel failed: " + e.getMessage());
       }
    }
	public List<Level> findAllLevels() throws Exception {
		return dao.findAllLevels();
	}

    /**
	 * @param dao
	 * @uml.property  name="dao"
	 */
    public void setDao(ILevelDAO dao) {
        this.dao = dao;
    }
    /**
	 * @return
	 * @uml.property  name="dao"
	 */
    public ILevelDAO getDao() {
        return this.dao;
    }
}