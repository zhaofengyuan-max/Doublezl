package com.niit.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session; //import javax.mail.Message.RecipientType;
import javax.mail.Transport; //import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail {
	public static final String MAIL_FROM = "zhao_linhua@foxmail.com";// 指明邮件的发件人
	public static final String PASSWORD_MAIL = "dzwpaipkgtfajiij";// 指明邮件的发件人登陆密码
	public static final String MAIL_HOST = "smtp.qq.com"; // 邮件的服务器域名
	
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
	
	public Boolean SendEmail(String mailTo, String mailTittle, String mailText) throws Exception {

		Properties prop = new Properties();
		prop.setProperty("mail.host", MAIL_HOST);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");

		// 使用JavaMail发送邮件的5个步骤
		// 1、创建session
		Session session = Session.getInstance(prop);
		System.out.println("1、创建session");
		// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);

		// 2、通过session得到transport对象
		Transport ts = session.getTransport();
		System.out.println("2、通过session得到transport对象");

		// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
		ts.connect(MAIL_HOST, MAIL_FROM, PASSWORD_MAIL);
		System.out.println("3、使用邮箱的用户名和密码连上邮件服务器");

		// 4、创建邮件
		Message message = createSimpleMail(session, MAIL_FROM, mailTo, mailTittle, mailText);
		System.out.println("4、创建邮件");

		// 5、发送邮件
		try {
			ts.sendMessage(message, message.getAllRecipients());
			System.out.println("邮件发送成功！");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("邮件发送失败！");
			return false;
		} finally {
			ts.close();
		}  
}
	


public MimeMessage createSimpleMail(Session session, String mailfrom, String mailTo, String mailTittle,
			String mailText) throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress(mailfrom));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
		// 邮件的标题
		message.setSubject(mailTittle);
		// 邮件的文本内容
		message.setContent(mailText, "text/html;charset=UTF-8");
		// 返回创建好的邮件对象
		return message;
}

}
