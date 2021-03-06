package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Major generated by hbm2java
 */
@Entity
@Table(name="major")
public class Major {

	 @Id 
	 @GeneratedValue(strategy = GenerationType.SEQUENCE)
	 @Column(name="MajNo", unique=true, nullable=false, length=8)
     private String majNo;
	 @Column(name="MajName", nullable=false)
     private String majName;
	 @Column(name="MajDesc")
     private String majDesc;
	 @Column(name="AcaNo", nullable=false, length=4)
     private String acaNo;

    public Major() {
    }

	
    public Major(String majNo, String majName, String acaNo) {
        this.majNo = majNo;
        this.majName = majName;
        this.acaNo = acaNo;
    }
    public Major(String majNo, String majName, String majDesc, String acaNo) {
       this.majNo = majNo;
       this.majName = majName;
       this.majDesc = majDesc;
       this.acaNo = acaNo;
    }
   
    
    public String getMajNo() {
        return this.majNo;
    }
    
    public void setMajNo(String majNo) {
        this.majNo = majNo;
    }

    

    public String getMajName() {
        return this.majName;
    }
    
    public void setMajName(String majName) {
        this.majName = majName;
    }

    
    
    public String getMajDesc() {
        return this.majDesc;
    }
    
    public void setMajDesc(String majDesc) {
        this.majDesc = majDesc;
    }

    
   
    public String getAcaNo() {
        return this.acaNo;
    }
    
    public void setAcaNo(String acaNo) {
        this.acaNo = acaNo;
    }




}


