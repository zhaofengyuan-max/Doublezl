package com.niit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.biz.MessageBiz;
import com.niit.entity.Message;
import com.niit.util.PageModel;




@Controller
@RequestMapping(value="message")
@MultipartConfig
public class MessageController {
	
	@Resource(name="messageBiz")
	private MessageBiz messageBiz; 
	  
	@RequestMapping(value="/findMessageWithPageByTeacher")   
	public String findVediosWithPageByTeacher(HttpServletRequest request,HttpServletResponse response)  {
		int currentPageNum=Integer.parseInt(request.getParameter("num"));
		PageModel pm=messageBiz.findMessagesWithPageByTeacher(currentPageNum);
//		//将PageModel放入reqest
	    request.setAttribute("page", pm);
		return "messagetShow";  
	}
	@RequestMapping(value="/messagetReplay") 
	public  String replayMessage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String replay=request.getParameter("replay");
		String id=request.getParameter("id");
		messageBiz.replayMessage(id,replay);
		return "messagetShow";
	}
	
	@RequestMapping(value="/findMessagesWithPage")
	public  String findMessagesWithPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("-----"+request.getParameter("num"));
		Integer stuNo=Integer.valueOf(request.getParameter("stuNo"));
		int currentNum=Integer.parseInt(request.getParameter("num"));
		System.out.println("当前页面—"+currentNum);
		PageModel pm=messageBiz.findMessagesWithPage(currentNum,stuNo);
		request.setAttribute("page", pm);
		return "s_messagesShow";
	}
	
	@RequestMapping(value="/addMessage")
	public  String addMessage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String content = request.getParameter("content");
		Integer stuNo=Integer.valueOf(request.getParameter("stuNo"));
		Message msg=new Message();  
		msg.setContent(content);  
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		msg.setLeaveWordTime(sdf.format(new Date()));
		msg.setStuNo(stuNo);
		messageBiz.addMessage(msg);
		return "s_messagesShow";
	}
	
	@RequestMapping(value="/findMessageById") 
	public  String findMessageById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String messageid=request.getParameter("id");
		System.out.println("消息名称+"+messageid);
		Message message=messageBiz.findMessageById(messageid);
		request.setAttribute("message", message);
		return "s_messageDetail";
	}

}
