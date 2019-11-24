package com.niit.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ITeacherDao1;
import com.niit.entity.Teacher;

@Transactional
@Service  
public class TeacherBiz1 implements ITeacherBiz1 {
	 
	@Resource(name="teacherDao1")  
	private ITeacherDao1 teacherDao1;

	@Override
	public void save(Teacher t) {
		teacherDao1.save(t);
	}

	@Override
	public Teacher getTeacherById(String teacherNo) {
		Teacher t=teacherDao1.getOneById(teacherNo);
		return t;
	}

	@Override
	public void updateInfo(Teacher t) {
		teacherDao1.updateInfo(t);
	}

}
