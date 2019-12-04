package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.biz.SestudentCourseBiz;
import com.niit.dao.SestudentCourseDao;
import com.niit.entity.SestudentCourse;
import com.niit.entity.SestudentCourseId;
@Service(value="studentCourseBiz")
public class SestudentCourseBizImpl implements SestudentCourseBiz {

	@Resource(name="studentCourseDao")
	private SestudentCourseDao  studentCourseDao;
	public void setStudentCourseDao(SestudentCourseDao studentCourseDao) {
		this.studentCourseDao = studentCourseDao;
	}

	@Override
	public List<SestudentCourse> getStudentCourse(String stuNo) {
		return  studentCourseDao.getStudentCourse(stuNo);
	}

	@Override
	public void DeleteStudentCourse(SestudentCourse studentCourse) {

		studentCourseDao.DeleteStudentCourse(studentCourse);
	}

	@Override
	public SestudentCourse getById(SestudentCourseId id) {
		return studentCourseDao.getById(id);
	}

}
