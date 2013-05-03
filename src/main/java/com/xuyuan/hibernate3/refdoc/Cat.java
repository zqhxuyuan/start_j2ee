package com.xuyuan.hibernate3.refdoc;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.sun.istack.internal.NotNull;

@Entity 
@Table(name="cats") 
//@Inheritance(strategy=SINGLE_TABLE)
//@DiscriminatorValue("C") 
//@DiscriminatorColumn(name="subclass", discriminatorType=CHAR)
public class Cat {
	/**
	 * @uml.property  name="id"
	 */
	private Long id; // identifier
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	 * @uml.property  name="birthdate"
	 */
	private Date birthdate;
	/**
	 * @uml.property  name="sex"
	 */
	private char sex;
	/**
	 * @uml.property  name="weight"
	 */
	private float weight;
	/**
	 * @uml.property  name="litterId"
	 */
	private int litterId;
	
	/**
	 * @uml.property  name="color"
	 * @uml.associationEnd  
	 */
	private Color color; //一对一，一只猫对应一种颜色
	/**
	 * @uml.property  name="mother"
	 * @uml.associationEnd  inverse="kittens:com.xuyuan.hibernate3.refdoc.Cat"
	 */
	private Cat mother; //多对一，一只猫只对应一只母亲，猫的世界没有人类那么复杂，没有3P
	/**
	 * @uml.property  name="kittens"
	 * @uml.associationEnd  multiplicity="(0 -1)" inverse="mother:com.xuyuan.hibernate3.refdoc.Cat"
	 */
	private Set<Cat> kittens = new HashSet<Cat>(); //一只猫有多个孩子，猫没有计划生育政策。 一对多

	public Cat(){}
	
	public Cat(String name, Date birthdate) {
		super();
		this.name = name;
		this.birthdate = birthdate;
	}

	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	private void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return
	 * @uml.property  name="id"
	 */
	@Id 
	@GeneratedValue
	public Long getId() {
		return id;
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
	 * @param date
	 * @uml.property  name="birthdate"
	 */
	void setBirthdate(Date date) {
		birthdate = date;
	}

	/**
	 * @return
	 * @uml.property  name="birthdate"
	 */
	@Temporal(TemporalType.TIMESTAMP) 
	@NotNull @Column(updatable=false)
	public Date getBirthdate() {
		return birthdate;
	}

	/**
	 * @param weight
	 * @uml.property  name="weight"
	 */
	void setWeight(float weight) {
		this.weight = weight;
	}

	/**
	 * @return
	 * @uml.property  name="weight"
	 */
	public float getWeight() {
		return weight;
	}

	/**
	 * @param sex
	 * @uml.property  name="sex"
	 */
	void setSex(char sex) {
		this.sex = sex;
	}

	/**
	 * @return
	 * @uml.property  name="sex"
	 */
	public char getSex() {
		return sex;
	}

	/**
	 * @param id
	 * @uml.property  name="litterId"
	 */
	void setLitterId(int id) {
		this.litterId = id;
	}

	/**
	 * @return
	 * @uml.property  name="litterId"
	 */
	public int getLitterId() {
		return litterId;
	}

	/**
	 * @return
	 * @uml.property  name="color"
	 */
	@OneToOne
	@JoinColumn(name = "color_id")
	public Color getColor() {
		return color;
	}

	/**
	 * @param color
	 * @uml.property  name="color"
	 */
	void setColor(Color color) {
		this.color = color;
	}
	
	/**
	 * @param mother
	 * @uml.property  name="mother"
	 */
	void setMother(Cat mother) {
		this.mother = mother;
		//this.setLitterId(kittens.size()+1);
	}

	/**
	 * 多对一
	 * @return
	 * @uml.property  name="mother"
	 */
	@ManyToOne 
	@JoinColumn(name="mother_id", updatable=false)
	public Cat getMother() {
		return mother;
	}

	void setKittens(Set<Cat> kittens) {
		this.kittens = kittens;
	}

	/**
	 * 一对多
	 * @return
	 */
	@OneToMany(mappedBy="mother") 
	public Set<Cat> getKittens() {
		return kittens;
	}

	// addKitten not needed by Hibernate
	public void addKitten(Cat kitten) {
		kitten.setMother(this);
		kitten.setLitterId(kittens.size());
		kittens.add(kitten);
	}
}
