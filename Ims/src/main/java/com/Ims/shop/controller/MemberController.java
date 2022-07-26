package com.Ims.shop.controller;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.dao.MemberDao;
import com.Ims.shop.service.CertifiedPhoneNumber;
import com.Ims.shop.service.MemberService;
import com.Ims.shop.service.ProductService;
import  com.Ims.shop.vo.*;

@Controller
@RequestMapping("member/*")
public class MemberController {

	
private MemberService memberService;
private CertifiedPhoneNumber certifiedPhoneNumber;
private MemberDao memberDao;
@Autowired
public MemberController(MemberService memberService,CertifiedPhoneNumber certifiedPhoneNumber,MemberDao memberDao) {
	this.memberService = memberService;
	this.certifiedPhoneNumber = certifiedPhoneNumber ;
	this.memberDao = memberDao ;
}

private MemberService member;



@RequestMapping("login.do")
public String login() {
	return "signup/login";
}


@RequestMapping("login_check.do")
public ModelAndView login_check(MemberVo vo,HttpSession session,ModelAndView mav) {
	
	String name = memberService.login(vo);
	
	if(name != null) {
		session.setAttribute("userid", vo.getMember_id());
		System.out.println("userid="+vo.getMember_id());
		session.setAttribute("name", name);
		System.out.println("name="+ name );
		mav.setViewName("redirect:/");
	
	}else {
		mav.setViewName("signup/login");
	
	}
	return mav;
			
}
	

@RequestMapping("logout.do")

public ModelAndView logout(HttpSession session, ModelAndView mav) {

session.invalidate();
mav.setViewName("redirect:/");
return mav;

}

@RequestMapping("join.do")

public String join()

{
	return "signup/join";
}

@RequestMapping("joinProcess.do")

public String joinProcess(MemberVo memberVo) {
	
	 memberService.joinProcess(memberVo);
	return "home";
}


@RequestMapping("/sendSMS1.do")
@ResponseBody	
	public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
		
		  System.out.println("�닔�떊�옄 踰덊샇 : " + phoneNumber); System.out.println("�씤利앸쾲�샇 : " +
		  numStr);
		  certifiedPhoneNumber.certifiedPhoneNumber(phoneNumber, numStr);
		 
		  return numStr;
    }


@PostMapping("checkId.do")
@ResponseBody //Ajax�넻�떊�쓽 �쓳�떟�궡�슜�쓣 蹂대궡�뒗 寃껋쓣 �몴�떆
public String checkId(@RequestParam("member_id") String id) {
	
	System.out.println("id: "+id);
	
	String result="N";//以묐났�맂 �븘�씠�뵒 �뾾�쓬
	
	//int flag = memberService.checkId(id);
	
	//if(flag == 1) result = "Y";//以묐났�맂 �븘�씠�뵒 �엳�쓬
	
	return result;
}


@RequestMapping("list.do")
public String list1(HttpSession session,Model model) {
	
	String userid = (String) session.getAttribute("userid");
	
	model.addAttribute("list", memberService.list(userid));
	
	return "order/order_main_member";
	
}




@RequestMapping(value = "/pwFindForm.do")
public String pwFindForm() {
	return "member/pwFindForm";
}



	@RequestMapping(value = "/pwFindForm_ok.do")
	public String pwFindForm_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int flag = 2;
		
		MemberVo membervo = new MemberVo();

		String id = request.getParameter("id");
		String mail = request.getParameter("mail");
		
		membervo.setMember_id(id);
		membervo.setMember_email(mail);
		
		int result_lookup = memberDao.pwFind_Lookup(membervo);
		if (result_lookup == 1) { // 회원있음
//			System.out.println("lookup : " + result_lookup);
			
			//메일확인
			int pwFind_ok = memberDao.pwFind_ok(membervo);
//			System.out.println("pwFind_ok : " + pwFind_ok);
		
			if (pwFind_ok == 1) { // 메일 일치
				membervo = memberDao.pwFind_select(membervo);
				
				// 표시될 비밀번호를 pwd에 담음
			
//				System.out.println("getPwd : " + userTo.getPwd());
				
				request.setAttribute("pwd", membervo.getMember_pw());
				request.setAttribute("id", id);
				
			} else if(pwFind_ok==0) { // 메일x
				flag = 1;
				
			} else {	// 기타오류
				flag = 3;
			}
		} else if (result_lookup == 0) { // 회원없음
			flag = 2;
		} else { // 기타오류
			flag = 3;
		}
		request.setAttribute("flag", flag);

		return "member/pwFindForm_ok";
	}

}

