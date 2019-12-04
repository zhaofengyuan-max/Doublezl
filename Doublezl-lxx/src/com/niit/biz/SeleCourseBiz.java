package com.niit.biz;

import java.util.List;

import com.niit.entity.SeleCourse;
import com.niit.entity.SeleCourseId;
import com.niit.entity.SestudentCourse;

public interface SeleCourseBiz {

	public List<SeleCourse>  getAll();
	public int getById(SeleCourseId id,String courseName,String stuNo);
	public void updataSeleCourse(SeleCourseId id) ;
}
