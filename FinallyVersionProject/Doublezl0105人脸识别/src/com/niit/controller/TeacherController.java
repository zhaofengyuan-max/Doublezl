package com.niit.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.niit.biz.ITeacherBiz;
import com.niit.biz.ITeacherBiz1;
import com.niit.entity.Teacher;
import com.niit.util.sendEmail;
import com.niit.util.sendEmail1;
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
	public static final String MAIL_FROM = "zhao_linhua@foxmail.com";// 指明邮件的发件人
	public static final String PASSWORD_MAIL = "dzwpaipkgtfajiij";// 指明邮件的发件人登陆密码
	public static final String MAIL_HOST = "smtp.qq.com"; // 邮件的服务器域名
	
	@RequestMapping(value="/login")   
	public String login(@RequestParam(value="teaNo") String teaNo,
			            @RequestParam(value="teaPass") String teaPass,
			            HttpServletRequest request,HttpServletResponse response,
			            HttpSession session) throws IOException  {
//	 	System.out.println(teaNo+"--"+teaPass);
	 	t1=teacherBiz1.getTeacherById(teaNo);
	 	System.out.println(t1.getEmail()+"--------------");
	 	String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
	 	if(t1!=null) {
//	 		t=t1;
	 		session.setAttribute("teacher", t1);
	 		response.sendRedirect(basePath+"personalInfo.jsp");
			return null;
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
	
	
	@RequestMapping(value="/personalInfo")
	public String personalInfo(HttpSession session)  {
	    return "personalInfo";  
	}
	
	@RequestMapping(value="/updatePass1")
	public String updatePass1(HttpSession session)  {
	    return "updatePass";  
	}
	
//	@RequestMapping(value ="/find")
//	public String find(@RequestParam(value = "teaNo") String teaNo, 
//			           @RequestParam(value = "qq") String qq, 
//						HttpSession session) {
//		System.out.println(teaNo + "--"+qq );
//		int r=0;
//		String message="";
//		t=teacherBiz1.getTeacherById(teaNo);
//		String pass=t.getTeaPass();
//		if(null!=t) {
//			Random random=new Random();
//			r=random.nextInt(8999)+1000;//生成四位验证码
//			sendEmail send=new sendEmail(teaNo,qq,r,pass);
//			send.Email();
//			message="验证码已经发送到你的邮箱，请注意 查看!";
////			password=rs.getString("密码");
//			System.out.println("随机数为："+r+"密码为:"+pass);
//			
//		}
//		session.setAttribute("random", r);
//		session.setAttribute("message", message);
//		return "checkrandom";
//	}
	
	@RequestMapping(value ="/find")
	public String find(@RequestParam(value = "teaNo") String teaNo, 
			           @RequestParam(value = "qq") String qq, 
					HttpSession session) throws Exception {
		System.out.println(teaNo + "--"+qq );
		int r=0;
		String message="";
		t=teacherBiz1.getTeacherById(teaNo);
		String pass=t.getTeaPass();
		if(null!=t) {  
			Random random=new Random();
			r=random.nextInt(8999)+1000;//生成四位验证码
			sendEmail1 send1=new sendEmail1();
			String mailText = "验证码已经发送到你的邮箱，请注意 查看!"+"验证码为:"+r+"密码为:"+pass;
			String mailTitle="您的验证码为:";
			Boolean yesno=send1.SendEmail(qq, mailTitle, mailText);
			System.out.println(yesno);
			
		}
		session.setAttribute("random", r);
		return "checkrandom";
	}
	
	
	@RequestMapping(value="/checkRandom")   
	public String checkRandom(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
	 	String path = request.getContextPath();
	    String basePath = request.getScheme() + "://"
	            + request.getServerName() + ":" + request.getServerPort()
	            + path + "/";
		response.sendRedirect(basePath+"index2.jsp");
		return null;
	}
	
	//批量录入成绩页面
	@RequestMapping(value="/selectAllCourses")   
	public String selectAllCourses(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
		t=t1;
		List<Object[]> coList=teacherBiz1.selectAllCourses(t.getTeaNo());
		System.out.println(coList.get(0)+"------");
		session.setAttribute("coList", coList);
		return "inputGrade";
	 	
	}

}
