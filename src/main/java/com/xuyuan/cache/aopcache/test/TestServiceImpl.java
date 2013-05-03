package com.xuyuan.cache.aopcache.test;

import java.util.List;

public class TestServiceImpl implements TestService{
	
	public List getAllObject() {
		System.out.println("---TestService：Cache内不存在该element，查找并放入Cache！");
		return null;
    }

	public void updateObject(Object Object) {
		System.out.println("---TestService：更新了对象，这个Class产生的cache都将被remove！");
    }
}

