package com.Ims.shop.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.MemberService;
import com.Ims.shop.service.ProductService;
import  com.Ims.shop.vo.*;

@Controller
@RequestMapping("member/*")
public class MemberController {

	
private MemberService memberService;

@Autowired
public MemberController(MemberService memberService) {
	this.memberService = memberService;
}
	
@RequestMapping("login.do")
public String login() {
	return "member/login";
}


@RequestMapping("login_check.do")
public ModelAndView login_check(MemberVo vo,HttpSession session,ModelAndView mav) {
	
	String name = memberService.login(vo);
	
	if(name != null) { //로그인 성공
		session.setAttribute("userid", vo.getMember_id());
		session.setAttribute("name", name);
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
	
}