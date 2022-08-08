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
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.CartVo;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

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
		
		//  로그인 세션값을 가져온다 !!!!
		String userid = (String) session.getAttribute("userid");
		
		// 로그인 여부에따라서 페이지 이디오 다르게함
		
		if(userid == null) {  // 로그인이 안되어있으면 세션값이 등록이 안되어있으면 한다.
			return "redirect:/member/login.do";
		}else {
			vo.setMember_id(userid);   // 세션값인 아이디 값을 유저 아이디값을 저장한다. roof 돌릴려고
			cartService.insert(vo);
			return "redirect:/shop/cart/list.do";
			
		}
		

		
	}
	

	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session,ModelAndView mav,HttpServletRequest request) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); // 여러개의 값을 저장해서 출력해야 하기때문에 해쉬맵을 사용.....
		String userid = (String) session.getAttribute("userid"); // 세션값을 가져온다 세션갑셍 의해서 리스트를 출력해야하기때문에 사용자별로 사용하니깐...
		
		System.out.println("userid =" +userid);
		
		if(userid != null) {
			List<AllVo> list = cartService.list(userid); //로그인 되어있으면 로그인회원에대한 모든 정보를 뽑아온다.
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
		for(int i=0; i<cart_id.length; i++) {  //카트 번호 3번인사람을 예로 들면 0,1,2 지나 3번 사람 인사람 될때동안
			if(amount[i]==0) {
				cartService.delete(cart_id[i]);
			}else {
			CartVo vo =new CartVo();
			vo.setMember_id(userid);
			vo.setCart_id(cart_id[i]);
			vo.setAmount(amount[i]);
			cartService.modify(vo); // 수량변경
			}
		}
		return "redirect:/shop/cart/list.do";
	}
	
	
	@RequestMapping("order.do")
	public ModelAndView order(HttpSession session,ModelAndView mav,HttpServletRequest request) throws IOException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sum1 = request.getParameter("sum");
		int sum = Integer.parseInt(sum1);
		
		String userid = (String) session.getAttribute("userid"); // 세션값을 가져온다 세션갑셍 의해서 리스트를 출력해야하기때문에 사용자별로 사용하니깐...
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
	        	System.out.println(vo.getMember_id());
	        	System.out.println(vo.getMember_phone());
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
