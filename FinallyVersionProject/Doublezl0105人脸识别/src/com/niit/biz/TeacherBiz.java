package com.niit.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.dao.ITeacherDao;
import com.niit.entity.Teacher;

@Service
public class TeacherBiz implements ITeacherBiz {
	
	@Resource(name="teacherDao")  
	private ITeacherDao teacherDao;

	@Override
	public void save(Teacher t) {
		teacherDao.save(t);;

	}

	@Override
	public Teacher getTeacherById(String teacherNo) {
		Teacher t=teacherDao.getOneById(teacherNo);
		return t;
	}

}
