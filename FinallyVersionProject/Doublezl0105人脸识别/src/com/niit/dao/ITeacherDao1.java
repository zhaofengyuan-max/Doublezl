package com.niit.dao;


import java.util.List;

import com.niit.entity.Teacher;

public interface ITeacherDao1 {
	void save(Teacher t);
	Teacher getOneById(String teacherNo);
	void updateInfo(Teacher t);
	List<Object[]> selectAllCourses(String teacherNo);
}
