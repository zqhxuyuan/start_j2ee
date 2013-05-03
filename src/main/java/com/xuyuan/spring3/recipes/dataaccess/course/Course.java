package com.xuyuan.spring3.recipes.dataaccess.course;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "COURSE")
public class Course {
    
	/**
	 * @uml.property  name="id"
	 */
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;
    
    /**
	 * @uml.property  name="title"
	 */
    @Column(name = "TITLE", length = 100, nullable = false)
    private String title;
    
    /**
	 * @uml.property  name="beginDate"
	 */
    @Column(name = "BEGIN_DATE")
    private Date beginDate;
    
    /**
	 * @uml.property  name="endDate"
	 */
    @Column(name = "END_DATE")
    private Date endDate;
    
    /**
	 * @uml.property  name="fee"
	 */
    @Column(name = "FEE")
    private int fee;

    public Course() {
    }

    public Course(String title, Date beginDate, Date endDate, int fee) {
        this.title = title;
        this.beginDate = beginDate;
        this.endDate = endDate;
        this.fee = fee;
    }

    /**
	 * @return
	 * @uml.property  name="beginDate"
	 */
    public Date getBeginDate() {
        return beginDate;
    }

    /**
	 * @return
	 * @uml.property  name="endDate"
	 */
    public Date getEndDate() {
        return endDate;
    }

    /**
	 * @return
	 * @uml.property  name="fee"
	 */
    public int getFee() {
        return fee;
    }

    /**
	 * @return
	 * @uml.property  name="id"
	 */
    public Long getId() {
        return id;
    }

    /**
	 * @return
	 * @uml.property  name="title"
	 */
    public String getTitle() {
        return title;
    }

    /**
	 * @param beginDate
	 * @uml.property  name="beginDate"
	 */
    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    /**
	 * @param endDate
	 * @uml.property  name="endDate"
	 */
    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    /**
	 * @param fee
	 * @uml.property  name="fee"
	 */
    public void setFee(int fee) {
        this.fee = fee;
    }

    /**
	 * @param id
	 * @uml.property  name="id"
	 */
    public void setId(Long id) {
        this.id = id;
    }

    /**
	 * @param title
	 * @uml.property  name="title"
	 */
    public void setTitle(String title) {
        this.title = title;
    }
}
