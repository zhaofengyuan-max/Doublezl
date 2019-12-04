package com.niit.entity;
// Generated 2018-12-22 11:45:53 by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;

import javax.persistence.Table;

/**
 * Course generated by hbm2java
 */
@Entity
@Table(name="grade")
public class Grade {

	
	@EmbeddedId
	@AttributeOverrides( {
        @AttributeOverride(name="courseNo", column=@Column(name="CourseNo") ), 
        @AttributeOverride(name="stuNo",column=@Column(name="StuNo")),
	})
	private GradeId id;
	
	@Column(name="TeaNo")
     private String teaNo;
	@Column(name="Years")
     private String years;
	@Column(name="Term")
     private String term;
	@Column(name="UsualScore")
     private int usualScore;
	@Column(name="FinalScore")
     private String finalScore;
	@Column(name="SumScore")
    private String sumScore;

    public Grade() {
    }

	public GradeId getId() {
		return id;
	}

	public void setId(GradeId id) {
		this.id = id;
	}

	public String getTeaNo() {
		return teaNo;
	}

	public void setTeaNo(String teaNo) {
		this.teaNo = teaNo;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public int getUsualScore() {
		return usualScore;
	}

	public void setUsualScore(int usualScore) {
		this.usualScore = usualScore;
	}

	public String getFinalScore() {
		return finalScore;
	}

	public void setFinalScore(String finalScore) {
		this.finalScore = finalScore;
	}

	public String getSumScore() {
		return sumScore;
	}

	public void setSumScore(String sumScore) {
		this.sumScore = sumScore;
	}

	public Grade(GradeId id, String teaNo, String years, String term, int usualScore, String finalScore,
			String sunScore) {
		super();
		this.id = id;
		this.teaNo = teaNo;
		this.years = years;
		this.term = term;
		this.usualScore = usualScore;
		this.finalScore = finalScore;
		this.sumScore = sumScore;
	}

	


}


