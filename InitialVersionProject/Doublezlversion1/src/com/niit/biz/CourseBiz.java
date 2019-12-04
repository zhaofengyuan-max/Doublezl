package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.ICourseDao;;


@Transactional
@Service
public class CourseBiz implements ICourseBiz {
	@Resource(name="courseDao")  
	private ICourseDao courseDao;

	@Override
	public List<Object[]> getCourses(String teaNo) {
		return courseDao.getCourses(teaNo);
	}

	@Override
	public List<Object[]> getBatchScore(String teaNo, String years) {
		@SuppressWarnings("unused")
		List<Object[]> list=courseDao.getBatchScore(teaNo, years);
		return list;
	}

	@Override
	public List<Object[]> personCourseListI(String srollno, String term,
			String years, int weeks) {
		 return courseDao.getPersonKebiao(srollno, term, years, weeks);
	}

}
