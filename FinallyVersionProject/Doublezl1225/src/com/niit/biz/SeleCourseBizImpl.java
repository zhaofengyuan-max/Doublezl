package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.biz.SeleCourseBiz;
import com.niit.dao.SeleCourseDao;
import com.niit.entity.SeleCourse;
import com.niit.entity.SeleCourseId;

@Service(value="seleCourseBiz")
public class SeleCourseBizImpl implements SeleCourseBiz {

	@Resource(name="seleCourseDao")
	private SeleCourseDao seleCourseDao;
	public void setSeleCourseDao(SeleCourseDao seleCourseDao) {
		this.seleCourseDao = seleCourseDao;
	}


	@Override
	public List<SeleCourse> getAll() {
		return seleCourseDao.getAll();
	}


	@Override
	public int getById(SeleCourseId id,String courseName, String stuNo) {
		// TODO Auto-generated method stub
		return seleCourseDao.getById(id,courseName, stuNo);
	}


	@Override
	public void updataSeleCourse(SeleCourseId id) {
		seleCourseDao.updataSeleCourse(id);		
	}

}
