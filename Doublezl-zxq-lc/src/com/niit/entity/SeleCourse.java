package com.niit.entity;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="selecourse")
public class SeleCourse {
	
	private SeleCourseId id;
	
	@Column(name="CourseName")
	private String courseName;
	@Column(name="CouVolume")
	private Integer couVolume;
	@Column(name="CourseCredit")
	private Integer courseCredit;
	@Column(name="TeaNo")
	private String teaNo;
	@Column(name="TeaName")
	private String teaName;
	@Column(name="AcaName")
	private String acaName;
	@Column(name="TeaType")
	private String teaType;
	@Column(name="TeaSecond")
	private String teaSecond;
	@Column(name="CouPlan")
	private String couPlan;
	@Column(name="WeekPlan")
	private String weekPlan;
	@Column(name="Week")
	
	private String week;
	@Column(name="Time")
	private String time;
	@Column(name="RoomType")
	private String roomType;
	@Column(name="RoomName")
	private String roomName;
	@Column(name="CouRemark")
	private String couRemark;
	@Column(name="CountSum")
	private Integer countSum;

	
	

	public SeleCourse() {
		
	}
	
	public SeleCourse(SeleCourseId id) {
		this.id = id;
	}

	
	 

	public SeleCourse(SeleCourseId id, String courseName, Integer couVolume, Integer courseCredit, String teaNo,
			String teaName, String acaName, String teaType, String teaSecond, String couPlan, String weekPlan,
			String week, String time, String roomType, String roomName, String couRemark, Integer countSum) {
		super();
		this.id = id;
		this.courseName = courseName;
		this.couVolume = couVolume;
		this.courseCredit = courseCredit;
		this.teaNo = teaNo;
		this.teaName = teaName;
		this.acaName = acaName;
		this.teaType = teaType;
		this.teaSecond = teaSecond;
		this.couPlan = couPlan;
		this.weekPlan = weekPlan;
		this.week = week;
		this.time = time;
		this.roomType = roomType;
		this.roomName = roomName;
		this.couRemark = couRemark;
		this.countSum = countSum;
	}

	@EmbeddedId
	 
     @AttributeOverrides( {
     @AttributeOverride(name="courseNo", column=@Column(name="CourseNo") ), 
     @AttributeOverride(name="couOrder", column=@Column(name="CouOrder") ) } )
	public SeleCourseId getId() {
		return id;
	}

	public void setId(SeleCourseId id) {
		this.id = id;
	}

	
	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}


	public Integer getCouVolume() {
		return couVolume;
	}

	
	public void setCouVolume(Integer couVolume) {
		this.couVolume = couVolume;
	}

	
	public Integer getCourseCredit() {
		return courseCredit;
	}


	public void setCourseCredit(Integer courseCredit) {
		this.courseCredit = courseCredit;
	}

	
	public String getTeaNo() {
		return teaNo;
	}

	
	public void setTeaNo(String teaNo) {
		this.teaNo = teaNo;
	}

	
	public String getTeaName() {
		return teaName;
	}


	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}

	
	public String getAcaName() {
		return acaName;
	}

	
	public void setAcaName(String acaName) {
		this.acaName = acaName;
	}

	
	public String getTeaType() {
		return teaType;
	}

	
	public void setTeaType(String teaType) {
		this.teaType = teaType;
	}


	public String getTeaSecond() {
		return teaSecond;
	}


	public void setTeaSecond(String teaSecond) {
		this.teaSecond = teaSecond;
	}

	
	public String getCouPlan() {
		return couPlan;
	}

	
	public void setCouPlan(String couPlan) {
		this.couPlan = couPlan;
	}

	
	public String getWeekPlan() {
		return weekPlan;
	}

	
	public void setWeekPlan(String weekPlan) {
		this.weekPlan = weekPlan;
	}

	
	public String getWeek() {
		return week;
	}

	
	public void setWeek(String week) {
		this.week = week;
	}

	
	public String getTime() {
		return time;
	}

	
	public void setTime(String time) {
		this.time = time;
	}

	
	public String getRoomType() {
		return roomType;
	}

	
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	
	public String getCouRemark() {
		return couRemark;
	}


	public void setCouRemark(String couRemark) {
		this.couRemark = couRemark;
	}

	/**
	 * @return the countSum
	 */
	public Integer getCountSum() {
		return countSum;
	}

	/**
	 * @param countSum the countSum to set
	 */
	public void setCountSum(Integer countSum) {
		this.countSum = countSum;
	}
	
	

}
