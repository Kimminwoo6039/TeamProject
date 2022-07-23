package com.Ims.shop.controller;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		mav.setViewName("redirect:/");
	
	}else {
		mav.setViewName("signup/login");
	
	}
	return mav;
			
}
	

@RequestMapping("logout.do")

public ModelAndView logout(HttpSession session, ModelAndView mav) {

session.invalidate();
mav.setViewName("redirect:/");
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
		
		  System.out.println("�닔�떊�옄 踰덊샇 : " + phoneNumber); System.out.println("�씤利앸쾲�샇 : " +
		  numStr);
		  certifiedPhoneNumber.certifiedPhoneNumber(phoneNumber, numStr);
		 
		  return numStr;
    }


@PostMapping("checkId.do")
@ResponseBody //Ajax�넻�떊�쓽 �쓳�떟�궡�슜�쓣 蹂대궡�뒗 寃껋쓣 �몴�떆
public String checkId(@RequestParam("member_id") String id) {
	
	System.out.println("id: "+id);
	
	String result="N";//以묐났�맂 �븘�씠�뵒 �뾾�쓬
	
	//int flag = memberService.checkId(id);
	
	//if(flag == 1) result = "Y";//以묐났�맂 �븘�씠�뵒 �엳�쓬
	
	return result;
}


@RequestMapping("list.do")
public String list1(HttpSession session,Model model) {
	
	String userid = (String) session.getAttribute("userid");
	
	model.addAttribute("list", memberService.list(userid));
	
	return "order/order_main_member";
	
}


@RequestMapping("memberdelete.do")
public String memberdelete(HttpSession session,MemberVo vo) {
	
	String userid = (String) session.getAttribute("userid");
	
	vo.setMember_id(userid);
	
	
	
	int list = memberService.memberdelete(vo);
	
	
	if(list==1) {
		
		
		return "order/order_delete";
	}else {
		
		return "/order/order_main_member";
	}
	
	
}

@RequestMapping("delete.do")
public String delete(HttpSession session) {
	
	String userid = (String) session.getAttribute("userid");
	
	int result = memberService.delete(userid);
	
	if(result ==1) {
		session.invalidate();
		return "home";
	}else {
		return "order/order_main_member";
	}
	
}

}


