package com.niit.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;   
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.biz.ITeacherBiz;
import com.niit.biz.ITeacherBiz1;
import com.niit.entity.Teacher;
import com.niit.entity.Teacher;


@Controller
@RequestMapping(value="teacher")
public class TeacherController {
	
	@Resource(name="teacherBiz")
	private ITeacherBiz teacherBiz;
	
	@Resource(name="teacherBiz1")
	private ITeacherBiz1 teacherBiz1;
	
	public Teacher t;
	public Teacher t1;
	
	@RequestMapping(value="/login")   
	public String login(@RequestParam(value="teaNo") String teaNo,
			            @RequestParam(value="teaPass") String teaPass,
			            HttpSession session)  {
	 	System.out.println(teaNo+"--"+teaPass);
	 	t1=teacherBiz1.getTeacherById(teaNo);
	 	System.out.println(t1.getEmail()+"--------------");
	 	if(t1!=null) {
//	 		t=t1;
	 		session.setAttribute("teacher", t1);
	 		return "personalInfo";
//	 		return "NewFile";
	 	}
	 	System.out.println(t1+"-----------------");
	 	return "WEB-INF/faliure";
	}
	
	@RequestMapping(value="/logout") 
	public String logout(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		session.invalidate();
		String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
		response.sendRedirect(basePath+"index2.jsp");
		return null;
//		return "index2";
	}
	
	@RequestMapping(value="/updateInfo")   
	public String updateInfo(@RequestParam(value="teaNo") String teaNo,
			                 @RequestParam(value="teaName") String teaName,
			                 @RequestParam(value="teaPass") String teaPass,
			                 @RequestParam(value="gender") String gender,
			                 @RequestParam(value="birthdate") String birthdate,
			                 @RequestParam(value="email") String email,
			                 @RequestParam(value="acaNo") String acaNo,
			                 HttpSession session) throws ParseException  {
	 	System.out.println(teaNo+"--"+teaPass);
	 	Teacher t1=new Teacher();
	 	t1.setTeaNo(teaNo);
	 	t1.setTeaName(teaName);
	 	t1.setTeaPass(teaPass);
	 	t1.setGender(gender);
	 	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthdate);
	 	t1.setBirthdate(date);
	 	t1.setAcaNo(acaNo);
	 	t1.setEmail(email);
	 	teacherBiz1.updateInfo(t1);
	 	return "WEB-INF/hello";
	}
	
	@RequestMapping(value="/updatePass")   
	public String updatePass(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
	 	System.out.println(request.getParameter("teaPass"));
	 	t=t1;
	 	String teaPass=request.getParameter("teaPass");
	 	t.setTeaPass(teaPass);;
	 	teacherBiz1.updateInfo(t);
	 	if(session!=null) {
	 		session.invalidate();
	 	}
	 	String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
		response.sendRedirect(basePath+"index2.jsp");
		return null;
	}
	
	
	
	
	//澧炴坊鏁版嵁鐨勬祴璇�     
//	@RequestMapping(value="/login")   
//	public String login(@RequestParam(value="teaNo") String teaNo,
//			            @RequestParam(value="teaName") String teaName,
//			            @RequestParam(value="teaPass") String teaPass,
//			            @RequestParam(value="gender") String gender,
//			            @RequestParam(value="birthdate") String birthdate,
//			            @RequestParam(value="email") String email,
//			            HttpSession session)  {
//	 	System.out.println(teaName+"--"+teaPass);
//	 	Teacher t=new Teacher();
//	 	t.setTeano(teaNo);
//	 	t.setTeaname(teaName);
//	 	t.setTeapass(teaPass);
//	 	t.setGender(gender);
//	 	t.setEmail(email);
//	 	t.setBirthdate(birthdate);
//	 	teacherBiz.save(t);
//	 	return "hello";
//	}
	
	@RequestMapping(value="/personalInfo")
	public String personalInfo(HttpSession session)  {
	    return "personalInfo";  
	}
	
	@RequestMapping(value="/updatePass1")
	public String updatePass1(HttpSession session)  {
//		System.out.println(teaname+"--"+teapass);
//		User user=new User();
//		user.setName(name);
//		user.setGender(gender);
//		userBiz.save(user);
//		session.setAttribute("user", user);
	    return "updatePass";  
	}

}
