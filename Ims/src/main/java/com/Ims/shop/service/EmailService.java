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

@Service
public class EmailService {
	
	
	@Inject
	JavaMailSender mailSender;

	
	
	public void sendMail(SendVo vo) {
		
	
		try {
			
			MimeMessage msg = mailSender.createMimeMessage();
			msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getSend()));
			msg.addFrom(new InternetAddress[] {
					new InternetAddress("######","ȫ�浿")
			});
			msg.setSubject("�׽�Ʈ ���� ����"); //����..
			msg.setText("�׽�Ʈ�Դϴ�"); // �ؽ�Ʈ ����..
			mailSender.send(msg);
			
			
		} catch (Exception e) {
                  e.printStackTrace();
                  System.out.println("������");
		}
		
		
		
	};
	
	
}	
	
	
	