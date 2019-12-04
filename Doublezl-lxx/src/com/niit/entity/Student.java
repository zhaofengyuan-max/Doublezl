package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Student generated by hbm2java
 */
@Entity
@Table(name="student")
public class Student {

	 @Id 
	 @GeneratedValue(strategy = GenerationType.SEQUENCE)
	 @Column(name="StuNo", unique=true, nullable=false, length=15)
     private String stuNo;
	 @Column(name="StuPwd", nullable=false, length=10)
     private String stuPwd;
	 @Column(name="StuName", nullable=false)
     private String stuName;
	 @Column(name="StuGender", nullable=false)
     private String stuGender;
	 @Column(name="BatNo", nullable=false, length=10)
     private String batNo;
	 @Column(name="Addr", nullable=false)
     private String addr;
	 @Column(name="PoliticalStatus", nullable=false)
     private String politicalStatus;
	 @Column(name="Images", nullable=false, length=30)
     private String images;

    public Student() {
    }

    public Student(String stuNo, String stuPwd, String stuName, String stuGender, String batNo, String addr, String politicalStatus, String images) {
       this.stuNo = stuNo;
       this.stuPwd = stuPwd;
       this.stuName = stuName;
       this.stuGender = stuGender;
       this.batNo = batNo;
       this.addr = addr;
       this.politicalStatus = politicalStatus;
       this.images = images;
    }

    public Student(String batNo, String addr, String politicalStatus, String images) {
        this.batNo = batNo;
        this.addr = addr;
        this.politicalStatus = politicalStatus;
        this.images = images;
    }
    
   
  
    public String getStuNo() {
        return this.stuNo;
    }
    
    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    
    
    public String getStuPwd() {
        return this.stuPwd;
    }
    
    public void setStuPwd(String stuPwd) {
        this.stuPwd = stuPwd;
    }

    
    
    public String getStuName() {
        return this.stuName;
    }
    
    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    
 
    public String getStuGender() {
        return this.stuGender;
    }
    
    public void setStuGender(String stuGender) {
        this.stuGender = stuGender;
    }

    
 
    public String getBatNo() {
        return this.batNo;
    }
    
    public void setBatNo(String batNo) {
        this.batNo = batNo;
    }

    
  
    public String getAddr() {
        return this.addr;
    }
    
    public void setAddr(String addr) {
        this.addr = addr;
    }

    
   
    public String getPoliticalStatus() {
        return this.politicalStatus;
    }
    
    public void setPoliticalStatus(String politicalStatus) {
        this.politicalStatus = politicalStatus;
    }

    
  
    public String getImages() {
        return this.images; 
    }
    
    public void setImages(String images) {
        this.images = images;
    }




}


