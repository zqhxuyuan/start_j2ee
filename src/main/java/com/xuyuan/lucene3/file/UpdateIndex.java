package com.xuyuan.lucene3.file;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 * Lucene 3.0+ 更新索引
 * Lucene是没有办法更新的，只有先删除了再更新
 * @author Administrator
 */
public class UpdateIndex {
	public static void main(String[] args) throws IOException {
		String indexDir = "d:/lucene/index";
		String dateDir = "d:/lucene/doc";
		Directory dir = new SimpleFSDirectory(new File(indexDir));

		IndexWriter indexWriter = new IndexWriter(dir, new StandardAnalyzer(Version.LUCENE_30), false, IndexWriter.MaxFieldLength.UNLIMITED);

		File[] files = new File(dateDir).listFiles();
		Document doc = new Document();
		for (int i = 0; i < files.length; i++) {
			if (files[i].getName().equals("time.txt")) {
				doc.add(new Field("contents", new FileReader(files[i])));
				doc.add(new Field("filename", files[i].getName(),Field.Store.YES, Field.Index.NOT_ANALYZED));
			}
		}
		// 更新索引使用默认分词器
		indexWriter.updateDocument(new Term("filename", "time.txt"), doc);
		indexWriter.close();
	}
}
