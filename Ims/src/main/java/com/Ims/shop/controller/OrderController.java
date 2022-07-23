package com.Ims.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.OrderService;
import com.Ims.shop.vo.Dio;
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
	public ModelAndView main(Dio dio,ModelAndView mav,HttpSession session){
		String userid = (String)session.getAttribute("userid");

		System.out.println("delivery_state =" +dio.getDelivery_state());
		
		dio.setOrder_id(userid);
		
	
		if(userid ==null) {
			mav.setViewName("/member/login");
		}else {
			
			
		
			List<OrderVo> list = orderService.list(dio);
			
			int count = orderService.abc(userid);
			int count1 = orderService.abc1(userid);
			int count2 = orderService.abc2(userid);
			int count3 = orderService.abc3(userid);
			
			mav.setViewName("/order/order_main");
		
			mav.addObject("list", list);
           mav.addObject("count", count);
           mav.addObject("count1", count1);
           mav.addObject("count2", count2);
           mav.addObject("count3", count3);
			
		}
		return mav;
		
	 }
	
	
	
		/*
		 * @RequestMapping("mainpage.do/{delivery_state}") public ModelAndView
		 * main1(@PathVariable String delivery_state,ModelAndView mav,HttpSession
		 * session){ String userid = (String)session.getAttribute("userid");
		 * 
		 * System.out.println("¿Ó´Ù");
		 * 
		 * if(userid ==null) { mav.setViewName("/member/login"); }else {
		 * 
		 * 
		 * 
		 * List<OrderVo> list = orderService.list(userid);
		 * 
		 * int count = orderService.abc(userid); int count1 = orderService.abc1(userid);
		 * int count2 = orderService.abc2(userid); int count3 =
		 * orderService.abc3(userid);
		 * 
		 * mav.setViewName("/order/order_mainpage");
		 * 
		 * mav.addObject("list", list); mav.addObject("count", count);
		 * mav.addObject("count1", count1); mav.addObject("count2", count2);
		 * mav.addObject("count3", count3);
		 * 
		 * } return mav;
		 * 
		 * }
		 */
	
	
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
	 mav.addObject("message", "cancle");
	 return mav;
	 
 }
	
 
 
@RequestMapping("main_member.do")
public String main_member() {
	return "order/order_main_member";
}
	
	
	

	
	
	
	
	
}
