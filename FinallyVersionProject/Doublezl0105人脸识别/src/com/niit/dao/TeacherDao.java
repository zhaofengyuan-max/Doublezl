package com.niit.dao;

import javax.annotation.Resource;

import org.hibernate.FlushMode;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.entity.Teacher;


@Repository
public class TeacherDao implements ITeacherDao {
  
	@Resource(name="ht")
	private HibernateTemplate ht;
	
	@Override
	public void save(Teacher t) {
		ht.save(t);
	}

	@Override
	public Teacher getOneById(String teacherNo) {
		Teacher t = (Teacher) ht.get(Teacher.class,teacherNo);
		return t;
	}

}
