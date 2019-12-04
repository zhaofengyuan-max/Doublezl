package com.niit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.biz.IAdminBiz;
import com.niit.entity.Academy;
import com.niit.entity.Admin;
@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Resource(name="adminBiz")
	private IAdminBiz adminBiz;
	
	@RequestMapping("login")
	public ModelAndView login(@RequestParam(value="user") String user,
			            @RequestParam(value="upwd") String upwd,
			            HttpSession session) {
	System.out.println("ddddd");
	Admin admin=adminBiz.getAdminById(user);
	System.out.println(admin.getAdminPwd());  
	if(admin.getAdminPwd().equals(upwd)) {
		ModelAndView mv1 = new ModelAndView("a_guanlixueyuan");
		mv1.addObject("admin", admin);
		return mv1;
	}else{
		ModelAndView mv2 = new ModelAndView("adminlogin");
	     mv2.addObject("stalogin", "用户名或密码错误！");
		return mv2;
	}
	
  }
   @RequestMapping("adminStu")
	public	ModelAndView adminStu(@RequestParam(name="acaName")  String acaName,
			@RequestParam(name="majName")  String majName,
			@RequestParam(name="batName")  String batName,
			@RequestParam(name="stuNo")  String stuNo
			) {
		ModelAndView mv= new ModelAndView("a_guanlixuesheng");
		 List<Object[]> list=adminBiz.getAdminStu(acaName, majName, batName, stuNo);
		 mv.addObject("slist", list);
		return mv;
	}
   
   @ResponseBody
   @RequestMapping("deleStu")
   public int deleStu(@RequestParam(name="stuNo") String stuNo) {
	   
	   return adminBiz.deleStu(stuNo);
   }
   @RequestMapping("adminMaj")
   public ModelAndView  adminMaj(@RequestParam(name="acaName")  String acaName
			
		   ) {
	   ModelAndView mv= new ModelAndView("a_guanlizhuanye");
	   List<Object[]> list=  adminBiz.getAdminMaj(acaName);
	   mv.addObject("mlist", list);
	   return mv;
   }
   
   @RequestMapping("adminBat")
   public ModelAndView  adminBat(
		                       @RequestParam(name="acaName")  String acaName1,
		                       @RequestParam(name="majName")  String majName
		   ) {
	   
	   System.out.println(acaName1+"=="+majName);
	   ModelAndView mv= new ModelAndView("a_guanlibanji");
	   List<Object[]> list= adminBiz.getAdminBat(acaName1,majName);
	   mv.addObject("blist", list);
	   return mv;
   }
   @RequestMapping("adminTea")
   public ModelAndView  adminTea( @RequestParam(name="acaName")  String acaName
		   ) {
	   
	   System.out.println(acaName);
	   ModelAndView mv= new ModelAndView("a_guanliTeacher");
	   List<Object[]> list= adminBiz.getAdminTea(acaName);
	   mv.addObject("blist", list);
	   return mv;
   }
   @RequestMapping("adminAca")
   public ModelAndView  adminAca() {
	   ModelAndView mv= new ModelAndView("a_guanlixueyuan");
	 List<Academy> list=adminBiz.getAdminAca();
	 mv.addObject("alist", list);
	   return mv;
   }
   
   @ResponseBody
   @RequestMapping("deleAca")
   public int deleAca(@RequestParam(name="acaNo") String acaNo) {
	   
	   return adminBiz.deleAca(acaNo);
   } 
}
