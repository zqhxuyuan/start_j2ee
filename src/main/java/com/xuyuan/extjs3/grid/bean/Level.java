package com.xuyuan.extjs3.grid.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
/**
 * http://blog.csdn.net/myloon/archive/2007/11/08/1873652.aspx
 * @author Administrator
 *
 */
@Entity
@Table(name = "ssh_ext_level")
public class Level implements java.io.Serializable {
    private Long levelid;
    private String levelname;
    private String description;
 
    public Level() {
    }
 
    public Level(Long levelid) {
       this.levelid = levelid;
    }
 
    public Level(Long levelid, String levelname, String description) {
       this.levelid = levelid;
       this.levelname = levelname;
       this.description = description;
    }
 
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)  由于id是在页面插入,如果要自动增长,可以使用ID生成策略,页面不需要输入id了.
    @Column(name = "LEVELID", unique = true, nullable = false, precision = 5, scale = 0)  
    public Long getLevelid() {
       return this.levelid;
    }
 
    public void setLevelid(Long levelid) {
       this.levelid = levelid;
    }
 
    @Column(name = "LEVELNAME", length = 64)
    public String getLevelname() {
       return this.levelname;
    }
 
    public void setLevelname(String levelname) {
       this.levelname = levelname;
    }
 
    @Column(name = "DESCRIPTION", length = 256)
    public String getDescription() {
       return this.description;
    }
 
    public void setDescription(String description) {
       this.description = description;
    }
}
