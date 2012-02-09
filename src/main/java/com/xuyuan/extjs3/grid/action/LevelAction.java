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
 * *****Ext Grid CRUD DEMO:*****
 * 从Bean到Dao,再到Service,代码其实很好理解.主要是LevelAction这里的一些属性.以及ExtJSONActionSupport.
 * ExtJsonActionSupport其实主要是定义了jsonstring以及分页信息.这些信息一般Action都要有的.所以抽取出来.
 * jsonstring主要是为了在Action中得到Json字符串,这样Ext就可以利用这个JSON字符串得到数据集,构造Grid.
 * 
 * http://localhost:8080/start_j2ee/LevelAjaxJsonData.action  
 * 应该能看到打印的Json数据[关于JSON可以查看struts2/json的例子]
 * JSON数据在jsonExecute()中定义.当然可以按照自己的方式.比如:{success:true,count:xx,chidren:[{},{}]}
 	{success:true, totalCount:5, list:[
 		{"description":"222","levelid":2,"levelname":"2222"},
 		{"description":"333","levelid":33,"levelname":"33333"}
 	]}

 * 添加后如果出现'正在保存数据，稍后...' 而且数据库也插入了数据,那么可能是json_struts2.jsp你引用成别的了.
 * @final 合并至ssh项目中,否则如果一起加载applicationContext_ssh.xml,applicationContext_hib.xml会有意外的错误.
 * @author Administrator
 *
 */
public class LevelAction extends ExtJSONActionSuport {
    private static final long serialVersionUID = 1L;
    
    private Level level;
    private List<Level> levels = new ArrayList<Level>(0);
   
    private ILevelService levelService;
    //@Resource(name = "levelService")
    //private LevelService levelService;
    
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
               System.out.println("del_id:" + getDelData());
           } else {
              String id[] = this.getDelData().split(",");
              for (int i = 0; i < id.length; i++) {
                  System.out.println("del:" + id[i]);
                  this.levelService.removeLevelById(Long.parseLong(id[i]));
               }
           }
       }
       //显示列表
       HttpSession session = ServletActionContext.getRequest().getSession();
       Object o = null;// session.getAttribute("Level_Data1");
       if (o == null) {
           try {
        	   //没有数据,查出列表所有数据
              this.levels = this.getLevelService().findAllLevels();
              //把levels数据全部放入Session中,显然不是好主意.当然这里只是模拟而已.
              session.setAttribute("Level_Data1", this.levels);
              System.out.println("query database");
           } catch (Exception e) {
              e.printStackTrace();
           }
       } else {
    	   //有数据,直接set进来.页面就能取出来
           this.setLevels(((List<Level>) o));
       }
       //页面需要的JSON数据
       this.setTotalCount(this.levels.size());
       JSONArray array = JSONArray.fromObject(this.levels);
       System.out.println(this.getStart() + "---" + this.getLimit());
       this.setJsonString("{success:true,totalCount : " + this.getTotalCount() + ", list:" + array.toString() + "}");
       System.out.println("jsonstring--" +this.getJsonString());
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
 
    public Level getLevel() {
       return level;
    }
 
    public void setLevel(Level level) {
       this.level = level;
    }
 
    public List<Level> getLevels() {
       return levels;
    }
 
    public void setLevels(List<Level> levels) {
       this.levels = levels;
    }
 
    public ILevelService getLevelService() {
       return levelService;
    }
 
    public void setLevelService(ILevelService levelService) {
       this.levelService = levelService;
    }
 
    public String getDelData() {
       return delData;
    }
 
    public void setDelData(String delData) {
       this.delData = delData;
    }
}
