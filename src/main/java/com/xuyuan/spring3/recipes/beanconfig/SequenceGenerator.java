package com.xuyuan.spring3.recipes.beanconfig;

import java.text.DecimalFormat;
import java.util.List;

import javax.annotation.Resource;

import com.xuyuan.spring3.recipes.beanconfig.t5.PrefixGenerator;

public class SequenceGenerator {

    /**
	 * @uml.property  name="suffixes"
	 */
    private List<Integer> suffixes;
    /**
	 * @uml.property  name="initial"
	 */
    private int initial;
    /**
	 * @uml.property  name="counter"
	 */
    private int counter;

    /**
	 * @uml.property  name="prefixGenerator"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Resource(name = "datePrefixGenerator")
    private PrefixGenerator prefixGenerator;

    public void setSuffixes(List<Integer> suffixes) {
        this.suffixes = suffixes;
    }

    /**
	 * @param initial
	 * @uml.property  name="initial"
	 */
    public void setInitial(int initial) {
        this.initial = initial;
    }

    public synchronized String getSequence() {
        StringBuffer buffer = new StringBuffer();
        buffer.append(prefixGenerator.getPrefix());
        buffer.append(initial + counter++);
        DecimalFormat formatter = new DecimalFormat("0000");
        for (int suffix : suffixes) {
            buffer.append("-");
            buffer.append(formatter.format(suffix));
        }
        return buffer.toString();
    }
}
