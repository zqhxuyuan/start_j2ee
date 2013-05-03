package com.xuyuan.search.solr;

import org.apache.solr.client.solrj.beans.Field;

/**
 * Index需要添加相关的Annotation注解，便于告诉solr哪些属性参与到index中
 */
public class Index {
    //@Field setter方法上添加Annotation也是可以的
    /**
	 * @uml.property  name="id"
	 */
    private String id;
    /**
	 * @uml.property  name="name"
	 */
    @Field
    private String name;
    /**
	 * @uml.property  name="manu"
	 */
    @Field
    private String manu;
    /**
	 * @uml.property  name="cat" multiplicity="(0 -1)" dimension="1"
	 */
    @Field
    private String[] cat;
 
    /**
	 * @uml.property  name="features" multiplicity="(0 -1)" dimension="1"
	 */
    @Field
    private String[] features;
    /**
	 * @uml.property  name="price"
	 */
    @Field
    private float price;
    /**
	 * @uml.property  name="popularity"
	 */
    @Field
    private int popularity;
    /**
	 * @uml.property  name="inStock"
	 */
    @Field
    private boolean inStock;
    
    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public String getId() {
        return id;
    }
    
    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    @Field
    public void setId(String id) {
        this.id = id;
    }
    //getter、setter方法
 
    public String toString() {
        return this.id + "#" + this.name + "#" + this.manu + "#" + this.cat;
    }

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="manu"
	 */
	public String getManu() {
		return manu;
	}

	/**
	 * @param manu
	 * @uml.property  name="manu"
	 */
	public void setManu(String manu) {
		this.manu = manu;
	}

	/**
	 * @return
	 * @uml.property  name="cat"
	 */
	public String[] getCat() {
		return cat;
	}

	/**
	 * @param cat
	 * @uml.property  name="cat"
	 */
	public void setCat(String[] cat) {
		this.cat = cat;
	}

	/**
	 * @return
	 * @uml.property  name="features"
	 */
	public String[] getFeatures() {
		return features;
	}

	/**
	 * @param features
	 * @uml.property  name="features"
	 */
	public void setFeatures(String[] features) {
		this.features = features;
	}

	/**
	 * @return
	 * @uml.property  name="price"
	 */
	public float getPrice() {
		return price;
	}

	/**
	 * @param price
	 * @uml.property  name="price"
	 */
	public void setPrice(float price) {
		this.price = price;
	}

	/**
	 * @return
	 * @uml.property  name="popularity"
	 */
	public int getPopularity() {
		return popularity;
	}

	/**
	 * @param popularity
	 * @uml.property  name="popularity"
	 */
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}

	/**
	 * @return
	 * @uml.property  name="inStock"
	 */
	public boolean isInStock() {
		return inStock;
	}

	/**
	 * @param inStock
	 * @uml.property  name="inStock"
	 */
	public void setInStock(boolean inStock) {
		this.inStock = inStock;
	}
}
