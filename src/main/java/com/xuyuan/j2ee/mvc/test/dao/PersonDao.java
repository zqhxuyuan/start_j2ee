package com.xuyuan.j2ee.mvc.test.dao;

import java.util.ArrayList;
import java.util.List;

import com.xuyuan.j2ee.ioc.annotation.Dao;

@Dao  
public class PersonDao{  
  
    public List<String> findAll(){  
        List<String> list = new ArrayList<String>();  
        list.add("zhao");  
        list.add("jun");  
        list.add("liu");  
        list.add("zhen");  
        return list;  
    }  
}  
