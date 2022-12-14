package com.Ims.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.vo.MemberVo;

@RequestMapping("admin/*")
@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	

	/*
	 * @RequestMapping("login.do") public String login() { return "admin/login"; }
	 */
   
   @RequestMapping("login.do")
  	public String login() {
  	   return "signup/adminlogin";
     }
	
	
   @RequestMapping("login_check.do")
   public ModelAndView login_check(MemberVo vo,HttpSession session,ModelAndView mav) {
	   
	   
	   String name = adminService.login(vo);
	   
	   if(name != null) {
		   session.setAttribute("admin_userid", vo.getMember_id());
		   session.setAttribute("admin_name", name);
		   session.setAttribute("userid", vo.getMember_id());
		   session.setAttribute("name", name);
		   
		   mav.setViewName("redirect:/");
		 
	   }else {
		   mav.setViewName("signup/adminlogin");
	
	   }
	   return mav;
   }
	 
   
   @RequestMapping("logout.do")
   public String logout(HttpSession session) {
	   session.invalidate();
	   return "redirect:/";
   }
}
