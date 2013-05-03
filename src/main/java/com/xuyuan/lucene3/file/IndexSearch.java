package com.xuyuan.lucene3.file;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 * 索引建立后，输入查询条件，检索查询结果
 */
public class IndexSearch {

	public static void main(String[] args) throws IOException, ParseException {
		//创建Directory对象，索引文件夹
		String indexDir = "d:/lucene/index";
		Directory dir = new SimpleFSDirectory(new File(indexDir));

		//创建 IndexSearcher对象，建立查询. 相比IndexWriter对象，这个参数就要提供一个索引的目录就行了
		IndexSearcher indexSearch = new IndexSearcher(dir);

		//创建QueryParser对象和Query对象.  第一个参数表示Lucene的版本,第二个表示搜索Field的字段,第三个表示搜索使用分词器(创建索引和搜索必须使用相同的分词器)
		QueryParser queryParser = new QueryParser(Version.LUCENE_30, "contents", new StandardAnalyzer(Version.LUCENE_30));
		Query query = queryParser.parse("好");
		//query = new TermQuery(new Term("contents","好")); //field：content包含‘好’  -->single-term query

		//搜索结果 TopDocs. 里面有scoreDocs[]数组，里面保存着索引值
		TopDocs hits = indexSearch.search(query, 10);
		ScoreDoc[] scoreDocs = hits.scoreDocs;

		//循环scoreDocs数据，并使用indexSearch.doc方法把Document还原，再拿出对应的字段的值
		System.out.println("找到了"+hits.totalHits+"个");
		for (int i = 0; i < scoreDocs.length; i++) {
			ScoreDoc sdoc = scoreDocs[i];
			Document doc = indexSearch.doc(sdoc.doc);
			System.out.println(doc.get("filename"));
		}

		//关闭IndexSearch
		indexSearch.close();
	}
}
