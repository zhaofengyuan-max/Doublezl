package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * StudentCourse generated by hbm2java
 */
@Entity
@Table(name="sestudentcourse")
public class SestudentCourse {


     private SestudentCourseId id;
     @Column(name="CourseType")
     private String courseType;
     @Column(name="CourseName")
     private String courseName;

    public SestudentCourse() {
    }

 
     public SestudentCourse(SestudentCourseId id, String courseType) {
		this.id = id;
		this.courseType = courseType;
	}


	 @GeneratedValue(generator="stu_course")  
 	 @GenericGenerator(name="stu_course", strategy = "assigned")  
     @EmbeddedId
     @AttributeOverrides( {
        @AttributeOverride(name="stuNo", column=@Column(name="StuNo", nullable=false, length=15) ), 
        @AttributeOverride(name="courseNo", column=@Column(name="CourseNo") ), 
        @AttributeOverride(name="couOrder", column=@Column(name="CouOrder") ), 
        @AttributeOverride(name="years", column=@Column(name="Years", nullable=false, length=4) ), 
        @AttributeOverride(name="term", column=@Column(name="term", nullable=false) ) } )
    public SestudentCourseId getId() {
        return this.id;
    }
    
    public void setId(SestudentCourseId id) {
        this.id = id;
    }


	public String getCourseType() {
		return courseType;
	}


	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}




}

