package com.xuyuan.search.compass.test;

import java.util.Date;

import junit.framework.TestCase;

import org.apache.log4j.Logger;
import org.compass.core.Compass;
import org.compass.core.CompassDetachedHits;
import org.compass.core.CompassHit;
import org.compass.core.CompassHits;
import org.compass.core.CompassSession;
import org.compass.core.CompassTemplate;
import org.compass.core.CompassTransaction;
import org.compass.core.support.search.CompassSearchCommand;
import org.compass.core.support.search.CompassSearchResults;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.xuyuan.search.compass.dao.ArticleDAO;
import com.xuyuan.search.compass.dao.AuthorDAO;
import com.xuyuan.search.compass.model.Article;
import com.xuyuan.search.compass.model.Author;
import com.xuyuan.search.compass.service.CompassSearchService;

/**
 * Compass服务使用的测试用例
 * 
 * @author liangchuan@mobile-soft.cn
 */
public class TestCompass extends TestCase {

	private static final Logger logger = Logger.getLogger(TestCompass.class);

	private static ClassPathXmlApplicationContext context = null;
	private static CompassTemplate ct;

	static {
		context = new ClassPathXmlApplicationContext(new String[] {
				"applicationContext_ssh.xml","applicationContext_compass.xml" });
		ct = (CompassTemplate) context.getBean("compassTemplate");
	}

	protected void setUp() throws Exception {

	}

	/**
	 * 插入测试数据
	 */
	public void testInsert() {

		ArticleDAO articleDao = (ArticleDAO) context.getBean("articleDAO");
		AuthorDAO authorDao = (AuthorDAO) context.getBean("authorDAO");
		Article article = new Article();
		Author author = new Author();
		author.setAge((short) 27);
		author.setUsername("liangchuan");
		author.setPassword("liangchuan");
		article.setTitle("Compass Test");
		article.setPublishDate(new Date());
		article.setAuthor(1);
		authorDao.save(author);
		articleDao.save(article);
		ct.save(article);
		ct.save(author);
	}

	/**
	 * 用于测试使用CompassTransaction事务方式
	 */
	public void testTransactionalFind() {

		Compass compass = ct.getCompass();
		CompassSession session = compass.openSession();
		CompassTransaction tx = null;
		try {
			tx = session.beginTransaction();
			CompassHits hits = session.find("Compass*");

			logger.error("testTransactionalFind() - CompassHits hits="
					+ hits.getLength());
			for (int i = 0; i < hits.getLength(); i++) {
				Object hit = hits.data(i);
				if (hit instanceof Article) {
					Article item = (Article) hit;
					logger.error("testTransactionalFind() - article     hits="
							+ item.getTitle());
				} else if (hit instanceof Author) {
					Author item = (Author) hit;
					logger.error("testTransactionalFind() - author hits="
							+ item.getUsername());
				} else {
					logger.error("testTransactionalFind() - error hits=");
				}
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
	}

	/**
	 * 用于演示CompassDetachedHits的使用。
	 * 由于CompassTempalte得到的结果集必须在transactionalcontext中才能使用，
	 * 因此必须使用CompassDetachedHits方式测试CompassDetachedHits方式
	 */
	public void testDetachedFind() {

		// 由于CompassTempalte得到的结果集必须在transactional
		// context中才能使用，因此必须使用CompassDetachedHits方式
		// 测试CompassDetachedHits方式
		CompassDetachedHits hits = ct.findWithDetach("Compass*");

		logger.error("testDetachedFind() - CompassHits hits="
				+ hits.getLength());
		for (int i = 0; i < hits.getLength(); i++) {
			Object hit = hits.data(i);
			if (hit instanceof Article) {
				Article item = (Article) hit;
				logger.error("testDetachedFind() - article     hits="
						+ item.getTitle());
			} else if (hit instanceof Author) {
				Author item = (Author) hit;
				logger.error("testDetachedFind() - author hits="
						+ item.getUsername());
			} else {
				logger.error("testDetachedFind() - error hits=");
			}
		}

	}

	/**
	 * 用于演示com.mobilesoft.framework.search.service.CompassSearchService的使用
	 * 
	 */
	class CompassSearch extends CompassSearchService {
		CompassSearch() {
			Compass compass = ct.getCompass();
			CompassSession session = compass.openSession();
			CompassTransaction tx = null;

			try {
				tx = session.beginTransaction();
				CompassSearchCommand command = new CompassSearchCommand();
				command.setQuery("Compass");
				CompassSearchResults results = performSearch(command, session);
				logger.error("CompassSearch() - CompassHit TotalHits value="
						+ results.getTotalHits());

				for (int i = 0; i < results.getHits().length; i++) {
					CompassHit hits = results.getHits()[i];
					Object hit = hits.getData();
					logger.error("CompassSearch() - CompassHit hit=" + hit); //$NON-NLS-1$

					if (hit instanceof Article) {
						Article item = (Article) hit;
						logger.error("testCompassSearchService() - article     hits="
								+ item.getTitle());
					} else if (hit instanceof Author) {
						Author item = (Author) hit;
						logger.error("testCompassSearchService() - author hits="
								+ item.getUsername());
					} else {
						logger.error("testCompassSearchService() - error hits=");
					}

					tx.commit();
				}
			} catch (Exception e) {
				if (tx != null) {
					tx.rollback();
				}
			} finally {
				session.close();
			}

		}

	}

	public void testCompassSearchService() {
		new CompassSearch();
	}

	protected void tearDown() throws Exception {
	}
}