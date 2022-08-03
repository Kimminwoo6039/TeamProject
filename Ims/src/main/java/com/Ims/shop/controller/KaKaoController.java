package com.Ims.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Ims.shop.service.KaKaoService;
import com.Ims.shop.vo.KakaoVo;
import com.mysql.cj.Session;

@Controller
public class KaKaoController {

private KaKaoService kaKaoService;
	
	
	@Autowired
	public KaKaoController(KaKaoService kaKaoService) {
		this.kaKaoService = kaKaoService;
	}
	
	
	
	
	@RequestMapping(value = "/kakao.do")
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session,Model model){
		System.out.println("####### " + code);
		
		String access_Token = kaKaoService.getAccessToken(code);
		KakaoVo userInfo = kaKaoService.getuserinfo(access_Token);
		// userInfo 의 타입을 kakao vo 로 변경 및 import
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getK_name());
		System.out.println("###email#### : " + userInfo.getK_email());
		
		
		
		// 아래 코드가 추가되는 내용
//		session.invalidate();
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("name", userInfo.get("nickname"));
		session.setAttribute("userid", userInfo.get("email"));
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
	    
	    // 리턴값은 용도에 맞게 변경하세요~
		
		
		model.addAttribute("message", "kakao");
		return "redirect:/";
		
		
		

	}
	
	@RequestMapping("/kakaologout.do")
	public String name(HttpSession session,Model model) {
		session.invalidate();
		
		model.addAttribute("message", "kakaologout");
		return "redirect:/";
	}
}
