
package com.Ims.shop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	  @GetMapping("/noticeList.do") 
	  public String getNoticeList(Model model, HttpSession session) {
	 
	  // String member_idx = (String) session.getAttribute("member_idx");
	  
	  List<NoticeVo> noticeList = noticeService.getNoticeList();
	  
	  model.addAttribute("noticeList", noticeList);
	 
	  return "notice/noticeList"; }
	 

	/*
	 * @Resource(name="noticeService") private NoticeService noticeService;
	 * 
	 * @RequestMapping(value="/notice/noticeList")
	 * public ModelAndView opennoticeList(CommandMap commandMap) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView("/notice/noticeList");
	 * 
	 * List<Map<String,Object>> list = noticeService.selectNoticeList(commandMap);
	 * mav.addObject("list", list); return mav; }
	 */

	@RequestMapping("noticeView.do") // noticeView.do? n_bidx= ${noticeVo.n_bidx} 에서
										// ㄴ해당 부분을 없애고
										// /로 대체할 수 있다.
										// 그 후 Controller에서 "noticeView.do" 를
										// "noticeView.do/{n_bidx}" 로 변경하였음

	// public String getNoticeView(Model model, NoticeVo noticeVo) {//원래 있던것
	public String getNoticeView(Integer n_bidx, Model model) { // 내가 수정한것
		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

		return "notice/noticeView";
	}

	@RequestMapping("/noticeWrite.do")
	public String noticeWite(HttpSession session, Model model) {

		return "notice/noticeWrite";
	}

	@RequestMapping("/noticeWriteProcess.do")
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

	@RequestMapping("/noticeModify.do")
	public String getnoticeModify(int n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeModify(n_bidx));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" +n_bidx);
		/*
		 * mav.setViewName("notice/notice"); mav.addObject("noticeModify",
		 * noticeService.getNoticeModify(n_bidx));
		 */
	

		return "notice/noticeModify";
	}
	
	/*
	 * @RequestMapping("/notice.do") public String notice() { return
	 * "notice/notice"; }
	 */
	

	@RequestMapping("/noticeModifyProcess.do")
	public String getNoticeModifyProcess(NoticeVo noticeVo) {
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		int result = noticeService.getNoticeModifyProcess(noticeVo);

		String viewPage = null;

		if (result == 1) {
			viewPage = "redirect:/noticeView.do";
		} else {
			viewPage = "notice/noticeModify";
		}

		return viewPage;
	}

}