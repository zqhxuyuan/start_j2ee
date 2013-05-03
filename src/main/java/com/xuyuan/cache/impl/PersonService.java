package com.xuyuan.cache.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

/**
 * 用户信息业务逻辑处理类
 * @author Administrator
 *
 */
public class PersonService {
	private static final Logger logger = Logger.getLogger( PersonService.class.getName() );

	//模拟数据库中的用户列表数据
	private static SortedMap<Integer, Person> people = new TreeMap<Integer, Person>();
	private static List<Person> personList = new ArrayList<Person>();
	static {
		people.put(0, new Person(0, "Steve", "Smith") );
		people.put(1, new Person(1, "Sue", "Jones") );
	}
	static{
		for (Integer id : people.keySet() ) {
			personList.add( people.get(id));
		}
	}

	/**
	 * 展示用户列表
	 * @return
	 */
	public static List<Person> getPersons() {
		return personList;
	}

	/**
	 * 保存用户
	 * @param person
	 */
    public void save(Person person) {
    	int newId = getNewId();
    	person.setId( newId );
    	people.put( newId, person);
    	rebuildPersonList();
    }

    private int getNewId() {
    	int newId = 0;
    	try {
    	  newId = people.lastKey() + 1;
    	} catch (NoSuchElementException ex) {
    		//logger.info("Id value set to 0");
    	}
    	return newId;
	}

    /**
     * 更新用户
     * @param person
     */
	public void update(Person person) {
    	Person tempPerson = people.get( person.getId() );
    	tempPerson.setFirstName( person.getFirstName() );
    	tempPerson.setLastName(person.getLastName() );
    	rebuildPersonList();
    }

	/**
	 * 删除用户
	 * @param ID
	 */
	public void deletePerson(int ID) {
		people.remove(ID);
		rebuildPersonList();
	}

	/**
	 * 根据id获取用户信息
	 * @param id
	 * @return
	 */
	public Person getPerson(int id) {
		return people.get(id);
	}

	/**
	 * 重建用户列表数据
	 */
	public static void rebuildPersonList() {
    	personList = new ArrayList<Person>();
        for (Integer id : people.keySet() ) {
 			personList.add( people.get(id));
 		}
	}
}
