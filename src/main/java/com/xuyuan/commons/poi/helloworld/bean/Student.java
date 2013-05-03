package com.xuyuan.commons.poi.helloworld.bean;

/**
 * 学生信息
 * @author Nanlei
 *
 */
public class Student {
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="gender"
	 */
	private String gender;
	/**
	 * @uml.property  name="age"
	 */
	private int age;
	/**
	 * @uml.property  name="sclass"
	 */
	private String sclass;
	/**
	 * @uml.property  name="score"
	 */
	private int score;

	public Student() {
		super();
	}

	public Student(String name, String gender, int age, String sclass, int score) {
		super();
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.sclass = sclass;
		this.score = score;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return
	 * @uml.property  name="gender"
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender
	 * @uml.property  name="gender"
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return
	 * @uml.property  name="age"
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age
	 * @uml.property  name="age"
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return
	 * @uml.property  name="sclass"
	 */
	public String getSclass() {
		return sclass;
	}

	/**
	 * @param sclass
	 * @uml.property  name="sclass"
	 */
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	/**
	 * @return
	 * @uml.property  name="score"
	 */
	public int getScore() {
		return score;
	}

	/**
	 * @param score
	 * @uml.property  name="score"
	 */
	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Student [age=" + age + ", gender=" + gender + ", name=" + name
				+ ", sclass=" + sclass + ", score=" + score + "]";
	}

}
