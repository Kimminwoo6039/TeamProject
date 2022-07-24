package com.Ims.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.service.ProductService;
import com.Ims.shop.service.ReplyService;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.ProductVo;
import com.Ims.shop.vo.ReplyVo;



@Controller
public class ReplyController {
	
	private ReplyService replyService;
	private ProductService productService; 
	
	@Autowired
	public ReplyController(ReplyService replyService,ProductService productService) {
		this.replyService= replyService;
		this.productService = productService;
	}
	


	@ResponseBody
	@RequestMapping("insert.do")
	public void insert(ReplyVo vo) {
		System.out.println("ÀÎ¼³Æ®");
		System.out.println("vo ="+ vo.getMember_id());
		System.out.println("vo ="+ vo.getProduct_code());
		System.out.println("vo ="+ vo.getRating());
		System.out.println("vo ="+ vo.getContent());
		
		replyService.insert(vo);
	}
	
	
	@RequestMapping("insert1.do")
	   public String reply(ReplyVo vo,Model model) {
			
			
			System.out.println("¸®ºäµé¾î¿È");
			ProductVo product = productService.detail(vo.getProduct_code());
			model.addAttribute("productInfo", product);
			model.addAttribute("member_id", vo.getMember_id());
			
			return "shop/replyEnroll";
		}
	   
		
		
	
	
	
	
	
	
	
}
