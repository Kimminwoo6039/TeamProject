package com.Ims.shop.controller;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.CertifiedPhoneNumber;
import com.Ims.shop.service.MemberService;
import com.Ims.shop.service.ProductService;
import  com.Ims.shop.vo.*;

@Controller
@RequestMapping("member/*")
public class MemberController {

	
private MemberService memberService;
private CertifiedPhoneNumber certifiedPhoneNumber;

@Autowired
public MemberController(MemberService memberService,CertifiedPhoneNumber certifiedPhoneNumber) {
	this.memberService = memberService;
	this.certifiedPhoneNumber = certifiedPhoneNumber ;
}

private MemberService member;



@RequestMapping("login.do")
public String login() {
	return "signup/login";
}


@RequestMapping("login_check.do")
public ModelAndView login_check(MemberVo vo,HttpSession session,ModelAndView mav) {
	
	String name = memberService.login(vo);
	
	if(name != null) {
		session.setAttribute("userid", vo.getMember_id());
		System.out.println("userid="+vo.getMember_id());
		session.setAttribute("name", name);
		System.out.println("name="+ name );
		mav.setViewName("main");
		mav.addObject("message", "success");
	}else {
		mav.setViewName("member/login");
		mav.addObject("message", "error");
	}
	return mav;
			
}
	

@RequestMapping("logout.do")

public ModelAndView logout(HttpSession session, ModelAndView mav) {

session.invalidate();
mav.setViewName("member/login");
mav.addObject("message","logout");
return mav;

}

@RequestMapping("join.do")

public String join()

{
	return "signup/join";
}

@RequestMapping("joinProcess.do")

public String joinProcess(MemberVo memberVo) {
	
	 memberService.joinProcess(memberVo);
	return "home";
}


@RequestMapping("/sendSMS1.do")
@ResponseBody	
	public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
		
		  System.out.println("수신자 번호 : " + phoneNumber); System.out.println("인증번호 : " +
		  numStr);
		  certifiedPhoneNumber.certifiedPhoneNumber(phoneNumber, numStr);
		 
		  return numStr;
    }


@PostMapping("checkId.do")
@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
public String checkId(@RequestParam("member_id") String id) {
	
	System.out.println("id: "+id);
	
	String result="N";//중복된 아이디 없음
	
	//int flag = memberService.checkId(id);
	
	//if(flag == 1) result = "Y";//중복된 아이디 있음
	
	return result;
}



}