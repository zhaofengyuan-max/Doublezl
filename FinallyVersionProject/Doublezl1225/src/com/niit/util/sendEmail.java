package com.niit.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session; //import javax.mail.Message.RecipientType;
import javax.mail.Transport; //import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail {
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

}
