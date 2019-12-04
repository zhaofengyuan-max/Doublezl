package com.niit.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.biz.SeleCourseBiz;
import com.niit.biz.StudentBiz;
import com.niit.biz.SestudentCourseBiz;
import com.niit.entity.Academy;
import com.niit.entity.SeleCourse;
import com.niit.entity.SeleCourseId;
import com.niit.entity.SestudentCourse;
import com.niit.entity.SestudentCourseId;
@Controller
public class TestHandler {

	@Resource(name="seleCourseBiz")
	private SeleCourseBiz  seleCourseBiz;
	@Resource(name="studentBiz")
	private StudentBiz studentBiz;
	@Resource(name="studentCourseBiz")
	private SestudentCourseBiz  studentCourseBiz;
	
	
	@RequestMapping("demo05")
	public ModelAndView testDemo05() {
		ModelAndView mv = new ModelAndView("s_seleCourse");
		List<SeleCourse> list=seleCourseBiz.getAll();
		mv.addObject("seleList", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("demo06")
	public int testdemo06(@RequestParam("stuNo") String stuNo,
			@RequestParam("courseNo") String courseNo,
			@RequestParam("couOrder") Integer couOrder,
			@RequestParam("courseName") String courseName
			) {
		
		System.out.println(stuNo+"--"+courseNo+"--"+couOrder);
		    SeleCourseId id=new SeleCourseId(courseNo,couOrder);
		
	    return 	seleCourseBiz.getById(id,courseName, stuNo);
	}
	
	
	@RequestMapping("demo08")
	public String testDemo08() {
		List<Object[]> list=studentBiz.getStudentScore("2016207155", "2018", "春季学期");
		System.out.println(list);
		for(Object[] o:list) {
			System.out.println("hhhhhh");
			System.out.println(o[0]+"--"+o[1]+"--"+o[2]+"--"+o[3]+"--"+o[4]+"--"+o[5]+"--"+o[6]);
		}
		    return   "success";
	}
	
	@RequestMapping("demo09")
	public ModelAndView testDemo09(@RequestParam("stuNo") String stuNo) {
		ModelAndView mv = new ModelAndView("s_seled");
	    List<SestudentCourse> list=studentCourseBiz.getStudentCourse(stuNo);
	    mv.addObject("stuSeledCourseList", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("demo10")
	public int testDemo10(@RequestParam("stuNo") String stuNo,
			@RequestParam("courseNo") String courseNo,
			@RequestParam("couOrder") Integer couOrder,
			@RequestParam("year")  String year,
			@RequestParam("term") String term
			         ) {
		
          SestudentCourseId studentCourseId = new SestudentCourseId(stuNo, courseNo, couOrder, year, term);
		  SestudentCourse studentCourse = studentCourseBiz.getById(studentCourseId);
          
          
          //System.out.println(studentCourse.getCourseName()+"--"+studentCourse.getCourseType());
	
		studentCourseBiz.DeleteStudentCourse(studentCourse); 
		SeleCourseId seleCourseId=new SeleCourseId(courseNo,couOrder);
		seleCourseBiz.updataSeleCourse(seleCourseId);
		return 1;
	}
}
