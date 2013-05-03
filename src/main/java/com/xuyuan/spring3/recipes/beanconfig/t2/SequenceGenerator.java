package com.xuyuan.spring3.recipes.beanconfig.t2;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.xuyuan.spring3.recipes.beanconfig.t5.PrefixGenerator;

/**
 *  1-2. Configuring Beans in the Spring IoC Container
 *  develop an application for generating sequence numbers
 *  
 *  there may be many series of sequence  numbers to generate for different purposes.
 */
public class SequenceGenerator {

	/**
	 * @uml.property  name="prefix"
	 */
	private String prefix; 
    /**
	 * @uml.property  name="suffix"
	 */
    private String suffix; 
    /**
	 * @uml.property  name="initial"
	 */
    private int initial; 
    /**
	 * @uml.property  name="counter"
	 */
    private int counter;  //storing the current numeric value of  this generator
    
    /**
	 * @uml.property  name="suffixes"
	 */
    private List<Object> suffixes;
    /**
	 * @uml.property  name="suffixArray" multiplicity="(0 -1)" dimension="1"
	 */
    private Object[] suffixArray; 	//<list> 
    /**
	 * @uml.property  name="suffixSet"
	 */
    private Set<Object> suffixSet; //<set>
    /**
	 * @uml.property  name="suffixMap"
	 */
    private Map<Object, Object> suffixMap;
    /**
	 * @uml.property  name="suffixProp"
	 */
    private Properties suffixProp;
    /**
	 * @uml.property  name="suffixList"
	 */
    private List<Integer> suffixList;
    //@Autowired
    /**
	 * @uml.property  name="prefixGenerator"
	 * @uml.associationEnd  
	 */
    private PrefixGenerator prefixGenerator; 
    
    public SequenceGenerator() {} 
 
    public SequenceGenerator(String prefix, String suffix, int initial) { 
        this.prefix = prefix; 
        this.suffix = suffix; 
        this.initial = initial; 
    } 
    //@Autowired
    public SequenceGenerator(PrefixGenerator prefixGenerator) { 
        this.prefixGenerator = prefixGenerator; 
    }
 
    /**
	 * @param prefix
	 * @uml.property  name="prefix"
	 */
    public void setPrefix(String prefix) { 
        this.prefix = prefix; 
    } 
 
    /**
	 * @param suffix
	 * @uml.property  name="suffix"
	 */
    public void setSuffix(String suffix) { 
        this.suffix = suffix; 
    } 
 
    /**
	 * @param initial
	 * @uml.property  name="initial"
	 */
    public void setInitial(int initial) { 
        this.initial = initial; 
    }
    
    public void setSuffixes(List<Object> suffixes) { 
        this.suffixes = suffixes; 
    }

	/**
	 * @param suffixArray
	 * @uml.property  name="suffixArray"
	 */
	public void setSuffixArray(Object[] suffixArray) {
		this.suffixArray = suffixArray;
	}

	public void setSuffixSet(Set<Object> suffixSet) {
		this.suffixSet = suffixSet;
	}

	public void setSuffixMap(Map<Object, Object> suffixMap) {
		this.suffixMap = suffixMap;
	}

	/**
	 * @param suffixProp
	 * @uml.property  name="suffixProp"
	 */
	public void setSuffixProp(Properties suffixProp) {
		this.suffixProp = suffixProp;
	}

	/**
	 * @param prefixGenerator
	 * @uml.property  name="prefixGenerator"
	 */
	@Autowired(required = true)  //@Autowired annotation can be applied to field,setter,constructor
    public void setPrefixGenerator(PrefixGenerator prefixGenerator) { 
        this.prefixGenerator = prefixGenerator; 
    } 
    
	public void setSuffixList(List<Integer> suffixList) {
		this.suffixList = suffixList;
	}

	/**
     * Each time you call the getSequence() method on a generator instance, 
     * you will get the last sequence number with the prefix and suffix joined.
     */
    public synchronized String getSequence() { 
        StringBuffer buffer = new StringBuffer(); 
        buffer.append(prefix); 
        buffer.append(initial + counter++); 
        buffer.append(suffix);
        return buffer.toString(); 
    }
    public synchronized String getSequence1() { 
    	StringBuffer buffer = new StringBuffer(); 
    	buffer.append(prefix); 
    	buffer.append(initial + counter++); 
    	for (Object suffix : suffixes) { 
    		buffer.append("-"); 
    		buffer.append(suffix); 
    	}
    	return buffer.toString(); 
    }
    public synchronized String getSequence2() { 
    	StringBuffer buffer = new StringBuffer(); 
    	buffer.append(prefix); 
    	buffer.append(initial + counter++); 
    	for (Map.Entry entry : suffixMap.entrySet()) { 
    		buffer.append("-"); 
    		//buffer.append(entry.getKey()); 
    		//buffer.append("@"); 
    		buffer.append(entry.getValue()); 
    	} 
    	return buffer.toString(); 
    }
    public synchronized String getSequence3() { 
    	StringBuffer buffer = new StringBuffer(); 
    	buffer.append(prefix); 
    	buffer.append(initial + counter++); 
    	for (Map.Entry entry : suffixProp.entrySet()) { 
    		buffer.append("-"); 
    		//buffer.append(entry.getKey()); 
    		//buffer.append("@"); 
    		buffer.append(entry.getValue()); 
    	} 
    	return buffer.toString(); 
    }
    public synchronized String getSequence4() { 
        StringBuffer buffer = new StringBuffer(); 
        buffer.append(prefixGenerator.getPrefix()); 
        buffer.append(initial + counter++); 
        buffer.append(suffix); 
        return buffer.toString(); 
    }
    public synchronized String getSequence5() { 
    	StringBuffer buffer = new StringBuffer(); 
    	buffer.append(prefix); 
    	buffer.append(initial + counter++);
    	DecimalFormat formatter = new DecimalFormat("0000");
    	for (int suffix : suffixList) { 
    		buffer.append("-"); 
    		buffer.append(formatter.format(suffix));
    	}
    	return buffer.toString(); 
    }
}
