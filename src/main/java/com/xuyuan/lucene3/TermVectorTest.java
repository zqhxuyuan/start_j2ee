package com.xuyuan.lucene3;

import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.document.Field.TermVector;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermFreqVector;
import org.apache.lucene.index.TermPositionVector;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.TokenSources;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.Version;

public class TermVectorTest {
	
	/**
	 * @uml.property  name="analyzer"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_30);
	/**
	 * @uml.property  name="ramDir"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
	Directory ramDir = new RAMDirectory();
	
	public void createRamIndex() throws CorruptIndexException, LockObtainFailedException, IOException{
		IndexWriter writer = new IndexWriter(ramDir,analyzer,IndexWriter.MaxFieldLength.LIMITED);

		Document doc1 = new Document();
		doc1.add(new Field("title","java",Store.YES,Index.ANALYZED));
		doc1.add(new Field("author","callan",Store.YES,Index.ANALYZED));
		doc1.add(new Field("subject","java一门编程语言,用java的人很多，编程语言也不少，但是java最流行",Store.YES,Index.ANALYZED,TermVector.WITH_POSITIONS_OFFSETS));
		
		Document doc2 = new Document();
		doc2.add(new Field("title","english",Store.YES,Index.ANALYZED));
		doc2.add(new Field("author","wcq",Store.YES,Index.ANALYZED));
		doc2.add(new Field("subject","英语用的人很多",Store.YES,Index.ANALYZED,TermVector.WITH_POSITIONS_OFFSETS));
	
		Document doc3 = new Document();
		doc3.add(new Field("title","asp",Store.YES,Index.ANALYZED));
		doc3.add(new Field("author","ca",Store.YES,Index.ANALYZED));
		doc3.add(new Field("subject","英语用的人很多",Store.YES,Index.ANALYZED,TermVector.WITH_POSITIONS_OFFSETS));
		
		writer.addDocument(doc1);
		writer.addDocument(doc2);
		writer.addDocument(doc3);
		
		writer.optimize();
		writer.close();
	}
	
	public void search() throws CorruptIndexException, IOException{
		IndexReader reader = IndexReader.open(ramDir);
		IndexSearcher searcher = new IndexSearcher(reader);
		
		Term term = new Term("title","java");	//在title里查询java词条
		TermQuery query = new TermQuery(term);
		
		TopDocs hits = searcher.search(query,10);
		ScoreDoc[] scoreDocs = hits.scoreDocs;
		for (int i = 0; i < scoreDocs.length; i++) {
			ScoreDoc sdoc = scoreDocs[i];
			Document doc = searcher.doc(sdoc.doc);
			System.out.println(sdoc.doc + " : " + doc.get("title") + " : " + doc.get("subject"));
			System.out.println("moreLike search: ");
			
			morelikeSearch(reader,sdoc.doc);
		}
	}
	
	private void print(IndexSearcher searcher, TopDocs topDocs) throws CorruptIndexException, IOException{
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		for (int i = 0; i < scoreDocs.length; i++) {
			ScoreDoc sdoc = scoreDocs[i];
			Document doc = searcher.doc(sdoc.doc);
			
			System.out.println(sdoc.doc + " : " + doc.get("title") + " : " + doc.get("subject"));
			System.out.println("moreLike search: ");
		}
	}

	private void morelikeSearch(IndexReader reader,int id) throws IOException {
		//根据这个document的id获取这个field的Term Vector 信息，就是这个field分词之后在这个field里的频率、位置、等信息
		TermFreqVector vector = reader.getTermFreqVector(id, "subject");
		BooleanQuery query = new BooleanQuery();  
		for (int i = 0; i < vector.size(); i++) {
			 TermQuery tq = new TermQuery(new Term("subject", vector.getTerms()[i]));   //获取每个term保存的Token
			 query.add(tq, BooleanClause.Occur.SHOULD);   
		}
		IndexSearcher searcher = new IndexSearcher(IndexReader.open(ramDir));   
	    TopDocs hits = searcher.search(query,10);   
	    this.print(searcher, hits);
	}

	//Lucene使用TermVector提高高亮显示性能
	public void highterLightSearch() throws CorruptIndexException, IOException, InvalidTokenOffsetsException{
		IndexReader reader = IndexReader.open(ramDir);   
        IndexSearcher searcher = new IndexSearcher(reader);   
        TermQuery query = new TermQuery(new Term("subject","java"));   
        TopDocs hits = searcher.search(query,10);   
           
        //高亮显示设置   
        SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
        Highlighter highlighter =new Highlighter(simpleHTMLFormatter,new QueryScorer(query));   
        // 这个100是指定关键字字符串的context的长度，你可以自己设定，因为不可能返回整篇正文内容   
        highlighter.setTextFragmenter(new SimpleFragmenter(100));   
  
        ScoreDoc[] scoreDocs = hits.scoreDocs;
        for (int i = 0; i < scoreDocs.length; i++) {
			ScoreDoc sdoc = scoreDocs[i];
			Document doc = searcher.doc(sdoc.doc);

			TermPositionVector termFreqVector = (TermPositionVector)reader.getTermFreqVector(sdoc.doc, "subject");   
             
            TermFreqVector vector = reader.getTermFreqVector(sdoc.doc, "subject");
            TokenStream tokenStream = TokenSources.getTokenStream(termFreqVector);   
               
            String result = highlighter.getBestFragment(tokenStream, doc.get("subject"));   
            System.out.println(doc.get("title"));   
            System.out.println(result);   
        }   
	}
	
	public static void main(String[] args) throws CorruptIndexException, IOException {
		TermVectorTest  t = new TermVectorTest();
		t.createRamIndex();
		t.search();
	}

}

