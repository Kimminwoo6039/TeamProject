package com.Ims.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Ims.shop.service.AjaxService;


	@RestController //spring4踰꾩쟾遺��꽣 吏��썝. @controller + responsebody �엫
	public class AjaxController {
		
		private AjaxService ajaxService;
		
		@Autowired //�옄�룞 �쓽議� 二쇱엯: �깮�꽦�옄 諛⑹떇
		public AjaxController(AjaxService ajaxService) {
			this.ajaxService = ajaxService;
		}
		
		// 肄붿뼱�씪�씠釉뚮윭由� , funtion �씪�씠釉뚮윭由� String 吏��썝
		
		
<<<<<<< HEAD
		@RequestMapping("/checkId.do")
		//@ResponseBody // ajax 통신의 응답내용을 보내는것을 표시
		public String checkId(@RequestParam("member_id") String  member_id) {
=======
		@RequestMapping("/checkId.do")		
		public String checkId(@RequestParam("member_id") String id) {
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
			String result="N";
			
			int flag = ajaxService.checkId( member_id);
			
			System.out.println("flagf=??");
			
			if(flag == 1) result ="Y"; //以묐났�맂 �븘�씠�뵒 �엳�쓬
			
			System.out.println("falg="+flag);
			
			return result;
		}
		
		
	}

