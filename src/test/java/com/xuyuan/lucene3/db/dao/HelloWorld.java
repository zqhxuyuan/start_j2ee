package com.xuyuan.lucene3.db.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;

import com.xuyuan.lucene3.db.model.Article;

/**
 * 使用JUnit测试:
 *   1.project explorer - HelloWorld.java  - HelloWorld - createIndex() -- run as JUnit Test
 *   2.会在项目下生成indexDir文件夹
 *   3.search() -- run as JUnit Test
 *   4.查看Console控制台下打印的信息
 *
 * 新增多个Article,模拟数据库中的多条记录.要先执行createIndex,再执行search.
 * 因为每次执行createIndex都会生成新的索引数据.
 *
 * @author wenlin56
 */
public class HelloWorld {

	String INDEXPATH = "./indexDir/"; //索引数据的存放路径.
	String queryStr = "HelloWorld"; //搜索条件
	String queryField = "content"; //搜索字段

	/**
	 * 创建索引
	 * Field -> Document -> Directory - Analyzer - IndexWriter
	 */
	@Test
	public void createIndex() throws Exception {
		//1：将数据（通常表现为一个实体类）转换成 Lucene 能接受的 Document 对象
		Article article = new Article();
		article.setId(1);
		article.setTitle("wjh上天山");
		article.setContent("据悉，wjh已于昨日抵达天山。高歌一曲HelloWorld");

		article.setId(2);
		article.setTitle("wjh上天山2");
		article.setContent("据悉，wjh已于昨日抵达天山。高歌一曲HelloWorld 2");

		Document document = new Document();
		document.add(new Field("id", article.getId()+"", Store.YES, Index.ANALYZED));
		document.add(new Field("title", article.getTitle(), Store.YES, Index.ANALYZED));
		document.add(new Field("content", article.getContent(), Store.YES, Index.ANALYZED));


		//2：构建 IndexWriter：提供索引库所在的目录位置、分词器、字段溢出大小
		Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30); // 标准分词器
		IndexWriter indexWriter = new IndexWriter(indexDir, analyzer, MaxFieldLength.LIMITED);


		//3：将 document 保存到索引库 —— 分词后，建立索引。最后别忘了关闭 indexWriter。
		indexWriter.addDocument(document);
		indexWriter.close();
	}

	/**
	 * 搜索
	 * Directory - IndexSearcher - Analyzer - QueryParser - Query - TopDocs - ScoreDoc - Document
	 */
	@Test
	public void search() throws Exception {
		//用于存放查询结果
		List<Article> list = new ArrayList<Article>();

		//构建 IndexSearcher ：提供 Directory —— 到哪里查？
		Directory indexDir = FSDirectory.open(new File(INDEXPATH)); //打开到某一个目录下的索引库的连接
		IndexSearcher indexSearcher = new IndexSearcher(indexDir);


		/*
		 * 构建 Query 对象 —— 将查询条件，解析能被 Lucene 搜索机制支持的查询条件对象
		 * 需要指定分词器：Analyzer, 以什么方式来对查询条件分词？ 注意搜索时使用的分词器和创建索引时使用的分词器必须一样.
		 */
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		QueryParser queryParser = new QueryParser(Version.LUCENE_30, queryField, analyzer);
		Query query = queryParser.parse(queryStr);


		//此时并没有真正获取到内容数据，我们所能从中获取到的仅仅是指向匹配 Document 的 ID 。 类似 Hibernate 的 Session.load() 方法。
		TopDocs topDocs = indexSearcher.search(query, 100);

		/*
		 * 所匹配的总记录数。这个记录数不受 indexSearcher.search(query, 100) 的第二个参数的影响
		 * 100 在这里表示返回所匹配的记录的前100条记录
		 * 而 topDocs.totalHits 表示当前查询在索引库中匹配了多少条记录。例如，有500条匹配，就返回 500 。
		 */
		int totalCount = topDocs.totalHits;

		/* 匹配的 doc 集合，如上面注释，这个集合里的每个元素仅仅是指向匹配 Document 的 ID 。 */
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;

		/*
		 * 既然获取匹配的每个 Document 的 ID 集合。
		 */
		for(ScoreDoc scoreDoc : scoreDocs) {
			Document document = indexSearcher.doc(scoreDoc.doc);

			Article article = new Article();
			article.setId(Integer.parseInt(document.get("id")));
			article.setTitle(document.get("title"));
			article.setContent(document.get("content"));

			list.add(article);
		}

		// 显示条件
		System.out.println("当前共匹配了 " + totalCount + "  条记录：");
		System.out.println("----------------");
		for (Article article : list) {
			System.out.println("id:" + article.getId());
			System.out.println("title:" + article.getTitle());
			System.out.println("content:" + article.getContent());
			System.out.println("----------------");
		}

	}
}
