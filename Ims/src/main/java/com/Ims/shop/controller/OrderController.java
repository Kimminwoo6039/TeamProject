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
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

@RequestMapping("admin/*")
@Controller
public class OrderController {
	
	private AdminService adminService;
	
	@Autowired
	public OrderController(AdminService adminService) {
		this.adminService = adminService;
	}
	

	
	
	
	
	
	
	
	
	
}
