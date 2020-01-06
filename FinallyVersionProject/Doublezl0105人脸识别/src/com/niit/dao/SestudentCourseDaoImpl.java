package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.SestudentCourseDao;
import com.niit.entity.SestudentCourse;
import com.niit.entity.SestudentCourseId;

@Repository(value="studentCourseDao")
public class SestudentCourseDaoImpl implements SestudentCourseDao {

	@Resource(name="ht")
	private HibernateTemplate ht;
	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}
	@Override
	public List<SestudentCourse> getStudentCourse(String stuNo) {
		String hql="from SestudentCourse where id.stuNo=?and courseType=?";
		  List<SestudentCourse> list=(List<SestudentCourse>) ht.find(hql, new String[] {stuNo,"选修"});
		
		return list;
	}
	@Override
	public void DeleteStudentCourse(SestudentCourse studentCourse) {

		ht.delete(studentCourse);
	}
	@Override
	public SestudentCourse getById(SestudentCourseId id) {
            
		
		return ht.get(SestudentCourse.class, id);
	}
	
	
	

}
