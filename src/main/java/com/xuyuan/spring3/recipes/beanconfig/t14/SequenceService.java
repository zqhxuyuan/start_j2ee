package com.xuyuan.spring3.recipes.beanconfig.t14;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//@Component 
@Service("sequenceService") //@Service  stereotype denotes a service component in the service layer
public class SequenceService {

    /**
	 * @uml.property  name="sequenceDao"
	 * @uml.associationEnd  
	 */
    private SequenceDao sequenceDao;

    /**
	 * @param sequenceDao
	 * @uml.property  name="sequenceDao"
	 */
    @Autowired //@Autowired  annotation to the DAO field for Spring to auto-wire it by type 
    public void setSequenceDao(SequenceDao sequenceDao) {
        this.sequenceDao = sequenceDao;
    }

    public String generate(String sequenceId) {
        Sequence sequence = sequenceDao.getSequence(sequenceId);
        int value = sequenceDao.getNextValue(sequenceId);
        String res = sequence.getPrefix() + value + sequence.getSuffix();
        System.out.println(res);
        return res;
    }
}
