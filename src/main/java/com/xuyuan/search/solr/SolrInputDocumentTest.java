package com.xuyuan.search.solr;

import org.apache.solr.client.solrj.beans.DocumentObjectBinder;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.apache.solr.common.SolrInputField;
import org.junit.Test;
 
/**
 * Document文档和JavaBean相互转换
 * <b>function:</b>SolrInputDocument implements Map, Iterable
 * @author hoojo
 */
public class SolrInputDocumentTest {
 
    public final void fail(Object o) {
        System.out.println(o);
    }
    
    /**
     * <b>function:</b> 创建SolrInputDocument
     * @author hoojo
     * @createDate 2011-10-21 下午03:38:20
     */
    @Test
    public void createDoc() {
        SolrInputDocument doc = new SolrInputDocument();
        doc.addField("id", System.currentTimeMillis());
        doc.addField("name", "SolrInputDocument");
        doc.addField("age", 22, 2.0f);
        
        doc.addField("like", new String[] { "music", "book", "sport" });
        
        doc.put("address", new SolrInputField("guangzhou"));
        
        doc.setField("sex", "man");
        doc.setField("remark", "china people", 2.0f);
        
        fail(doc);
    }
    
    /**
     * <b>function:</b> 利用DocumentObjectBinder对象将SolrInputDocument 和 User对象相互转换
     * @author hoojo
     * @createDate 2011-10-21 下午03:38:40
     */
    @Test
    public void docAndBean4Binder() {
        SolrDocument doc = new SolrDocument();
        doc.addField("id", 456);
        doc.addField("name", "SolrInputDocument");
        
        doc.addField("likes", new String[] { "music", "book", "sport" });
        
        doc.put("address", "guangzhou");
        
        doc.setField("sex", "man");
        doc.setField("remark", "china people");
        
        DocumentObjectBinder binder = new DocumentObjectBinder();
        
        User user = new User();
        user.setId(222);
        user.setName("JavaBean");
        user.setLike(new String[] { "music", "book", "sport" });
        user.setAddress("guangdong");
        
        fail(doc);
        // User ->> SolrInputDocument
        fail(binder.toSolrInputDocument(user));
        // SolrDocument ->> User
        fail(binder.getBean(User.class, doc));
        
        SolrDocumentList list = new SolrDocumentList();
        list.add(doc);
        list.add(doc);
        //SolrDocumentList ->> List
        fail(binder.getBeans(User.class, list));
    }
    
    /**
     * <b>function:</b> SolrInputDocument的相关方法
     * @author hoojo
     * @createDate 2011-10-21 下午03:44:30
     */
    @Test
    public void docMethod() {
        SolrInputDocument doc = new SolrInputDocument();
        doc.addField("id", System.currentTimeMillis());
        doc.addField("name", "SolrInputDocument");
        doc.addField("age", 23, 1.0f);
        doc.addField("age", 22, 2.0f);
        doc.addField("age", 24, 0f);
        
        fail(doc.entrySet());
        fail(doc.get("age"));
        //排名有用，类似百度竞价排名
        doc.setDocumentBoost(2.0f);
        fail(doc.getDocumentBoost());
        fail(doc.getField("name"));
        fail(doc.getFieldNames());//keys
        fail(doc.getFieldValues("age"));
        fail(doc.getFieldValues("id"));
        fail(doc.values());
    }
}
