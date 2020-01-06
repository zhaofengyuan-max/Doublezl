package com.niit.biz;


import java.util.List;

import com.niit.entity.Teacher;

public interface ITeacherBiz1 {
	void save(Teacher t);
	Teacher getTeacherById(String teacherNo);
	void updateInfo(Teacher t);
	List<Object[]> selectAllCourses(String teacherNo);
}
  