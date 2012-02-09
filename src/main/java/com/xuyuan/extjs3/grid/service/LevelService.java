package com.xuyuan.extjs3.grid.service;

import java.util.List;

import com.xuyuan.extjs3.grid.bean.Level;
import com.xuyuan.extjs3.grid.dao.ILevelDAO;

//@Component("levelService")
public class LevelService implements ILevelService {
	
    private ILevelDAO dao;
    //@Resource(name = "dao")
	//private LevelDAO dao;
    
//  private static final String SERVICE_BEAN_ID = "levelService";
//  public static ILevelService getInstance(ApplicationContext context) {
//  return (ILevelService) context.getBean(SERVICE_BEAN_ID);
//}
    public LevelService() {
       super();
    }
    
    public Level findLevelById(Long id) throws Exception {
       try {
           return getDao().findLevelById(id);
       } catch (RuntimeException e) {
           throw new Exception("findLevelById failed with the id " + id + ": " + e.getMessage());
       }
    }
    
    public void persistLevel(Level level) throws Exception {
       try {
           getDao().persistLevel(level);
       } catch (RuntimeException e) {
           throw new Exception("persistLevel failed: " + e.getMessage());
       }
    }
    public void removeLevel(Level level) throws Exception {
       try {
           getDao().removeLevel(level);
       } catch (RuntimeException e) {
           throw new Exception("removeLevel failed: " + e.getMessage());
       }
    }
    public void removeLevelById(Long id) throws Exception {
       try {
           getDao().removeById(id);
       } catch (RuntimeException e) {
           throw new Exception("removeLevel failed: " + e.getMessage());
       }
    }
 
    public void setDao(ILevelDAO dao) {
       this.dao = dao;
    }
    public ILevelDAO getDao() {
       return this.dao;
    }
    
	public List<Level> findAllLevels() throws Exception {
		return getDao().findAllLevels();
	}

	/**
	public List<Level> findLevelsByExample(Level level) throws Exception {
		return null;
	}
	*/
}
