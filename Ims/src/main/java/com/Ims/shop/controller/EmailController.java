package com.Ims.shop.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedOperation;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
			model.addAttribute("message", "1");
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "2");
			
		}
		
		return "email";
	}
}

/*
 * @ManagedOperation(value = "�쉶�썝媛��엯", notes = "�쉶�썝媛��엯�쓣 吏꾪뻾�븳�떎.")
 * 
 * @PostMapping("/register") public SingleResult<MemberRegisterResponseDto>
 * register(@RequestBody MemberRegisterRequestDto requestDto) {
 * MemberRegisterResponseDto responseDto =
 * signService.registerMember(requestDto); return
 * responseService.getSingleResult(responseDto); }
 * 
 * @ApiOperation(value = "�씠硫붿씪 �씤利�", notes = "�씠硫붿씪 �씤利앹쓣 吏꾪뻾�븳�떎.")
 * 
 * @GetMapping("/confirm-email") public SingleResult<String>
 * confirmEmail(@ModelAttribute EmailAuthRequestDto requestDto) {
 * signService.confirmEmail(requestDto); return
 * responseService.getSingleResult("�씤利앹씠 �셿猷뚮릺�뿀�뒿�땲�떎."); }
 */