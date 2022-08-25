package com.Ims.shop.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.AdminService;
import com.Ims.shop.service.CartService;
import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.CartVo;
import com.Ims.shop.vo.MemberVo;

@RequestMapping("/shop/cart/*")
@Controller
public class CartController {
	
	private CartService cartService;
	
	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	

	
	@RequestMapping("insert.do")
    public String insert(CartVo vo,HttpSession session) {
		
		//  占싸깍옙占쏙옙 占쏙옙占실곤옙占쏙옙 占쏙옙占쏙옙占승댐옙 !!!!
		String userid = (String) session.getAttribute("userid");
		
		// 占싸깍옙占쏙옙 占쏙옙占싸울옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱듸옙占� 占쌕몌옙占쏙옙占쏙옙
		
		if(userid == null) {  // 占싸깍옙占쏙옙占쏙옙 占싫되억옙占쏙옙占쏙옙占쏙옙 占쏙옙占실곤옙占쏙옙 占쏙옙占쏙옙占� 占싫되억옙占쏙옙占쏙옙占쏙옙 占싼댐옙.
			return "redirect:/member/login.do";
		}else {
			vo.setMember_id(userid);   // 占쏙옙占실곤옙占쏙옙 占쏙옙占싱듸옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占싱듸옙占쏙옙 占쏙옙占쏙옙占싼댐옙. roof 占쏙옙占쏙옙占쏙옙占쏙옙
			cartService.insert(vo);
			return "redirect:/shop/cart/list.do";
			
		}
		

		
	}
	

	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session,ModelAndView mav,HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); // 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쌔쇽옙 占쏙옙占쏙옙瞞占� 占싹기때占쏙옙占쏙옙 占쌔쏙옙占쏙옙占쏙옙 占쏙옙占�.....
		String userid = (String) session.getAttribute("userid"); // 占쏙옙占실곤옙占쏙옙 占쏙옙占쏙옙占승댐옙 占쏙옙占실곤옙占쏙옙 占쏙옙占쌔쇽옙 占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙瞞占쏙옙歐粹㏆옙占쏙옙占� 占쏙옙占쏙옙謎占쏙옙占� 占쏙옙占쏙옙求歐占�...
		
		System.out.println("userid =" +userid);
		
		if(userid != null) {
			List<AllVo> list = cartService.list(userid); //占싸깍옙占쏙옙 占실억옙占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙회占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싱아온댐옙.
			int sumMoney = cartService.sumMoney(userid);
			int fee = sumMoney >= 300000 ? 0 : 2500 ; 
			
			
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("sum", sumMoney+fee);
			map.put("list", list);
			map.put("count", list.size());
			mav.setViewName("shop/cart_list");
			
			
		
			
			
			mav.addObject("map", map);
			return mav;
			
		}else {
			return new ModelAndView("member/login");
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(int cart_id) {
		cartService.delete(cart_id);
		return "redirect:/shop/cart/list.do";
	}
	
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		
		if(userid !=null) {
			cartService.deleteAll(userid);
		}
		
		return "redirect:/shop/cart/list.do";
		
	}


	@RequestMapping("update.do")
	public String update(int[] amount,int[] cart_id,HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		
		if(userid == null) {
			return "redirect:/member/login.do";
		}
		for(int i=0; i<cart_id.length; i++) {  //카트 占쏙옙호 3占쏙옙占싸삼옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占� 0,1,2 占쏙옙占쏙옙 3占쏙옙 占쏙옙占� 占싸삼옙占� 占심띰옙占쏙옙占쏙옙
			if(amount[i]==0) {
				cartService.delete(cart_id[i]);
			}else {
			CartVo vo =new CartVo();
			vo.setMember_id(userid);
			vo.setCart_id(cart_id[i]);
			vo.setAmount(amount[i]);
			cartService.modify(vo); // 占쏙옙占쏙옙占쏙옙占쏙옙
			}
		}
		return "redirect:/shop/cart/list.do";
	}
	
	
	@RequestMapping("order.do")
	public ModelAndView order(HttpSession session,ModelAndView mav,HttpServletRequest request) throws IOException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sum1 = request.getParameter("sum");
		int sum = Integer.parseInt(sum1);
		
		String userid = (String) session.getAttribute("userid"); // 占쏙옙占실곤옙占쏙옙 占쏙옙占쏙옙占승댐옙 占쏙옙占실곤옙占쏙옙 占쏙옙占쌔쇽옙 占쏙옙占쏙옙트占쏙옙 占쏙옙占쏙옙瞞占쏙옙歐粹㏆옙占쏙옙占� 占쏙옙占쏙옙謎占쏙옙占� 占쏙옙占쏙옙求歐占�...
	//	String name = (String)session.getAttribute("name");
		
		if(userid !=null) {
			List<AllVo> list = cartService.list(userid);
			int sumMoney = cartService.sumMoney(userid);
			int fee = sumMoney >= 300000 ? 0 : 2500 ; 
			
			
			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("count", list.size());
			map.put("list", list);
			
			map.put("sum", sum);
			//map.put("name", name);
			map.put("list", list);
			System.out.println("list =" +list);
	        for(AllVo vo:list) {	
	        	
	           
	            System.out.println(vo.getMember_name());
	            System.out.println(vo.getProduct_code());
	            System.out.println(vo.getCart_id());
	            map.put("money", vo.getMoney());
	            map.put("name", vo.getMember_name());
	            map.put("phone", vo.getMember_phone());
	            map.put("code", vo.getProduct_code());
	            map.put("cart", vo.getCart_id());
	            map.put("product_name", vo.getProduct_name());
	            map.put("id", vo.getMember_id());
	            map.put("addr1",vo.getMember_addr1());
	            map.put("addr2",vo.getMember_addr2());
	            map.put("addr3",vo.getMember_addr3());
	            map.put("p1", vo.getMember_phone1());
	            map.put("p2", vo.getMember_phone2());
	            map.put("p3", vo.getMember_phone3());
	            
	            
	        }
	           //System.out.println("name =" + name);
	
	        
			mav.setViewName("/shop/cart_oder");
			
			mav.addObject("map",map);
			return mav;
		
			
		}else {
			return new ModelAndView("member/login");
		}
		
	
	}
}
