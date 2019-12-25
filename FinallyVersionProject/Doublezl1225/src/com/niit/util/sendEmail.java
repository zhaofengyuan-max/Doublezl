package com.niit.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session; //import javax.mail.Message.RecipientType;
import javax.mail.Transport; //import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail {
	private static String from = "1595882726@qq.com";// 发件人地址jimmyfsj@163.com
	private  String to = "";// 收件人地址
	private static String subject = "来自签到系统的的邮件";// 主题
	private String messageText = "";// 内容
	private static String password = "dcx741953";// 发件人信箱密码zmlwrlmd!510
	// 生成SMTP的主机名称用到的参数
	private int n = from.indexOf('@');
	private int m = from.length();
	private String mailserver = "smtp." + from.substring(n + 1, m);

	// String mailservername="smtp.qq.com";

	public sendEmail(String user, String qq, int random,String pass) {
		this.to = qq + "@qq.com";
		this.messageText = "你好，" + user + "\n\n你本次操作的验证码为：" + random
				+"你的密码为:"+pass+ "\n有效期为3天，请注意！\n\n\n此邮件无需回复！";
		//Email();
	}

	public void Email() {
		System.out.print("测试用的，证明已经调用Email发送类！"+"发件人为："+from+"\n收件人："+to+"\n发件人mima:"+password+"\n");
		// 建立邮箱会话
		Properties pro = new Properties();
		pro.put("stmp.qq.com ", mailserver);//  mail.smtp.host
		pro.put("mail.smtp.auth", "True");
		pro.put("mail.smtp.username",from);
        pro.put("mail.smtp.password", "tcgecawkyjnugbad");
		Session sess = Session.getInstance(pro);
		sess.setDebug(true);
		// 新建一个消息对象
		MimeMessage message = new MimeMessage(sess);/*
													 * import
													 * javax.mail.internet
													 * .MimeMessage;
													 */

		try {
			// 设置发件人
			InternetAddress from_mail = new InternetAddress(from);
			message.setFrom(from_mail);
			// 设置收件人
		
			InternetAddress to_mail = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, to_mail);// //
			// javax.mail.internet.MimeMessage;
			// 设置主题
			message.setSubject(subject);
			// 设置内容
			message.setText(messageText);
			// 设置发送时间
			message.setSentDate(new java.util.Date());
			// 发送邮件
			message.saveChanges();// 保证报头域同会话内容保持一致
			Transport transport = sess.getTransport("smtp");// 需import
			// javax.mail.Transport;
			transport.connect(mailserver, from, password);//邮件服务器，发件人，密码
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("邮件已经发送！");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("邮件发送失败！发送邮件产生的错误： " + e.getMessage());
			e.printStackTrace();
		}

	}

}
