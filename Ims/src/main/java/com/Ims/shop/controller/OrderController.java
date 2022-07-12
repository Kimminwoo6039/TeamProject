package com.Ims.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.OrderService;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@RequestMapping("mypage/*")
@Controller
public class OrderController {
	
	private OrderService orderService;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mav,HttpSession session){
		String userid = (String)session.getAttribute("userid"); 
		 
		if(userid ==null) {
			mav.setViewName("/member/login");
		}else {
			
			List<OrderVo> list = orderService.list(userid);
			 
			mav.setViewName("/order/order_main");
		
			mav.addObject("list", list);

			
		}
		return mav;
		
	 }
	
//	@RequestMapping("main2.do")
//	public String main2(){
//		return "order/oder_main2";
//	}
//	
	

 @RequestMapping("cancel.do")
 public ModelAndView cancel(@RequestParam("order_idx") String order_idx,
		 HttpServletRequest request,HttpServletResponse response,
		 ModelAndView mav
		 ) throws Exception{
	 
	 orderService.cancel(order_idx);
	 mav.setViewName("redirect:/mypage/main.do");
	 mav.addObject("message", "cancel");
	 return mav;
	 
 }
	
 
 

	
	
	
	
	
	
	
	
	
}
