package com.niit.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session; //import javax.mail.Message.RecipientType;
import javax.mail.Transport; //import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail {
	public static final String MAIL_FROM = "zhao_linhua@foxmail.com";// ָ���ʼ��ķ�����
	public static final String PASSWORD_MAIL = "dzwpaipkgtfajiij";// ָ���ʼ��ķ����˵�½����
	public static final String MAIL_HOST = "smtp.qq.com"; // �ʼ��ķ���������
	
	private static String from = "1595882726@qq.com";// �����˵�ַjimmyfsj@163.com
	private  String to = "";// �ռ��˵�ַ
	private static String subject = "����ǩ��ϵͳ�ĵ��ʼ�";// ����
	private String messageText = "";// ����
	private static String password = "dcx741953";// ��������������zmlwrlmd!510
	// ����SMTP�����������õ��Ĳ���
	private int n = from.indexOf('@');
	private int m = from.length();
	private String mailserver = "smtp." + from.substring(n + 1, m);

	// String mailservername="smtp.qq.com";

	public sendEmail(String user, String qq, int random,String pass) {
		this.to = qq + "@qq.com";
		this.messageText = "��ã�" + user + "\n\n�㱾�β�������֤��Ϊ��" + random
				+"�������Ϊ:"+pass+ "\n��Ч��Ϊ3�죬��ע�⣡\n\n\n���ʼ�����ظ���";
		//Email();
	}

	public void Email() {
		System.out.print("�����õģ�֤���Ѿ�����Email�����࣡"+"������Ϊ��"+from+"\n�ռ��ˣ�"+to+"\n������mima:"+password+"\n");
		// ��������Ự
		Properties pro = new Properties();
		pro.put("stmp.qq.com ", mailserver);//  mail.smtp.host
		pro.put("mail.smtp.auth", "True");
		pro.put("mail.smtp.username",from);
        pro.put("mail.smtp.password", "tcgecawkyjnugbad");
		Session sess = Session.getInstance(pro);
		sess.setDebug(true);
		// �½�һ����Ϣ����
		MimeMessage message = new MimeMessage(sess);/*
													 * import
													 * javax.mail.internet
													 * .MimeMessage;
													 */

		try {
			// ���÷�����
			InternetAddress from_mail = new InternetAddress(from);
			message.setFrom(from_mail);
			// �����ռ���
		
			InternetAddress to_mail = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, to_mail);// //
			// javax.mail.internet.MimeMessage;
			// ��������
			message.setSubject(subject);
			// ��������
			message.setText(messageText);
			// ���÷���ʱ��
			message.setSentDate(new java.util.Date());
			// �����ʼ�
			message.saveChanges();// ��֤��ͷ��ͬ�Ự���ݱ���һ��
			Transport transport = sess.getTransport("smtp");// ��import
			// javax.mail.Transport;
			transport.connect(mailserver, from, password);//�ʼ��������������ˣ�����
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			System.out.println("�ʼ��Ѿ����ͣ�");

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("�ʼ�����ʧ�ܣ������ʼ������Ĵ��� " + e.getMessage());
			e.printStackTrace();
		}

	}
	
	public Boolean SendEmail(String mailTo, String mailTittle, String mailText) throws Exception {

		Properties prop = new Properties();
		prop.setProperty("mail.host", MAIL_HOST);
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");

		// ʹ��JavaMail�����ʼ���5������
		// 1������session
		Session session = Session.getInstance(prop);
		System.out.println("1������session");
		// ����Session��debugģʽ�������Ϳ��Բ鿴��������Email������״̬
		session.setDebug(true);

		// 2��ͨ��session�õ�transport����
		Transport ts = session.getTransport();
		System.out.println("2��ͨ��session�õ�transport����");

		// 3��ʹ��������û��������������ʼ��������������ʼ�ʱ����������Ҫ�ύ������û����������smtp���������û��������붼ͨ����֤֮����ܹ����������ʼ����ռ��ˡ�
		ts.connect(MAIL_HOST, MAIL_FROM, PASSWORD_MAIL);
		System.out.println("3��ʹ��������û��������������ʼ�������");

		// 4�������ʼ�
		Message message = createSimpleMail(session, MAIL_FROM, mailTo, mailTittle, mailText);
		System.out.println("4�������ʼ�");

		// 5�������ʼ�
		try {
			ts.sendMessage(message, message.getAllRecipients());
			System.out.println("�ʼ����ͳɹ���");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�ʼ�����ʧ�ܣ�");
			return false;
		} finally {
			ts.close();
		}  
}
	


public MimeMessage createSimpleMail(Session session, String mailfrom, String mailTo, String mailTittle,
			String mailText) throws Exception {
		// �����ʼ�����
		MimeMessage message = new MimeMessage(session);
		// ָ���ʼ��ķ�����
		message.setFrom(new InternetAddress(mailfrom));
		// ָ���ʼ����ռ��ˣ����ڷ����˺��ռ�����һ���ģ��Ǿ����Լ����Լ���
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
		// �ʼ��ı���
		message.setSubject(mailTittle);
		// �ʼ����ı�����
		message.setContent(mailText, "text/html;charset=UTF-8");
		// ���ش����õ��ʼ�����
		return message;
}

}
