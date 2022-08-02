package com.Ims.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Ims.shop.service.AjaxService;



	
	@RestController //spring4버전부터 지원. @controller + responsebody 임
	public class AjaxController {
		
		private AjaxService ajaxService;
		
		@Autowired //자동 의존 주입: 생성자 방식
		public AjaxController(AjaxService ajaxService) {
			this.ajaxService = ajaxService;
		}
		
		// 코어라이브러리 , funtion 라이브러리 String 지원
		
		
		@RequestMapping("/checkId.do")
		//@ResponseBody // ajax 통신의 응답내용을 보내는것을 표시
		public String checkId(@RequestParam("member_id") String  member_id) {
			String result="N";
			
			int flag = ajaxService.checkId( member_id);
			
			if(flag == 1) result ="Y"; //중복된 아이디 있음
			
			return result;
		}
		
		
	}

