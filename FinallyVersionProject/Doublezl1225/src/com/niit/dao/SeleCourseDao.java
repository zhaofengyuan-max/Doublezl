package com.niit.dao;

import java.util.List;

import com.niit.entity.SeleCourse;
import com.niit.entity.SeleCourseId;

public interface SeleCourseDao {

	public List<SeleCourse>  getAll();
	
	public int getById(SeleCourseId id,String courseName,String stuNo);
	
	public void updataSeleCourse(SeleCourseId id) ;
}
