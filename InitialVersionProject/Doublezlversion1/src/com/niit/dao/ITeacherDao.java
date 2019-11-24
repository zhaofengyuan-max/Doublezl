package com.niit.dao;

import com.niit.entity.Teacher;    

public interface ITeacherDao {
	void save(Teacher t);
	Teacher getOneById(String teacherNo);
}
