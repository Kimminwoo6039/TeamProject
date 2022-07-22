package com.Ims.shop.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ims.shop.service.EmailService;
import com.Ims.shop.vo.SendVo;

@Controller
@RequestMapping("email/*")
public class EmailController {

	@Inject
	JavaMailSender mailSender;

	private EmailService emailService;

	@Autowired
	public EmailController(EmailService emailService) {
		this.emailService = emailService;
	}

//	@RequestMapping("/email")
//	public String email() {
//		return "email";
//	}
	
<<<<<<< HEAD
	@RequestMapping("send.do")
	@ResponseBody	
	public String send(SendVo vo,Model model, HttpServletRequest request) {
		System.out.println("send()실행: "+vo.getSend());
		int auth_number = 0;
		try {
			//이메일 인증번호:auth_number
			auth_number = emailService.sendMail(vo); 

			model.addAttribute("message", "1");
			
		 } catch (Exception e) { 
			 e.printStackTrace(); 
			 model.addAttribute("message", "2");
		}
		return String.valueOf(auth_number); 
		} 
	}
	
	
=======
	
	
	@RequestMapping("/email")
	public String email() {
		return "email";
	}
	
}	
/*
 * @RequestMapping("/email/send.do") public String send(SendVo vo,Model model) {
 * 
 * System.out.println("v########################"+vo.getSend());
 * 
 * try { emailService.sendMail(vo); model.addAttribute("message", "1");
 * 
 * } catch (Exception e) { e.printStackTrace(); model.addAttribute("message",
 * "2");
 * 
 * }
 * 
 * return "email"; } }
 */
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

<<<<<<< HEAD

/*
 * @RequestMapping("/email/send.do") public String send(SendVo vo,Model model) {
 * 
 * System.out.println("v########################"+vo.getSend());
 * 
 * try { emailService.sendMail(vo); model.addAttribute("message", "1");
 * 
 * } catch (Exception e) { e.printStackTrace(); model.addAttribute("message",
 * "2");
 * 
 * }
 * 
 * return "email"; } }
 * 
 *//*
	 * }
	 * 
	 * @ManagedOperation(value = "회원가입", notes = "회원가입을 진행한다.")
	 * 
	 * @PostMapping("/register") public SingleResult<MemberRegisterResponseDto>
	 * register(@RequestBody MemberRegisterRequestDto requestDto) {
	 * MemberRegisterResponseDto responseDto =
	 * signService.registerMember(requestDto); return
	 * responseService.getSingleResult(responseDto); }
	 * 
	 * @ApiOperation(value = "이메일 인증", notes = "이메일 인증을 진행한다.")
	 * 
	 * @GetMapping("/confirm-email") public SingleResult<String>
	 * confirmEmail(@ModelAttribute EmailAuthRequestDto requestDto) {
	 * signService.confirmEmail(requestDto); return
	 * responseService.getSingleResult("인증이 완료되었습니다."); }
	 */
=======
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
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
