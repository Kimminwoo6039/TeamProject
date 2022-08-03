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
		// userInfo �� Ÿ���� kakao vo �� ���� �� import
		
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.getK_name());
		System.out.println("###email#### : " + userInfo.getK_email());
		
		
		
		// �Ʒ� �ڵ尡 �߰��Ǵ� ����
//		session.invalidate();
		// �� �ڵ�� session��ü�� ��� ������ �ʱ�ȭ �ϴ� �ڵ�.
		session.setAttribute("name", userInfo.get("nickname"));
		session.setAttribute("userid", userInfo.get("email"));
		// �� 2���� �ڵ�� �г��Ӱ� �̸����� session��ü�� ��� �ڵ�
		// jsp���� ${sessionScope.kakaoN} �̷� �������� ����� �� �ִ�.
	    
	    // ���ϰ��� �뵵�� �°� �����ϼ���~
		
		
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
