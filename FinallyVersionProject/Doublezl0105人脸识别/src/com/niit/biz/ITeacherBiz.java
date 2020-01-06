package com.niit.biz;

import com.niit.entity.Teacher;
import com.niit.entity.Teacher;

public interface ITeacherBiz {
	void save(Teacher t);
	Teacher getTeacherById(String teacherNo);
}
  