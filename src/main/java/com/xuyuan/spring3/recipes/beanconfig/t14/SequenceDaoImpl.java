package com.xuyuan.spring3.recipes.beanconfig.t14;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

//@Component  //managed component
@Repository("sequenceDao") //@Repository  stereotype denotes a DAO component in the persistence layer 
public class SequenceDaoImpl implements SequenceDao {

    /**
	 * @uml.property  name="sequences"
	 * @uml.associationEnd  qualifier="constant:java.lang.String com.xuyuan.spring3.recipes.beanconfig.t14.Sequence"
	 */
    private Map<String, Sequence> sequences;
    /**
	 * @uml.property  name="values"
	 * @uml.associationEnd  qualifier="constant:java.lang.String java.lang.Integer"
	 */
    private Map<String, Integer> values;

    public SequenceDaoImpl() {
        sequences = new HashMap<String, Sequence>();
        sequences.put("IT", new Sequence("IT", "30", "A"));
        values = new HashMap<String, Integer>();
        values.put("IT", 100000);
    }

    public Sequence getSequence(String sequenceId) {
        return sequences.get(sequenceId);
    }

    public synchronized int getNextValue(String sequenceId) {
        int value = values.get(sequenceId);
        values.put(sequenceId, value + 1);
        return value;
    }
}
