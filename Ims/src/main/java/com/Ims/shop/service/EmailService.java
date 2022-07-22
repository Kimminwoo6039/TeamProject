package com.Ims.shop.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.Ims.shop.vo.SendVo;

<<<<<<< HEAD
@Service
public class EmailService {
=======

 @Service public class EmailService {
 
	 
	
/*	
	@Inject
	JavaMailSender mailSender;
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

<<<<<<< HEAD
	  
	JavaMailSender mailSender;
	
	@Autowired
	public EmailService(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public int sendMail(SendVo vo) {
		int auth_number = 0;
=======
	*/
/*	
	public void sendMail(SendVo vo) {
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
		
		try {
			
		String email = vo.getSend();
		String id = email.substring(0, email.indexOf("@"));
		
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		
		messageHelper.setSubject(id+"님 인증번호 확인 메일입니다.");
		//4자리 인증번호 생성: (int)(Math.random()*10000)
		auth_number = (int)(Math.random()*10000);
		
		messageHelper.setText("인증번호는"+auth_number+"입니다.");
		messageHelper.setTo(email);
		msg.setRecipients(MimeMessage.RecipientType.TO,InternetAddress.parse(email));
		mailSender.send(msg);
		
		
		} catch (Exception e) { e.printStackTrace();
		System.out.println("이메일 인증번호가 정상적으로 발송되었습니다."); }
		
	return auth_number;
	
	
	};

<<<<<<< HEAD
}
=======
*/
 }
	

	
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
