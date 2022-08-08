package com.Ims.shop.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.Ims.shop.service.MemberService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.OrderService;
import com.Ims.shop.service.ProductService;
import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.CartVo;
import com.Ims.shop.vo.Dio;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;
import com.Ims.shop.vo.ZzimVo;

@RequestMapping("mypage/*")
@Controller
public class OrderController {
	
	private OrderService orderService;
	private MemberService memberService;
	private ProductService productService;
	@Autowired
	public OrderController(OrderService orderService,MemberService memberService, ProductService productService) {
		this.orderService = orderService;
		this.memberService= memberService;
		this.productService = productService;
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
		 * System.out.println("占쌈댐옙");
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
	
	
	


@RequestMapping("zzimlist.do")
public ModelAndView zzimlist(HttpSession session,ModelAndView mav,HttpServletRequest request,
		/* @RequestParam("product_code") int product_code, */
		@RequestParam(value="brand", required=false) String brand) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	String member_id = (String) session.getAttribute("userid");
	
	System.out.println("#######################userid = "+member_id);
	ZzimVo zv = new ZzimVo();
	zv.setLike_brand(brand);
	/* zv.setLike_id(product_code); */
	zv.setMember_id(member_id);
	
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@1");
	
	if(member_id != null) {
		List<AllVo> list = orderService.zzimlist(member_id); //占싸깍옙占쏙옙 占실억옙占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙회占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싱아온댐옙.
		int sumMoney = orderService.sumMoney(member_id);
		System.out.println("sum moui2" +sumMoney);
		int fee = sumMoney >= 30000 ? 0 : 2500 ; 
		
	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
	

	
	
	
		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("sum", sumMoney+fee);
		map.put("list", list);
		map.put("count", list.size());
		map.put("member_id", zv.getMember_id());
		map.put("brand", zv.getLike_brand());
		map.put("product_code", zv.getLike_id());
		map.put("zv", zv);
		map.put("av", productService.AllVo(member_id));
		mav.addObject("map", map);
		System.out.println("#@@@@@@@@@@@@@@@@map = "+map);
		mav.setViewName("/order/zzimlist");
		
		return mav;
		}else {
			return new ModelAndView("member/login");
		}
			
			
	}
//
//@RequestMapping("zzimupdate.do")
//public String update(int[] amount,int[] product_code,HttpSession session) {
//	String member_id = (String) session.getAttribute("userid");
//	
//	if(member_id == null) {
//		return "redirect:/member/login.do";
//	}
//	for(int i=0; i<product_code.length; i++) {  //카트 占쏙옙호 3占쏙옙占싸삼옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占� 0,1,2 占쏙옙占쏙옙 3占쏙옙 占쏙옙占� 占싸삼옙占� 占심띰옙占쏙옙占쏙옙
//		if(amount[i]==0) {
//			productService.deletezzim(product_code[i]);
//		}else {
//		ZzimVo vo =new ZzimVo();
//		vo.setMember_id(member_id);
//		vo.setCart_id(product_code[i]);
//		vo.setAmount(amount[i]);
//		orderService.modify(vo); // 占쏙옙占쏙옙占쏙옙占쏙옙
//		}
//	}
//	return "redirect:/shop/cart/list.do";
//}
//	
	
}
