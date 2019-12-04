package com.niit.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;  

@Controller
public class CodeController {

    @RequestMapping({"authCode.do"})
    public void getAuthCode(HttpServletRequest request, HttpServletResponse response,HttpSession session)
            throws IOException {
        int width = 63;
        int height = 37;
        Random random = new Random();
        //设置response头信息
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区image类
        BufferedImage image = new BufferedImage(width, height, 1);
        //产生image类的Graphics用于绘制操作
        Graphics g = image.getGraphics();
        //Graphics类的样式
        g.setColor(this.getRandColor(200, 250));
        g.setFont(new Font("Times New Roman",0,28));
        g.fillRect(0, 0, width, height);
        //绘制干扰线
        for(int i=0;i<40;i++){
            g.setColor(this.getRandColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }

        //绘制字符
        String strCode = "";
        for(int i=0;i<4;i++){
            String rand = String.valueOf(random.nextInt(10));
            strCode = strCode + rand;
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
            g.drawString(rand, 13*i+6, 28);
        }
        //将字符保存到session中用于前端的验证
        session.setAttribute("strCode", strCode);
        
        g.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
    }
    
    //创建颜色
    Color getRandColor(int fc,int bc){
        Random random = new Random();
        if(fc>255)
            fc = 255;
        if(bc>255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r,g,b);
    }
    /**
     * 进行验证用户的验证码是否正确
     * @param value 用户输入的验证码
     * @param request HttpServletRequest对象
     * @return 一个String类型的字符串。格式为：<br/>
     *                     {"res",boolean},<br/>
     *                 如果为{"res",true}，表示验证成功<br/>
     *                 如果为{"res",false}，表示验证失败
     */
    @RequestMapping("validate.do")
    @ResponseBody
    public String validate(String value,HttpServletRequest request){
        String valueCode=(String)request.getSession().getAttribute("strCode");
        Map map=new HashMap();
        if(valueCode!=null){
            if(valueCode.equals(value)){
                map.put("res", true);
                return new Gson().toJson(map);
            }
        }
        map.put("res", false);
        return new Gson().toJson(map);
    }
}
//import java.awt.Color;
//import java.awt.Font;
//import java.awt.Graphics;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.util.Random;
// 
//import javax.imageio.ImageIO;
//import javax.servlet.ServletOutputStream;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
// 
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class CodeController {
//	
//	private static int WIDTH = 65;// 设置图片的宽度 
//	private static int HEIGHT = 22;// 设置图片的高度
// 
//	@RequestMapping("/imgcode")
//	public void getimgcode(HttpServletRequest request,HttpServletResponse response) throws IOException {
//		HttpSession session = request.getSession();
//		session.removeAttribute("code2");
//		response.setContentType("image/jpeg");
//		ServletOutputStream sos = response.getOutputStream();
// 
//		response.setHeader("Pragma", "No-cache");
//		response.setHeader("Cache-Control", "no-cache");
//		response.setDateHeader("Expires", 0);
// 
//		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,BufferedImage.TYPE_INT_RGB);
//		Graphics g = image.getGraphics();
// 
//		char[] rands = generateCheckCode();
//		drawBackground(g);
//		drawRands(g, rands);
//		g.dispose();
// 
//		ByteArrayOutputStream bos = new ByteArrayOutputStream();
//		ImageIO.write(image, "JPEG", bos);
//		byte[] buf = bos.toByteArray();
//		response.setContentLength(buf.length);
//		sos.write(buf);
//		bos.close();
//		sos.close();
//		session.setAttribute("code", new String(rands));
//	}
// 
//	private void drawBackground(Graphics g) {
//		g.setColor(new Color(0xDCDCDC));
//		g.fillRect(0, 0, WIDTH, HEIGHT);
//		for (int i = 0; i < 120; i++) {
//			int x = (int) (Math.random() * WIDTH);
//			int y = (int) (Math.random() * HEIGHT);
//			int red = (int) (Math.random() * 255);
//			int green = (int) (Math.random() * 255);
//			int blue = (int) (Math.random() * 255);
//			g.setColor(new Color(red, green, blue));
//			g.drawOval(x, y, 1, 0);
//		}
//	}
// 
//	private void drawRands(Graphics g, char[] rands) {
//		Random random = new Random();
//		int red = random.nextInt(110);
//		int green = random.nextInt(50);
//		int blue = random.nextInt(50);
//		g.setColor(new Color(red, green, blue));
//		g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
//		g.drawString("" + rands[0], 1, 17);
//		g.drawString("" + rands[1], 16, 15);
//		g.drawString("" + rands[2], 31, 18);
//		g.drawString("" + rands[3], 46, 16);
//	}
// 
//	private char[] generateCheckCode() {
//		String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
//		char[] rands = new char[4];
//		for (int i = 0; i < 4; i++) {
//			int rand = (int) (Math.random() * 62);
//			rands[i] = chars.charAt(rand);
//		}
//		return rands;
//	}
//
//}
	