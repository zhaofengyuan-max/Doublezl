package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

import javax.persistence.Table;
@Entity
@Table(name="totalcoursetable")
public class Totalcoursetable {

	
	@EmbeddedId
	@AttributeOverrides( {
        @AttributeOverride(name="courseNo", column=@Column(name="CourseNo") ), 
        @AttributeOverride(name="batNo",column=@Column(name="batNo")),
	})
	private TotalcoursetableId id;
	
	@Column(name="CouOrder")
     private String couOrder;
	@Column(name="BatNo")
     private String batNo;
	@Column(name="TeaNo")
     private String teaNo;
	@Column(name="RoomType")
     private String roomType;
	@Column(name="Term")
     private String term;
	@Column(name="Years")
    private String years;
	
	
	public Totalcoursetable() {
		super();
	}
	
	public Totalcoursetable(TotalcoursetableId id, String couOrder, String batNo, String teaNo, String roomType,
			String term, String years) {
		super();
		this.id = id;
		this.couOrder = couOrder;
		this.batNo = batNo;
		this.teaNo = teaNo;
		this.roomType = roomType;
		this.term = term;
		this.years = years;
	}


	public TotalcoursetableId getId() {
		return id;
	}
	public void setId(TotalcoursetableId id) {
		this.id = id;
	}
	public String getCouOrder() {
		return couOrder;
	}
	public void setCouOrder(String couOrder) {
		this.couOrder = couOrder;
	}
	public String getBatNo() {
		return batNo;
	}
	public void setBatNo(String batNo) {
		this.batNo = batNo;
	}
	public String getTeaNo() {
		return teaNo;
	}
	public void setTeaNo(String teaNo) {
		this.teaNo = teaNo;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}

   
	


}


