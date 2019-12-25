package com.niit.controller;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.niit.biz.VedioBiz;
import com.niit.entity.Vedio;
import com.niit.util.PageModel;



@Controller
@RequestMapping(value="vedio")
@MultipartConfig
public class VedioController {
	
	@Resource(name="vedioBiz")
	private VedioBiz vedioBiz;  
	
	@RequestMapping(value="/findAllVedio")   
	public String login(HttpServletRequest request,HttpServletResponse response,HttpSession session)  {
	 	List<Vedio> vedioList=vedioBiz.findAllVedio();
	 	System.out.println(vedioList+"----------------");
	 	if(null!=vedioList) {
//	 		session.setAttribute("vedioList", vedioList);
	 		request.setAttribute("vedioList", vedioList);
	 		return "s_showVedio";
	 	}
	 	return "index2";
	}
	
	@RequestMapping(value="/findVedioById")   
	public String findVedioById(@RequestParam(value="vedioId") Integer vedioId,HttpServletRequest request,
			                    HttpSession session)  {
		System.out.println(vedioId+"----------------");
		System.out.println("---++"+vedioBiz.findVedioById(vedioId));
		Vedio vedio=vedioBiz.findVedioById(vedioId);
		if(null!=vedio) {
//			session.setAttribute("vedio", vedio);
			request.setAttribute("vedio", vedio);
			return "s_playVedio";
		}
		return null;	
	}
	
	@RequestMapping(value="/saveVedio")   
	public String saveVedio(@RequestParam(value="vedioName") String vedioName,
			                @RequestParam(value="vedioPro") String vedioPro,
			                @RequestParam(value="attachmentOldName") MultipartFile file,
			                HttpServletRequest request) throws Exception {
		
		//生成随机的文件名称
		String fileName=UUID.randomUUID().toString().replace(".", "");
		System.out.println(fileName);
		//获取上传文件的真实名称
		String realName=file.getOriginalFilename();
		String typeName=realName.substring(realName.lastIndexOf("."));
		String saveName=fileName+typeName;
		//指定文件上传的物理路径
		Vedio vedio=new Vedio();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		vedio.setVedioName(vedioName);
		vedio.setVedioPro(vedioPro);
		vedio.setVedioAttachment(saveName);
		vedio.setAttachmentOldName(realName);
		vedio.setUploadTime(sdf.format(new Date()));
		vedio.setDel("no");
		String savePath=request.getServletContext().getRealPath("/upload");
	    file.transferTo(new File(savePath+'/'+saveName));
	    vedioBiz.saveVedio(vedio);
		return "vedioAdd"; 
	}
	
	@RequestMapping(value="/findVediosWithPageByTeacher")   
	public String findVediosWithPageByTeacher(HttpServletRequest request,HttpServletResponse response, HttpSession session)  {
		int currentPageNum=Integer.parseInt(request.getParameter("num"));
		PageModel pm=vedioBiz.findVediosWithPageByTeacher(currentPageNum);
		//将PageModel放入reqest
	    request.setAttribute("page", pm);
		return "vedioAdd";
	}
	
//	@RequestMapping(value="/findVedioWithPage")   
//	public String findVedioWithPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		int num=Integer.parseInt(request.getParameter("num"));
//		PageModel pm=vedioBiz.findVedioWithPage(num);
//		request.setAttribute("page", pm);
//		return "vedioAdd";
//	}
	 
	@RequestMapping(value="/deleteVedioByTeacher")
	public String deleteVedioByTeacher(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer vId=Integer.valueOf(request.getParameter("id"));
		vedioBiz.deleteVedioByTeacher(vId);
		return "vedioAdd";
	}
}
