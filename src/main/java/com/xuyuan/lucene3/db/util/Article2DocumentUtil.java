package com.xuyuan.lucene3.db.util;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;

import com.xuyuan.lucene3.db.model.Article;

/**
 * Article和Document对象的互转
 * @author Administrator
 * http://blog.csdn.net/wenlin56/article/details/6074129
 */
public class Article2DocumentUtil {

	public static Document article2document(Article article) {
		if(article == null) {
			return null;
		}

		Document document = new Document();
		document.add(new Field("id", article.getId()+"", Store.YES, Index.ANALYZED));
		document.add(new Field("tag", article.getTag(), Store.YES, Index.ANALYZED));
		document.add(new Field("title", article.getTitle(), Store.YES, Index.ANALYZED));
		document.add(new Field("content", article.getContent(), Store.YES, Index.ANALYZED));

		return document;
	}

	public static Article document2article(Document document) {
		if(document == null) {
			return null;
		}

		Article article = new Article();
		article.setId(Integer.parseInt(document.get("id")));
		article.setTag(document.get("tag"));
		article.setTitle(document.get("title"));
		article.setContent(document.get("content"));

		return article;
	}
}
