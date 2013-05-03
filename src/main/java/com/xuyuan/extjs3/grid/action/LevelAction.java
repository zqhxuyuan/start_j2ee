package com.xuyuan.extjs3.grid.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.xuyuan.extjs3.ExtJSONActionSuport;
import com.xuyuan.extjs3.grid.bean.Level;
import com.xuyuan.extjs3.grid.service.ILevelService;

/**
 * http://blog.csdn.net/myloon/archive/2007/11/08/1873652.aspx
 *
 * http://localhost:8888/start_j2ee/extjs2/Level.jsp
 * http://localhost:8888/start_j2ee/LevelAjaxJsonData.action
 * @author Administrator
 *
 */
public class LevelAction extends ExtJSONActionSuport {
    private static final long serialVersionUID = 1L;

    /**
	 * @uml.property  name="level"
	 * @uml.associationEnd  
	 */
    private Level level;
    /**
	 * @uml.property  name="levels"
	 */
    private List<Level> levels = new ArrayList<Level>(0);

    /**
	 * @uml.property  name="levelService"
	 * @uml.associationEnd  
	 */
    private ILevelService levelService;

    /**
	 * @uml.property  name="delData"
	 */
    private String delData;

    public String execute() {
       return this.SUCCESS;
    }

    //删除后转到列表页面.查看列表页面.
    @Override
    public String jsonExecute() throws Exception {
    	//删除
       if (this.getDelData() != null && !"".equals(this.getDelData())) {
           if (this.getDelData().indexOf(",") < 0) {
        	   this.levelService.removeLevelById(Long.parseLong(this.getDelData()));
           } else {
              String id[] = this.getDelData().split(",");
              for (int i = 0; i < id.length; i++) {
                  this.levelService.removeLevelById(Long.parseLong(id[i]));
               }
           }
       }
       //显示列表
       HttpSession session = ServletActionContext.getRequest().getSession();
       Object o = session.getAttribute("Level_Data1");
       if (o == null) {
           try {
        	   //没有数据,查出列表所有数据
        	   this.levels = this.getLevelService().findAllLevels();
        	   //把levels数据全部放入Session中,显然不是好主意.当然这里只是模拟而已.
        	   session.setAttribute("Level_Data1", this.levels);
           	} catch (Exception e) {
        	   e.printStackTrace();
           	}
       } else {
    	   	//有数据,直接set进来.页面就能取出来
           	this.setLevels(((List<Level>) o));
       }
       //页面需要的JSON数据
       JSONArray array = JSONArray.fromObject(this.levels);
       this.setTotalCount(this.levels.size());
       this.setJsonString("{success:true,totalCount : " + this.getTotalCount() + ", list:" + array.toString() + "}");
       return super.jsonExecute();
    }

    public String findLevelById(Long id) {
       try {
           this.level = this.getLevelService().findLevelById(id);
       } catch (Exception e) {
           e.printStackTrace();
       }
       JSONArray array = JSONArray.fromObject(this.levels);
       this.setJsonString(array.toString());
       return SUCCESS;
    }

    public String findLevelById() {
       System.out.println(this.level.getLevelid());
       try {
           this.level = this.getLevelService().findLevelById(this.level.getLevelid());
       } catch (Exception e) {
           e.printStackTrace();
       }
       JSONArray array = JSONArray.fromObject(this.level);
       this.setJsonString(array.toString());
       this.setJsonString("{success:true,totalCount:1,list:" + array.toString() + "}");
       System.out.println(array.toString());
       return SUCCESS;
    }

    public String getAllLevels() {
       try {
           this.levels = this.getLevelService().findAllLevels();
       } catch (Exception e) {
           e.printStackTrace();
       }
       return SUCCESS;
    }

    public String persistLevel() {
       System.out.println(this.level.getLevelid() + "---" + this.level.getLevelname() + "---" + this.level.getDescription());
       this.setJsonString("{success:true}");
       try {
           this.getLevelService().persistLevel(this.getLevel());
       } catch (Exception e) {
           e.printStackTrace();
       }
       return SUCCESS;
    }

    public String removeLevel() {
       try {
           this.getLevelService().removeLevel(this.getLevel());
       } catch (Exception e) {
           e.printStackTrace();
       }
       return SUCCESS;
    }

    public String removeLevelById(Long id) {
       try {
           this.getLevelService().removeLevelById(id);
       } catch (Exception e) {
           e.printStackTrace();
       }
       return SUCCESS;
    }

    /**
	 * @return
	 * @uml.property  name="level"
	 */
    public Level getLevel() {
       return level;
    }

    /**
	 * @param level
	 * @uml.property  name="level"
	 */
    public void setLevel(Level level) {
       this.level = level;
    }

    public List<Level> getLevels() {
       return levels;
    }

    public void setLevels(List<Level> levels) {
       this.levels = levels;
    }

    /**
	 * @return
	 * @uml.property  name="levelService"
	 */
    public ILevelService getLevelService() {
       return levelService;
    }

    /**
	 * @param levelService
	 * @uml.property  name="levelService"
	 */
    public void setLevelService(ILevelService levelService) {
       this.levelService = levelService;
    }

    /**
	 * @return
	 * @uml.property  name="delData"
	 */
    public String getDelData() {
       return delData;
    }

    /**
	 * @param delData
	 * @uml.property  name="delData"
	 */
    public void setDelData(String delData) {
       this.delData = delData;
    }
}
