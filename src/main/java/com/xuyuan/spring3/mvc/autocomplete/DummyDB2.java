package com.xuyuan.spring3.mvc.autocomplete;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class DummyDB2 {
	/**
	 * @uml.property  name="totalCountries"
	 */
	private int totalCountries;
	/**
	 * @uml.property  name="data"
	 */
	private String data = "Afghanistan, Albania, Zimbabwe";
	/**
	 * @uml.property  name="countries"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.String"
	 */
	private List<String> countries;

	public DummyDB2() {
		countries = new ArrayList<String>();
		StringTokenizer st = new StringTokenizer(data, ",");
		while (st.hasMoreTokens()) {
			countries.add(st.nextToken().trim());
		}
		totalCountries = countries.size();
	}

	public List<String> getData(String query) {
		String country = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for (int i = 0; i < totalCountries; i++) {
			country = countries.get(i).toLowerCase();
			if (country.startsWith(query)) {
				matched.add(countries.get(i));
			}
		}
		return matched;
	}
}
