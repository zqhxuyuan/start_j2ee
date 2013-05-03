package com.xuyuan.lucene3.file;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.Date;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.DateTools;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 * 文件方式创建索引
 * @author Hector
 */
public class CreateIndex {
	public static void main(String[] args) throws IOException {
		String indexDir = "d:/index";
		String dataDir = "d:/data";

		//创建Directory对象
		Directory dir = new SimpleFSDirectory(new File(indexDir));
		
		Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
		
		//创建IndexWriter对象
		IndexWriter indexWriter = new IndexWriter(dir, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);

		//获取源文件的File数组
		File[] files = new File(dataDir).listFiles();

		//通过循环将每个文件写入索引
		for (int i = 0; i < files.length; i++) {
			//创建Field对象，并放入Document对象中
			Document doc = new Document();
			doc.add(new Field("contents", new FileReader(files[i])));
			doc.add(new Field("filename", files[i].getName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
			doc.add(new Field("indexDate", DateTools.dateToString(new Date(), DateTools.Resolution.DAY), Field.Store.YES, Field.Index.NOT_ANALYZED));

			//将Document对象写入IndexWriter
			indexWriter.addDocument(doc);
			
		}
		// 查看IndexWriter里面有多少个索引
		System.out.println("numDocs" + indexWriter.numDocs());

		//关闭IndexWriter
		indexWriter.close();
	}
}
