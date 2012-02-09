package com.xuyuan.lucene3.db.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;

import com.xuyuan.lucene3.db.model.Article;
import com.xuyuan.lucene3.db.util.Article2DocumentUtil;


/**
 * 搜索过程:
 *   a:把搜索条件字符串转为Query对象
 *   b:搜索，得到中间结果
 *   c:处理结果
 *
 * 搜索的数据来源是使用的 ArticleIndexDaoTest 中的保存操作的数据。
 * 因此，代码中出现的 "content" 实际上是保存的时候，给 Document 添加的一个 Field
 * @author Administrator
 */
public class AdvanceSearchTest {

	String INDEXPATH = "./indexDir/";
	String queryString = "HelloWorld";
	String queryField = "content";

	/**
	 * 1:创建并配置高亮器
	 * 2:使用高亮器进行高亮操作    返回高亮后的（关键词出现次数最多的地方的）一段文本，如果当前高亮的属性中没有出搜索的关键词，则返回null
	 *
	 * 将Document文档转为Article对象:
	 * 1.获得一个文档的信息;
	 * 2.根据文档编号取出相应的Document;
	 * 3.把Document转为Article
	 * @throws Exception
	 */
	@Test
	public void testHighlight() throws Exception {
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		QueryParser queryParser = new QueryParser(Version.LUCENE_30, queryField, analyzer);
		Query query = queryParser.parse(queryString);

		Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		IndexSearcher indexSearcher = new IndexSearcher(indexDir);

		//--------------------------------
		Formatter formater = new SimpleHTMLFormatter("<font color='red'>", "</font>"); 	//高亮效果，默认为<B>与</B>
		Scorer scorer = new QueryScorer(query); 										//查询条件
		Highlighter highlighter = new Highlighter(formater, scorer);
		highlighter.setTextFragmenter(new SimpleFragmenter(20)); 						// 摘要的大小，默认为100个字符

		TopDocs topDocs = indexSearcher.search(query, 100); 							// 返回前100条结果
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;		 								// 前n条记录的信息
		//--------------------------------

		List<Article> list = new ArrayList<Article>();
		for (int i = 0; i < scoreDocs.length; i++) {
			Document doc = indexSearcher.doc(scoreDocs[i].doc);

			//--------------------------------
			String text = highlighter.getBestFragment(analyzer, queryField, doc.get(queryField));
			if (text != null) {
				doc.getField(queryField).setValue(text); 								// 使用高亮后的文本替换原始内容
			}
			//--------------------------------

			list.add(Article2DocumentUtil.document2article(doc));
		}
		this.printResult(list);
	}

	/**
	 * 自定义字段排序，效果就象数据库中的ORDER BY
	 * 如果有多个排序要求，则增加多个SortField. 添加多个排序 sort.setSort(fields...)
	 * Sort sort = new Sort(new SortField("id", SortField.LONG)); // 按id升序排列
	 * Sort sort = new Sort(new SortField("id", SortField.LONG, true)); // 按id降序排列
	 * @throws Exception
	 */
	@Test
	public void testSort() throws Exception {
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		QueryParser queryParser = new QueryParser(Version.LUCENE_30, queryField, analyzer);
		Query query = queryParser.parse(queryString);

		Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		IndexSearcher indexSearcher = new IndexSearcher(indexDir);

		//-------------------------------------
		Sort sort = new Sort(new SortField("id", SortField.LONG, true));
		TopDocs topDocs = indexSearcher.search(query, null, 100, sort);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		//-------------------------------------

		List<Article> list = new ArrayList<Article>();
		for (int i = 0; i < scoreDocs.length; i++) {
			Document doc = indexSearcher.doc(scoreDocs[i].doc);
			list.add(Article2DocumentUtil.document2article(doc));
		}
		this.printResult(list);
	}

	private void printResult(List<Article> list){
		for (Article article : list) {
			System.out.println("-------> id = " + article.getId());
			System.out.println("title   = " + article.getTitle());
			System.out.println("content = " + article.getContent());
		}
	}
}
