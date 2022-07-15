package com.Ims.shop.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Ims.shop.service.CartService;
import com.Ims.shop.service.EmailService;
import com.Ims.shop.vo.SendVo;

@Controller
public class EmailController {
	
	@Inject
	JavaMailSender mailSender;
	
	private EmailService emailService;
	
	@Autowired
	public EmailController(EmailService emailService) {
		this.emailService = emailService;
	}
	
	
	
	@RequestMapping("/email")
	public String email() {
		return "email";
	}
	
	
	
	@RequestMapping("/email/send.do")
	public String send(SendVo vo,Model model) {
		
		System.out.println("v########################"+vo.getSend());
		
		try {
			emailService.sendMail(vo);
			model.addAttribute("message", "이메일 발송완료");
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 발송 실패");
			
		}
		
		return "email";
	}
}
