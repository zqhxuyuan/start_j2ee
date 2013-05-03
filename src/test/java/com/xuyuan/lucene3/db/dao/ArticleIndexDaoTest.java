package com.xuyuan.lucene3.db.dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.xuyuan.lucene3.db.model.Article;
import com.xuyuan.lucene3.db.model.QueryResult;

public class ArticleIndexDaoTest {

	/**
	 * @uml.property  name="dao"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	ArticleIndexDao dao = new ArticleIndexDao();

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSave() throws Exception {
		Article article = new Article();
		article.setId(1);
		article.setTag("wjh");
		article.setTitle("wjh上天山");
		article.setContent("据悉，文建华已于昨日抵达天山。高歌一曲HelloWorld");

		dao.save(article);
	}

	@Test
	public void testBatchSave() throws Exception{
		List<Article> list = new ArrayList<Article>();
		for(int i=2; i<50; i++) {
			Article article = new Article();
			article.setId(i);
			article.setTag("wjh");
			article.setTitle("wjh上天山第" + i + "集");
			article.setContent("据悉，wjh已于昨日抵达天山。高歌"+ i +"曲 HelloWorld");
			list.add(article);
		}
		dao.batchSave(list);
	}

	@Test
	public void testDelete() throws Exception{
		Article article = new Article();
		article.setId(1);
		dao.delete(article);
	}

	@Test
	public void testUpdate() throws Exception{
		Article article = new Article();
		article.setId(1);
		article.setTag("wjh");
		article.setTitle("xuyuan上天山");
		article.setContent("wjh已于昨日抵达天山。高歌一曲HelloWorld");
		dao.update(article);
	}

	@Test
	public void testSearchAll() throws Exception{
		//单个字段 VS 多个字段
		//List<Article> list = dao.searchAll("HelloWorld", "title");
		List<Article> list = dao.searchAll("xuyuan", new String[]{"title","content"});

		this.printResult(list,list.size());
	}

	@Test
	public void testSearch() throws Exception{
		QueryResult queryResult = dao.search("HelloWorld", 0, 10); //模拟分页测试
		List<Article> list = queryResult.getAtrticle();

		this.printResult(list,queryResult.getTotalCount());
	}

	private void printResult(List<Article> list,int counts){
		if(list == null || list.size() <= 0){
			System.out.println("没有找到记录");
		}
		System.out.println("共匹配了 " + counts + " 条记录。");
		for (Article article : list) {
			System.out.println("id:" + article.getId());
			System.out.println("title:" + article.getTitle());
			System.out.println("tag:" + article.getTag());
			System.out.println("content:" + article.getContent());
			System.out.println("----------------");
		}
	}

}
