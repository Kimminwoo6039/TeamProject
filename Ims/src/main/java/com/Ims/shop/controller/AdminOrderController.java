package com.Ims.shop.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminOrderService;
import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.OrderService;
import com.Ims.shop.vo.Dio;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@RequestMapping("admin/*")
@Controller
public class AdminOrderController {
	
	private AdminOrderService adminorderService;
	
	@Autowired
	public AdminOrderController(AdminOrderService adminorderService) {
		this.adminorderService = adminorderService;
	}
	
	

	@RequestMapping("modify.do")
	public ResponseEntity modify(@RequestParam Map<String,String> deliveryMap,
			HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		System.out.println("############ deliveryMap = "+deliveryMap);
		
		adminorderService.modify(deliveryMap);
		
		
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message,responseHeaders,HttpStatus.OK);
		return resEntity;
		
		
		
	}
	
	
	@RequestMapping("main.do")
	public ModelAndView main(Dio dio,ModelAndView mav,HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		List<OrderVo> list = adminorderService.list(dio);
		
		
		int count = adminorderService.abc();
		int count1 = adminorderService.abc1();
		int count2 = adminorderService.abc2();
		int count3 = adminorderService.abc3();
		
		  mav.addObject("count", count);
          mav.addObject("count1", count1);
          mav.addObject("count2", count2);
          mav.addObject("count3", count3);
		
		
		
		mav.setViewName("admin/admin_order");
		mav.addObject("list", list);
		
		
		
		return mav;
		
	}
	
	
	
	
	
	
	
	
}
