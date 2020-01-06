package com.niit.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

//import com.niit.entity.Teacher;
import com.niit.entity.Teacher;


@Repository
public class TeacherDao1 implements ITeacherDao1 {
  
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

	@Override
	public void updateInfo(Teacher t) {
		ht.update(t);
	}

	@Override
	public List<Object[]> selectAllCourses(String teacherNo) {
		String hql=" select a.id.courseNo,a.courseName from Course a,Totalcoursetable b" +
      		" where a.id.courseNo=b.id.courseNo and b.teaNo=?";
		List<Object[]>  coList=(List<Object[]>) ht.find(hql, teacherNo);
		return coList;
	}

}
