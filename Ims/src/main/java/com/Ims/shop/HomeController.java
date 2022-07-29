package com.Ims.shop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		
		return "home";
	}
	
		
		
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
//		@RequestMapping(value = "/Message.do", method = RequestMethod.GET)
//		public String message(Locale locale, Model model) {
//			
//			
//			
//			return "message";
//}
		
		
		
		@RequestMapping("/cartlist")
		public String cart() {
			return "shop/cart_list";
		}
		
		
		@RequestMapping("/pay")
		public String pay() {
			return "pay";
		}
		
		@RequestMapping("/order")
		public String order() {
			return "order/order_main";
		}
		
		@RequestMapping("/home2.do")
		public String home1() {
			return "home2";
		}
		
		@RequestMapping("/home3.do")
		public String home3() {
			return "home3";
		}
		
		@RequestMapping("/home4.do")
		public String home4() {
			return "home4";
		}
		
		@RequestMapping("/kakao1")
		public String kakao() {
			return "kakao/login";
		}
		
		
		@RequestMapping("/product")
		public String dd() {
			return "shop/product_list1";
		}
		
}