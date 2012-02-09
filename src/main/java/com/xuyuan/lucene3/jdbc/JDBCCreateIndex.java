package com.xuyuan.lucene3.jdbc;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.DateTools;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;

/**
 * JDBC 数据库方式创建索引
 *
 * 给数据库字段建立索引的方法和给文件建立索引的方法类似
 * 只是需要将待索引的源换为从数据库里面读取的字段值就可以了。
 *
 * 查询时也是一样的. 要注意的是创建索引时,把Field放进Document的Field#Name
 * 在查询时,将用户输入的查询字符串 运用到QueryParser中.
 *
 * 比如此处的:doc.add(new Field("Article_Title",...
 * 查询时就是:new QueryParser(Version.LUCENE_30, "Article_Title", ...
 * 除此之外,测试查询方法和file/IndexSearch其他地方都一样.
 *
 * 而且因为创建索引时存放的索引文件的路径为d:/lucene/index
 * 查询时创建IndexSearcher对象,也是用到这个相同的路径.
 * @author Administrator
 *
 */
public class JDBCCreateIndex {

	private static String indexpath = "d:/lucene/index";

	public static void main(String[] args) throws IOException, SQLException {
		DBConn conn = new DBConn();
		conn.OpenConnection();
		ResultSet rs = conn.ExecuteQuery("select * from Article");

		// 为表字段建立索引
		IndexWriter indexWriter = new IndexWriter(
				new SimpleFSDirectory(new File(indexpath)),
				new StandardAnalyzer(Version.LUCENE_30),
				true, IndexWriter.MaxFieldLength.UNLIMITED);

		while (rs.next()) {
			Document doc = new Document();

			doc.add(new Field("Article_Title", rs.getString("Article_Title"), Field.Store.YES, Field.Index.ANALYZED));
			doc.add(new Field("Article_Content", rs.getString("Article_Content"), Field.Store.YES, Field.Index.ANALYZED));
			doc.add(new Field("indexDate", DateTools.dateToString(new Date(), DateTools.Resolution.DAY), Field.Store.YES, Field.Index.NOT_ANALYZED));

			indexWriter.addDocument(doc);
		}

		System.out.println("numDocs" + indexWriter.numDocs());
		indexWriter.close();
	}
}
