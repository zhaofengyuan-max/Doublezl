package com.niit.util;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session; //import javax.mail.Message.RecipientType;
import javax.mail.Transport; //import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail1 {
	
	public static final String MAIL_FROM = "1595882726@qq.com";// ָ���ʼ��ķ�����
	public static final String PASSWORD_MAIL = "rmpzmlldstytijhc";// ָ���ʼ��ķ����˵�½����
	public static final String MAIL_HOST = "smtp.qq.com"; // �ʼ��ķ���������

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

