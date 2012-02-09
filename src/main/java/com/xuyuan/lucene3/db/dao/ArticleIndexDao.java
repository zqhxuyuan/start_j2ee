package com.xuyuan.lucene3.db.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.xuyuan.lucene3.db.model.Article;
import com.xuyuan.lucene3.db.model.QueryResult;
import com.xuyuan.lucene3.db.util.Article2DocumentUtil;
import com.xuyuan.lucene3.db.util.LuceneUtils;
import com.xuyuan.util.Config;

/**
 * 对Article的索引的CRUD和搜索
 * @author Administrator
 *
 */
public class ArticleIndexDao {
	private static final String INDEXPATH = Config.INDEXPATH;

	/**
	 * 保存索引
	 * @param article
	 * @throws Exception 异常是在代码中进行捕获,还是直接抛出?
	 */
	public void save(Article article) throws Exception {
		//Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		//Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		//IndexWriter indexWriter = new IndexWriter(indexDir, analyzer, MaxFieldLength.LIMITED);
		//优化方案1:使用一个IndexWriter
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();

		Document document = Article2DocumentUtil.article2document(article);
		indexWriter.addDocument(document);

		indexWriter.optimize();
		indexWriter.close();
	}

	/**
	 * 批量添加索引
	 * 对于批量保存,如果只有一个IndexWriter,循环调用save(article)则会出现IndexWriter已经关闭的情况.
	 * @param list
	 * @throws Exception
	 */
	public void batchSave(List<Article> list) throws Exception {
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();

		for(Article article : list){
			Document document = Article2DocumentUtil.article2document(article);
			indexWriter.addDocument(document);
		}

		indexWriter.optimize();
		indexWriter.close();
	}

	/**
	 * 删除索引
	 * @param article 删除的 Article 对象
	 */
	public void delete(Article article) throws Exception {
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();

		Term term = new Term("id", article.getId() + ""); //将索引库中 id 为 article.getId() 的记录删了
		indexWriter.deleteDocuments(term);

		indexWriter.close();
	}

	public void batchDeleteIds(List<Integer> articleIds) throws Exception{
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();
		for(Integer id : articleIds){
			Term term = new Term("id", id.toString());
			indexWriter.deleteDocuments(term);
		}
		indexWriter.close();
	}

	public void batchDelete(List<Article> list) throws Exception{
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();
		for(Article article : list){
			Term term = new Term("id", article.getId().toString());
			indexWriter.deleteDocuments(term);
		}
		indexWriter.close();
	}

	/**
	 * 更新索引
	 * updateDocument 等价于： delete(article); save(article);
	 * 如果索引不存在,调用update方法,则更新索引实际上等价于创建索引
	 */
	public void update(Article article) throws Exception{
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();

		Term term = new Term("id", article.getId() + "");
		indexWriter.updateDocument(term, Article2DocumentUtil.article2document(article));

		indexWriter.close();
	}

	/**
	 * 在大数据量的时候，采用 "删除再创建" 的效率更高
	 * @param list
	 * @throws Exception
	 */
	public void batchUpdate(List<Article> list) throws Exception{
		IndexWriter indexWriter = LuceneUtils.getIndexWriter();

		for(Article article : list){
			Term term = new Term("id", article.getId().toString());
			indexWriter.deleteDocuments(term);
		}
		for(Article article : list){
			Document document = Article2DocumentUtil.article2document(article);
			indexWriter.addDocument(document);
		}

		indexWriter.close();
	}

	/**
	 * 根据关键字查询所有
	 * 单字段:
	 *   QueryParser parser = new QueryParser(Version.LUCENE_30,"title", analyzer);
	 * 多字段:
	 *   QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_30, new String[]{"title","content"}, analyzer);
	 * @param queryStr 关键字
	 * @param queryField 需要被匹配的字段
	 * @return
	 * @throws Exception
	 */
	public List<Article> searchAll(String queryStr,String... queryField) throws Exception {
		Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		IndexSearcher indexSearcher = new IndexSearcher(indexDir);

		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		//QueryParser parser = new QueryParser(Version.LUCENE_30, queryField[0], analyzer);
		QueryParser parser2 = new MultiFieldQueryParser(Version.LUCENE_30, queryField, analyzer);
		Query query = parser2.parse(queryStr);

		TopDocs topDocs = indexSearcher.search(query, 100);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;

		List<Article> list = new ArrayList<Article>();
		for (int i = 0; i < scoreDocs.length; i++) {
			Document doc = indexSearcher.doc(scoreDocs[i].doc);
			list.add(Article2DocumentUtil.document2article(doc));
		}

		indexSearcher.close();
		return list;
	}

	/**
	 * 分页搜索
	 * @param queryStr 搜索条件
	 * @param firstResult 首条数据位置
	 * @param maxResults 最多取多少条数据
	 * @return 一页结果集
	 */
	public QueryResult search(String queryStr, int firstResult, int maxResults) throws Exception {
		Directory indexDir = FSDirectory.open(new File(INDEXPATH));
		IndexSearcher indexSearcher = new IndexSearcher(indexDir);

		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		QueryParser queryParser = new QueryParser(Version.LUCENE_30, "content", analyzer);
		Query query = queryParser.parse(queryStr);

		TopDocs topDocs = indexSearcher.search(query, firstResult + maxResults);
		int totalCount = topDocs.totalHits;
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;

		List<Article> list = new ArrayList<Article>();
		int length = Math.min(firstResult+maxResults, scoreDocs.length);
		for(int i=firstResult; i<length; i++) {
			Document document = indexSearcher.doc(i);
			list.add(Article2DocumentUtil.document2article(document));
		}

		indexSearcher.close();
		return new QueryResult(totalCount, list);
	}
}
