package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TotalcoursetableId implements Serializable{

	@Column(name="CourseNo")
    private String courseNo;
	@Column(name="BatNo")
    private String batNo;
	
	
	public TotalcoursetableId() {
		super();
	}
	public String getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}
	public String getBatNo() {
		return batNo;
	}
	public void setBatNo(String batNo) {
		this.batNo = batNo;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((batNo == null) ? 0 : batNo.hashCode());
		result = prime * result + ((courseNo == null) ? 0 : courseNo.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TotalcoursetableId other = (TotalcoursetableId) obj;
		if (batNo == null) {
			if (other.batNo != null)
				return false;
		} else if (!batNo.equals(other.batNo))
			return false;
		if (courseNo == null) {
			if (other.courseNo != null)
				return false;
		} else if (!courseNo.equals(other.courseNo))
			return false;
		return true;
	}
	
	
	
    

}
