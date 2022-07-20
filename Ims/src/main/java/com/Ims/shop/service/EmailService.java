package com.Ims.shop.service;

import java.util.List;  

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.SendVo;


 @Service public class EmailService {
 
	 
	
/*	
	@Inject
	JavaMailSender mailSender;

	*/
/*	
	public void sendMail(SendVo vo) {
		
	
		try {
			
			MimeMessage msg = mailSender.createMimeMessage(); 
			msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getSend()));
			msg.addFrom(new InternetAddress[] {
					new InternetAddress("######","Im's")
			});



			msg.setSubject("이메일 인증을 해주세요"); //제목..
			msg.setText(	"<h1>메일인증</h1>" +
					"<br/>"+memberVO.getMemberId()+"님 "+
					"<br/>ICEWATER에 회원가입해주셔서 감사합니다."+
					"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
					"<a href='http://localhost:8080/member/registerEmail?memberEmail=" + memberVO.getMemberEmail() +
					"&key=" + key +
					"' target='_blenk'>이메일 인증 확인</a>");); // 텍스트 내용..

			mailSender.send(msg);
			
			
		} catch (Exception e) {
                  e.printStackTrace();
                  System.out.println("회원가입해주셔서 감사합니다.");
		}
		
		
		
	};
	
	
}	

*/
 }
	

	