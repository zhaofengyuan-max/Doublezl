package com.niit.biz;

import com.niit.entity.Teacher;

public interface ITeacherBiz1 {
	void save(Teacher t);
	Teacher getTeacherById(String teacherNo);
	void updateInfo(Teacher t);
}
  