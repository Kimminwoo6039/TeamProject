
package com.Ims.shop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingVo;
import com.Ims.shop.vo.SearchPagingVo;
@RequestMapping(value = "/notice/")
@Controller
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public NoticeController(NoticeService noticeService) {

		this.noticeService = noticeService;
	}


	// 리스트 보기
	@RequestMapping(value = "List.do")
	public String openNoticeList(PagingVo pvo, SearchPagingVo spvo, Model model
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		int total = noticeService.countNotice(pvo);
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";	
			cntPerPage = "10";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		pvo = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", noticeService.selectNoticeList(pvo));
		System.out.println("===============#####vo : " + pvo);
		
//		List<NoticeVo> noticeList = noticeService.selectNoticeList(vo);
//		model.addAttribute("NoticeList", noticeList);
		
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NoticeList" + noticeList);

		return "notice/noticePaging";
	}

	// 게시물 상세보기
	@RequestMapping(value = "View.do/{n_bidx}")
	public String getNoticeView(@PathVariable("n_bidx") Integer n_bidx, Model model, PagingVo vo,
			@RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));
		
		model.addAttribute("paging", vo);
		
		return "notice/noticeView";  
		
		
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "Write.do")
	public String noticeWite(HttpSession session, Model model) {

		return "notice/noticeWrite";
	}

	@RequestMapping(value = "WriteProcess.do")
	public String addNotice(NoticeVo noticeVo) {
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		int result = noticeService.addNotice(noticeVo);

		String viewPage = null;

		if (result == 1) {
			viewPage = "redirect:List.do";
		} else {
			viewPage = "notice/noticeWrite";
		}

		return viewPage;
	}

	// 게시물 수정하기
	@RequestMapping(value = "Modify.do/{n_bidx}")
	public String getnoticeModify(@PathVariable("n_bidx") Integer n_bidx, Model model) {

		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));

	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + n_bidx);

		return "notice/noticeModify";
	}

	@RequestMapping("ModifyProcess.do")
	public String getNoticeModifyProcess(NoticeVo noticeVo, RedirectAttributes rttr) {
	 
		System.out.println("수정페이지");
		
		noticeService.getNoticeModifyProcess(noticeVo);
		
		return "redirect:List.do";
	}
	
	@RequestMapping("Delete.do/{n_bidx}")
	public String getNoticeDelete(@PathVariable("n_bidx") Integer n_bidx, RedirectAttributes rttr) {
						
		System.out.println("삭제 페이지");
		
		noticeService.getNoticeDelete(n_bidx);
		
		return "redirect:/notice/List.do";

}
	
	
	
	
	
	
}