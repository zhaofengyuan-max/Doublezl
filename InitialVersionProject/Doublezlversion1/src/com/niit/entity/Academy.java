package com.niit.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * Academy generated by hbm2java
 */
@Entity
@Table(name="academy")
public class Academy{

	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	@GeneratedValue(generator="system-uuid")  
	@GenericGenerator(name="system-uuid", strategy = "assigned")  
	@Column(name="AcaNo")
     private String acaNo;
	@Column(name="AcaName")
     private String acaName;
	@Column(name="AcaDesc")
     private String acaDesc;
   
	
    public Academy() {
	}
    

	public Academy(String acaNo, String acaName, String acaDesc) {
		this.acaNo = acaNo;
		this.acaName = acaName;
		this.acaDesc = acaDesc;
	}


	public String getAcaNo() {
        return this.acaNo;
    }
    
    public void setAcaNo(String acaNo) {
        this.acaNo = acaNo;
    }

    
    public String getAcaName() {
        return this.acaName;
    }
    
    public void setAcaName(String acaName) {
        this.acaName = acaName;
    }

    
    public String getAcaDesc() {
        return this.acaDesc;
    }
    
    public void setAcaDesc(String acaDesc) {
        this.acaDesc = acaDesc;
    }

}


