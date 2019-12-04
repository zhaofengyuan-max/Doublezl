package com.niit.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

import com.niit.biz.IStudentBiz;
import com.niit.entity.Student;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/student")
public class StudentController {

	private Student s;
	
	@Resource(name = "studentBiz")
	private IStudentBiz studentBiz;

	@RequestMapping(value ="/login")
	public String login(@RequestParam(value = "stuNo") String stuNo, 
						HttpSession session) {
		System.out.println(stuNo + "--" );
		s = studentBiz.getOneById(stuNo);
		session.setAttribute("student", s);
		return "s_studentstatus";
	}
	
	@RequestMapping(value = "/updatepassword")
	public String updatePassword(HttpServletRequest request, HttpServletResponse response, 
			HttpSession session) throws IOException {
		System.out.println(request.getParameter("stuPwd"));
		String stuPassword = request.getParameter("stuPwd");
		s.setStuPwd(stuPassword);
		studentBiz.modify(s);
		if (session != null) {
			session.invalidate();
		}
		String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
		response.sendRedirect(basePath+"index.jsp");
		return null;

    }
	
	@RequestMapping(value="/queryScore") 
	public String queryScore(
			            @RequestParam(value="years") String years,
                        @RequestParam(value="term") String term,
                        @RequestParam(value="stuNo") String stuNo,
                        HttpSession session
                        )  {	
		 System.out.println(years+"--"+term+"--"+ stuNo);
		 s=studentBiz.getOneById(stuNo);
		 if(s!=null){
		 List<Object[]> list=studentBiz.getStudentScore(stuNo, years, term);
		 System.out.println(list+"------");
		 session.setAttribute("scoreList",list);
		 }
	     return "s_chengjichaxun";
	}
	
	@RequestMapping(value="/logout") 
	public String logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
		response.sendRedirect(basePath+"index.jsp");
		session.invalidate();
		return null;
	}
	
	@RequestMapping(value="/forgetPass")   
	public String forgetPass(@RequestParam(value="stuNo") String stuNo,
			            @RequestParam(value="stuName") String stuName,
			            @RequestParam(value="stuPass") String stuPass,
			            HttpServletRequest request,
			            HttpServletResponse response,
			            HttpSession session) throws IOException  {
	 	Student s1=new Student();
	 	s1=studentBiz.getOneById(stuNo);
		if(s1!=null ){
			if(stuName == s1.getStuName()){
	 					s1.setStuPwd(stuPass);
	 					studentBiz.modify(s1);
		  }
		}
		else{
	 	System.out.println("修改失败，没有该学生-----------------");
	 	return "s_passfailure";
		}
//		session.invalidate();
//		String path = request.getContextPath();
//	    String basePath = request.getScheme() + "://"
//	            + request.getServerName() + ":" + request.getServerPort()
//	            + path + "/";
//		response.sendRedirect(basePath+"index.jsp");
        return "index";
	}
	@RequestMapping(value="/findTeacher") 
	public String findTeacher(@RequestParam(value="stuNo") String stuNo,
	                        HttpSession session)  {	
	 System.out.println(stuNo);
	 s=studentBiz.getOneById(stuNo);
	 if(s!=null){
	 List<Object[]> list=studentBiz.getTeacherByStuNo(stuNo);
	 System.out.println(list+"------");
	 session.setAttribute("teacherList",list);
	 }
	     return "s_findTeacher";
	}
	
	
	

}
