package com.xuyuan.spring3.recipes.beanconfig.t14;

public interface SequenceDao {

    public Sequence getSequence(String sequenceId);
    public int getNextValue(String sequenceId);
}
