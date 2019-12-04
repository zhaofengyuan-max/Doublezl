package com.niit.dao;

import java.util.List;

import com.niit.entity.SestudentCourse;
import com.niit.entity.SestudentCourseId;

public interface SestudentCourseDao {
	
public List<SestudentCourse> getStudentCourse(String stuNo);

public void DeleteStudentCourse(SestudentCourse studentCourse);

public SestudentCourse getById(SestudentCourseId id);
}
