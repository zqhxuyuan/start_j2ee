package com.xuyuan.extjs3;

import java.util.ArrayList;
import java.util.List;

public class ExtJsApplyJavaImpl {

	public static void main(String[] args) {
		List<Integer> o = new ArrayList<Integer>();
		List<Integer> c = new ArrayList<Integer>(); c.add(1);
		List<Integer> d = new ArrayList<Integer>(); d.add(2);

		System.out.print("2 param: ");
		method(o,c,null); //1
		System.out.print("\n3 param: ");
		method(o,c,d); //2 1
		System.out.print("\n------------");

		StringBuffer o2 = new StringBuffer();
		String[] c2 = new String[]{"1"};
		String[] d2 = new String[]{"2"};

		System.out.print("\n2 param: ");
		method2(o2,c2);
		System.out.print("\n3 param: ");
		method2(o2,c2,d2);
	}

	public static void method(List<Integer> o,List<Integer> c,List<Integer> defaults){
		if(defaults != null && defaults.size() > 0){
			method(o,defaults,null);
		}
		for(Integer i : c){
			o.add(i);
			System.out.print(i + " ");
		}
	}

	public static void method2(StringBuffer o,String[] c,String... defaults){
		if(defaults != null && defaults.length > 0){
			method2(o,defaults);
		}
		for(String s : c){
			o.append(s);
			System.out.print(s + " ");
		}
	}
}
