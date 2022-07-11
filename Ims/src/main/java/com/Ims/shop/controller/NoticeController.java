
package com.Ims.shop.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.NoticeVo;

@Controller
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public NoticeController(NoticeService noticeService) {

		this.noticeService = noticeService;
	}

//	@RequestMapping("/noticeList") 

	// 由ъ뒪�듃 蹂닿린
	@RequestMapping(value = "/noticeList.do")
	public String openNoticeList(Model model) {

		List<NoticeVo> noticeList = noticeService.selectNoticeList();

		model.addAttribute("NoticeList", noticeList);

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NoticeList" + noticeList);

		return "notice/noticeList";
	}

	// 寃뚯떆臾� �긽�꽭蹂닿린
	@RequestMapping(value = "noticeView.do/{n_bidx}")
	public String getNoticeView(@PathVariable("n_bidx") Integer n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

		return "notice/noticeView";  
		
		
		
	}

	// 寃뚯떆臾� 湲��벐湲�
	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWite(HttpSession session, Model model) {

		return "notice/noticeWrite";
	}

	@RequestMapping(value = "/noticeWriteProcess.do")
	public String addNotice(NoticeVo noticeVo) {
		// �슂泥�留ㅽ븨�씠 �엳�뒗 硫붿냼�뱶�쓽 留ㅺ컻蹂��닔�뿉 Vo�굹 �옄諛뷀겢�옒�뒪媛� �엳�뒗 寃쎌슦 �쟾�떖�맂 媛믪쓣 洹� 媛앹껜�뿉 留ㅽ븨�떆耳쒖쨲
		// �씠�윭�븳 媛앹껜瑜� 而ㅻ㎤�뱶 媛앹껜�씪怨� �븿.
		int result = noticeService.addNotice(noticeVo);

		String viewPage = null;

		if (result == 1) {
			viewPage = "redirect:/noticeList.do";
		} else {
			viewPage = "notice/noticeWrite";
		}

		return viewPage;
	}

	// 寃뚯떆臾� �닔�젙�븯湲�
	@RequestMapping(value = "/noticeModify.do/{n_bidx}")
	public String getnoticeModify(@PathVariable("n_bidx") Integer n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + n_bidx);

		return "notice/noticeModify";
	}

	@RequestMapping("/noticeModifyProcess.do")
	public String getNoticeModifyProcess(NoticeVo noticeVo) {
	 
	System.out.println("�닔�젙�럹�씠吏�");
		
	noticeService.getNoticeModifyProcess(noticeVo);
	return "home";	
		
	}
	

	/*
	 * @RequestMapping(value="/noticeModify.do", method=RequestMethod.POST) public
	 * ModelAndView boardUpdatePOST(CommandMap commandMap) throws Exception{
	 * 
	 * ModelAndView mv = new ModelAndView("redirect:/notice/noticeView");
	 * mv.addObject("n_bidx", commandMap.get("n_bidx"));
	 * 
	 * noticeService.updateboard(commandMap.getMap());
	 * 
	 * 
	 * return mv; }
	 */
	
	
	
}