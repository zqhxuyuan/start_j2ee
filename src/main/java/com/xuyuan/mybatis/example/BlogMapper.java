package com.xuyuan.mybatis.example;

import org.apache.ibatis.annotations.Select;

public interface BlogMapper {
	
	//@Select("SELECT * FROM blog WHERE id = #{id}")
	Blog selectBlog(int id);
}