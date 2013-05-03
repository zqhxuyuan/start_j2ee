package com.xuyuan.mybatis.example;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.ibatis.common.resources.Resources;

public class HelloWorld {

	public static void main(String[] args) throws IOException {
		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			/**
			 * 使用配置文件
			 * 1. mybatis-config.xml
			 * 2. 根据selectOne的第一个参数值，寻找<mappers>中所有加载的资源文件的namespace
			 * 3. 发现BlogMapper.xml的namespace符合com.xuyuan.mybatis.example.BlogMapper
			 * 4. 对应这个文件的selectBlog子标签，执行其中的SQL
			 */
			Blog blog = (Blog) session.selectOne("com.xuyuan.mybatis.example.BlogMapper.selectBlog", 1);
			System.out.println(blog.getTitle());
		
			/**
			 * 使用Mapper接口第一种方式：
			 * 1. mybatis-config.xml
			 * 2. 根据getMapper的参数类型，寻找<mappers>中所有加载的资源文件的namespace
			 * 3. 发现BlogMapper.xml的namespace=com.xuyuan.mybatis.example.BlogMapper符合参数类型BlogMapper
			 * 4. getMapper返回BlogMapper接口类型，接口调用的方法名，对应寻找到的资源文件的子标签，这里是selectBlog
			 * 5. 接口调用方法，相当于执行子标签中的SQL
			 * 
			 * 使用Mapper接口第二种方式：
			 * 1. mybatis-config.xml
			 * 2. 根据getMapper的参数类型，寻找<mappers>中所有加载的资源文件的namespace
			 * 3. 发现BlogMapper.xml的namespace符合参数类型，注意：BlogMapper.xml中不要编写任何子标签
			 * 4. 把SQL语句作为注解方式写在BlogMapper接口上
			 * 5. 接口调用方法，会执行对应方法的注解上的SQL语句
			 * 注意：BlogMapper.xml和BlogMapper接口只能有一个地方写上SQL！
			 */
			BlogMapper mapper = session.getMapper(BlogMapper.class);
			Blog blog2 = mapper.selectBlog(2);
			System.out.println(blog2.getTitle());
		} finally {
			session.close();
		}
		
	}
}
