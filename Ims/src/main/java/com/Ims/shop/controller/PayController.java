package com.Ims.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.PayService;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;


@Controller
public class PayController {
	
	private PayService payService;
	
	@Autowired
	public PayController(PayService payService) {
		this.payService = payService;
	}
	
@RequestMapping("/pay.do")
  public String pay(OrderVo vo,HttpServletRequest request,Model model) {
	  

	  String order_phone = vo.getOrder_phone1()+vo.getOrder_phone2()+vo.getOrder_phone3();
	
	  System.out.println("order_phone =" + order_phone);
	  
	  vo.setOrder_phone(order_phone);
	  
	  payService.insert(vo);
	  
	  System.out.println("vo.get="+vo.getOrder_sum() );
	  
	  request.setAttribute("name", vo.getOrder_product());
	  request.setAttribute("sum", vo.getOrder_sum());
	  
	//  model.addAttribute("sum", vo.getOrder_sum());
	  

	  
	 return "order/pay";
	  
	  
  }
	
	
	
	
	
	
	
}
