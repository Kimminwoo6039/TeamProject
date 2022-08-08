package com.Ims.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Ims.shop.service.KaKaoService;
import com.Ims.shop.service.NaverService;
import com.Ims.shop.vo.KakaoVo;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NaverVo;
import com.mysql.cj.Session;

@Controller
public class NaverController {

private NaverService naverService;
	
	
	@Autowired
	public NaverController(NaverService naverService) {
		this.naverService = naverService;
	}
	
	
	@RequestMapping("/naver.do")
	public String naver() {
		return "naver/naver_login";
	}
	
	

	@RequestMapping("/callback")
	public String nave1r() {
		return "naver/callback";
	}
	
	
	@RequestMapping(value="/naverSave", method=RequestMethod.POST)
	public @ResponseBody String naverSave(@RequestParam("n_age") String n_age, @RequestParam("n_birthday") String n_birthday, @RequestParam("n_email") String n_email, @RequestParam("n_gender") String n_gender, @RequestParam("n_id") String n_id, @RequestParam("n_name") String n_name, @RequestParam("n_nickName") String n_nickName,NaverVo vo,HttpSession session) {
	System.out.println("#############################################");
	System.out.println(n_age);
	System.out.println(n_birthday);
	System.out.println(n_email);
	System.out.println(n_gender);
	System.out.println(n_id);
	System.out.println(n_name);
	System.out.println(n_nickName);
	System.out.println("#############################################");

	/*
	 * NaverVo naver = new NaverVo(); naver.setN_age(n_age);
	 * naver.setN_birthday(n_birthday); naver.setN_email(n_email);
	 * naver.setN_gender(n_gender); naver.setN_id(n_id); naver.setN_name(n_name);
	 * naver.setN_nickName(n_nickName);
	 */
	
	
	MemberVo member = new MemberVo();
	member.setMember_id(n_email);
    member.setMember_name(n_name);
	String result = "no";
    
	
	System.out.println("vo="+vo);
	if(member != null) {
		
	  naverService.findnaver(vo);
	
	  
	  session.setAttribute("userid", member.getMember_id());
	  session.setAttribute("name", member.getMember_name());
	  
	  System.out.println("userid =" +  member.getMember_id());
	  System.out.println("name =" +  member.getMember_name());
		result = "ok";
	

	}
	
	

	return result;
    
	}
	
	
	
	
}
