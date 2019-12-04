package com.niit.biz;

import java.util.List;

import com.niit.entity.Student;

public interface IStudentBiz {
	Student getOneById(String rollno);
	
	void modify(Student s);
	
	List<Object[]> getStudentScore(String srollno,String years,String term);
	
	List<Object[]> getTeacherByStuNo(String stuNo);

}
