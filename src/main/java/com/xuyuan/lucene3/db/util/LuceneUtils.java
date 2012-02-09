package com.xuyuan.lucene3.db.util;

import java.io.File;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.xuyuan.util.Config;

/**
 * 优化方案1: 使用一个IndexWriter
 * 使用 IndexWriter 进行保存或更新操作时， 若不手动调用 IndexWriter 的 close 方法，数据并不会持久化到索引库中。
 * IndexWriter 一般只需要在程序退出的时候再关闭。 因此，需要调用它的 commit 方法手动提交。需要特别注意。
 *
 * 优化方案2: 文件优化
 * addDocument() 后调用IndexWriter.optimize() 会合并索引文件.
 *
 * 优化方案3: 结合使用 FSDirectory 和 RAMDirectory
 * @author Administrator
 * http://blog.csdn.net/wenlin56/article/details/6074129
 */
public class LuceneUtils {
	private static IndexWriter indexWriter;
	private static final String INDEXPATH = Config.INDEXPATH;

	static {
		try {
			Directory directory = FSDirectory.open(new File(INDEXPATH));
			Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
			indexWriter = new IndexWriter(directory, analyzer, MaxFieldLength.LIMITED);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 获取 IndexWriter
	 */
	public static IndexWriter getIndexWriter() {
		return indexWriter;
	}

	/**
	 * 关闭 IndexWriter
	 */
	public static void closeIndexWriter() {
		try {
			indexWriter.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
