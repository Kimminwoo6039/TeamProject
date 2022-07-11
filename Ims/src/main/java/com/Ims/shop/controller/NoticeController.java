
package com.Ims.shop.controller;

import java.util.List;

import javax.activation.CommandMap;
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

	// 리스트 보기
	@RequestMapping(value = "/noticeList.do")
	public String openNoticeList(Model model) {

		List<NoticeVo> noticeList = noticeService.selectNoticeList();

		model.addAttribute("NoticeList", noticeList);

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NoticeList" + noticeList);

		return "notice/noticeList";
	}

	// 게시물 상세보기
	@RequestMapping(value = "noticeView.do/{n_bidx}")
	public String getNoticeView(@PathVariable("n_bidx") Integer n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

		return "notice/noticeView";
	}

	// 게시물 글쓰기
	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWite(HttpSession session, Model model) {

		return "notice/noticeWrite";
	}

	@RequestMapping(value = "/noticeWriteProcess.do")
	public String addNotice(NoticeVo noticeVo) {
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		int result = noticeService.addNotice(noticeVo);

		String viewPage = null;

		if (result == 1) {
			viewPage = "redirect:/noticeList.do";
		} else {
			viewPage = "notice/noticeWrite";
		}

		return viewPage;
	}

	// 게시물 수정하기
	@RequestMapping(value = "/noticeModify.do/{n_bidx}")
	public String getnoticeModify(@PathVariable("n_bidx") Integer n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + n_bidx);

		return "notice/noticeModify";
	}

	@RequestMapping("/noticeModifyProcess.do")
	public String getNoticeModifyProcess(NoticeVo noticeVo) {
	 
	System.out.println("수정페이지");
		
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