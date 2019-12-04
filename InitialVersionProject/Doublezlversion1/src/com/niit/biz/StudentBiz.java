package com.niit.biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.niit.dao.IStudentDao;
import com.niit.dao.ITeacherDao;
import com.niit.entity.Student;
@Service
public class StudentBiz implements IStudentBiz {
	@Resource(name="studentDao")  
	private IStudentDao studentDao;
 
	@Override
	public Student getOneById(String rollno) {
		return studentDao.getOneById(rollno);
		
	}

	@Override
	public void modify(Student s) {
		studentDao.update(s);
		
	}
	
	@Override
	public List<Object[]> getStudentScore(String srollno, String years,
			String term) {
		 return studentDao.getStudentScore(srollno, years, term); 
	}
	
	@Override
	public List<Object[]> getTeacherByStuNo(String stuNo){
		 return studentDao.getTeacherByStuNo(stuNo); 
	}

}
