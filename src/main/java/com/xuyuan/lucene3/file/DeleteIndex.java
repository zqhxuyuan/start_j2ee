package com.xuyuan.lucene3.file;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 * Lucene 3.0+ 删除索引
 * http://langhua9527.iteye.com/blog/582347
 */
public class DeleteIndex {

	public static void main(String[] args) throws CorruptIndexException, IOException {
		String indexDir = "d:/lucene/index";
		Directory dir = new SimpleFSDirectory(new File(indexDir));

		IndexWriter indexWriter = new IndexWriter(dir, new StandardAnalyzer(Version.LUCENE_30), false, IndexWriter.MaxFieldLength.UNLIMITED);

		// 删除filename为time.txt的Document
		indexWriter.deleteDocuments(new Term("filename", "time.txt"));

		// 优化,提交事务
		indexWriter.optimize();
		indexWriter.commit();
		System.out.println("是否有删除=" + indexWriter.hasDeletions());

		// 如果不indexWriter.optimize()以下两个会有区别
		System.out.println("一共有" + indexWriter.maxDoc() + "索引");
		System.out.println("还剩" + indexWriter.numDocs() + "索引");

		indexWriter.close();
	}

}
