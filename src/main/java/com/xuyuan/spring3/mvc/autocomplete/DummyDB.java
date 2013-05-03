package com.xuyuan.spring3.mvc.autocomplete;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

/**
 * http://viralpatel.net/blogs/spring-3-mvc-autocomplete-json-tutorial/
 * @author Administrator
 *
 */
public class DummyDB {
    /**
	 * @uml.property  name="countries"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.String"
	 */
    private List<String> countries;
    /**
	 * @uml.property  name="tags"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.String"
	 */
    private List<String> tags;

    public DummyDB() {
        String data = "Afghanistan, Albania, Algeria, Andorra, Angola, Antigua & Deps, United Kingdom,United States,Uruguay,Uzbekistan,Vanuatu,Vatican City,Venezuela,Vietnam,Yemen,Zambia,Zimbabwe";
        countries = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(data, ",");
        while(st.hasMoreTokens()) { //Parse the country CSV list and set as Array
            countries.add(st.nextToken().trim());
        }

        String strTags = "SharePoint, Spring, Struts, Java, JQuery, ASP, PHP, JavaScript, MySQL, ASP, .NET";
        tags = new ArrayList<String>();
        StringTokenizer st2 = new StringTokenizer(strTags, ",");
        while(st2.hasMoreTokens()) {
            tags.add(st2.nextToken().trim());
        }
    }

    /**
     * DB Imp: SELECT * FROM <table> WHERE country LIKE '%" + query + "'" 
     * @param query
     * @return
     */
    public List<String> getCountryList(String query) {
        String country = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for(int i=0; i < countries.size(); i++) {
            country = countries.get(i).toLowerCase();
            if(country.startsWith(query)) {
                matched.add(countries.get(i));
            }
        }
        return matched;
    }

	public List<String> getTechList(String query) {
        String country = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for(int i=0; i < tags.size(); i++) {
            country = tags.get(i).toLowerCase();
            if(country.startsWith(query)) {
                matched.add(tags.get(i));
            }
        }
        return matched;
    }
}
