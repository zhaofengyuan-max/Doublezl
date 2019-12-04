package com.niit.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.niit.dao.SeleCourseDao;
import com.niit.entity.SeleCourse;
import com.niit.entity.SeleCourseId;
import com.niit.entity.Student;
import com.niit.entity.SestudentCourse;
import com.niit.entity.SestudentCourseId;

@Repository(value="seleCourseDao")
public class SeleCourseDaoImpl implements SeleCourseDao{
	@Resource(name="ht")
	private HibernateTemplate ht;
	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}
	

	@Override
	public List<SeleCourse> getAll() {
		
		List<SeleCourse> list=ht.loadAll(SeleCourse.class);
		return list;
	}


	@Override
	public int getById(SeleCourseId id,String courseName,String stuNo) {
		SeleCourse s=ht.get(SeleCourse.class, id);
		if(s.getCountSum()<s.getCouVolume()) {
			int sum=s.getCountSum()+1;
			int volum=s.getCouVolume()-1;
			s.setCountSum(sum);
			s.setCouVolume(volum);
			SestudentCourseId stuCouId=new SestudentCourseId();
			stuCouId.setStuNo(stuNo);
			stuCouId.setCourseNo(id.getCourseNo());
			stuCouId.setCouOrder(id.getCouOrder());
			stuCouId.setYears("2019");
			stuCouId.setTerm("秋季学期");
			SestudentCourse stuCou=new SestudentCourse();
			stuCou.setId(stuCouId);	
			stuCou.setCourseType("选修");
			stuCou.setCourseName(courseName);
			ht.save(stuCou);
			return 1;
		}else{
			return 0;
		}
	}


	@Override
	public void updataSeleCourse(SeleCourseId id) {
		SeleCourse s=ht.get(SeleCourse.class, id);
		int sum=s.getCountSum()-1;
		int volum=s.getCouVolume()+1;
		s.setCountSum(sum);
		s.setCouVolume(volum);
	}
	
	

}
