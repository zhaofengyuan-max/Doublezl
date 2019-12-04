package com.niit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.biz.ICourseBiz;
import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

@Controller
@RequestMapping(value="course")
public class CourseController {
	
	@Resource(name="courseBiz")
	private ICourseBiz courseBiz;
	
	@Resource(name = "studentBiz")
	private IStudentBiz studentBiz;
	
	@RequestMapping(value="/findScore") 
	public String login(@RequestParam(value="teaNo") String teaNo,
                        @RequestParam(value="years") String years,
                        HttpSession session)  {
		 List<Object[]> list=courseBiz.getBatchScore(teaNo, years);
		 System.out.println(list+"------");
		 session.setAttribute("gradeList",list);
	     return "manageGrade";
	}
	
	@RequestMapping(value="/findcourses") 
	public String findTcourses(@RequestParam(value="teaNo") String teaNo,
                               HttpServletRequest session)  {
		 List<Object[]> list=courseBiz.getCourses(teaNo);
		 System.out.println(list+"------");
		 session.setAttribute("courseList",list);
	     return "manageCourses";
	}
	
	@RequestMapping(value="/queryPersonKeBiao") 
	public String queryPersonKeBiao(@RequestParam(value="years") String years,
                        @RequestParam(value="term") String term,
                        @RequestParam(value="weeks") int weeks,
                        @RequestParam(value="stuNo") String stuNo,
                        HttpSession session)  {
		System.out.println(years+"--"+term+"--"+ weeks +"--"+stuNo);
		Student s=studentBiz.getOneById(stuNo);
		if(s!=null){
		List<Object[]> list=courseBiz.personCourseListI(stuNo, term, years, weeks);
		System.out.println(list+"------");
		session.setAttribute("personCouList",list);	    
		}
		return "s_kebiaochaxun";
	}
}
