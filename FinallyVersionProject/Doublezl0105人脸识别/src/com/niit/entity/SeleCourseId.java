package com.niit.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class SeleCourseId implements Serializable{

	@Column(name="CourseNo")
	private String courseNo;
	
	@Column(name="CouOrder")
	private Integer couOrder;

	
	public SeleCourseId() {
	}


	public SeleCourseId(String courseNo, Integer couOrder) {
		this.courseNo = courseNo;
		this.couOrder = couOrder;
	}


	public String getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}

	public Integer getCouOrder() {
		return couOrder;
	}

	public void setCouOrder(Integer couOrder) {
		this.couOrder = couOrder;
	}


	@Override
	public boolean equals(Object other) {
		if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof SeleCourseId) ) return false;
		 SeleCourseId castOther = ( SeleCourseId ) other; 
        
		 return ( (this.getCourseNo()==castOther.getCourseNo()) || ( this.getCourseNo()!=null && castOther.getCourseNo()!=null && this.getCourseNo().equals(castOther.getCourseNo()) ) )
&& ( (this.getCouOrder()==castOther.getCouOrder()) || ( this.getCouOrder()!=null && castOther.getCouOrder()!=null && this.getCouOrder().equals(castOther.getCouOrder()) ) );
	}
	
	public int hashCode() {
        int result = 17;
        result = 37 * result + ( getCourseNo() == null ? 0 : this.getCourseNo().hashCode() );
        result = 37 * result + ( getCouOrder() == null ? 0 : this.getCouOrder().hashCode() );
        return result;
  }  
}
