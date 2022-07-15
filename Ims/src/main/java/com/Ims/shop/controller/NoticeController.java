
package com.Ims.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.Paging;
@RequestMapping(value = "/notice/")
@Controller
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public NoticeController(NoticeService noticeService) {

		this.noticeService = noticeService;
	}
	
	
	@RequestMapping("List.do")
	  public ModelAndView list(ModelAndView mav,Criteria cri) throws Exception{
	  
	  int NoticeCnt = noticeService.NoticeListCnt(cri);
	  
	  Paging pageMaker = new Paging(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(NoticeCnt);
	  
	  List<Map<String, Object>> list = noticeService.Noticelist(cri);
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	  mav.setViewName("/notice/noticeListPaging");
	  
	  System.out.println("list : " + list);
	  System.out.println("Criteria : " +cri);
	  System.out.println("pageMaker : " + pageMaker);
	  
	  return mav;
	  
	  }
	
	// 게시물 상세보기
	@RequestMapping(value = "View.do/{n_bidx}")
	public ModelAndView View(@PathVariable("n_bidx") Integer n_bidx, ModelAndView mav,NoticeVo vo) {
		
		mav.setViewName("notice/noticeView");
		mav.addObject("vo", noticeService.View(n_bidx));
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFile1());
		
		return mav;  
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "Write.do")
	public String noticeWite(HttpServletRequest request, NoticeVo noticeVo) {

		return "notice/noticeWrite";
	}

	@RequestMapping(value = "WriteProcess.do")
	public String addNotice(NoticeVo noticeVo, HttpServletRequest request
			) {
		
		// ---파일 업로드 관련 --
		
		String filename = "-";
		if(!noticeVo.getFile1().isEmpty()) {
			filename = noticeVo.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				noticeVo.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
                 e.printStackTrace();
			}
			
			
			
		}
		noticeVo.setFilename(filename);
		noticeService.addNotice(noticeVo);
		return "redirect:/notice/List.do";
	}



	// 게시물 수정하기
//	@RequestMapping(value = "Modify.do/{n_bidx}")
//	public String getnoticeModify(@PathVariable("n_bidx") Integer n_bidx, Model model, HttpServletRequest request) {
//
//		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));
//
//	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + n_bidx);
//
//		return "notice/noticeModify";
//	}
//
//	@RequestMapping("ModifyProcess.do")
//	public String getNoticeModifyProcess(NoticeVo noticeVo, RedirectAttributes rttr) {
//	 
//		System.out.println("수정페이지");
//		
//		noticeService.getNoticeModifyProcess(noticeVo);
//		
//		return "redirect:List.do";
//	}
//	
	
	@RequestMapping("Modify.do/{n_bidx}")
	public ModelAndView getnoticeModify(@PathVariable("n_bidx") Integer n_bidx, ModelAndView mav, HttpServletRequest request, NoticeVo vo) {

		mav.setViewName("notice/noticeModify");
		mav.addObject("vo", noticeService.View(n_bidx));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + n_bidx);

		return mav;
	}

	@RequestMapping("update.do")
	public String update(NoticeVo vo, HttpServletRequest request) {
	 
		System.out.println("수정페이지");
		
		// ---파일 업로드 관련 --
		
		String filename = "-";
		if(!vo.getFile1().isEmpty()) {
			filename = vo.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
                 e.printStackTrace();
			}
			vo.setFilename(filename);
			
			
		}
		
		noticeService.update(vo);
		return "redirect:/notice/List.do";
	}
	
	
	
	@RequestMapping("Delete.do/{n_bidx}")
	public String getNoticeDelete(@PathVariable("n_bidx") Integer n_bidx, HttpServletRequest request, NoticeVo vo) {
						
		System.out.println("삭제");
		
		String filename = noticeService.file_info(n_bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		
		noticeService.delete(n_bidx);
		
		return "redirect:/notice/List.do";

}
	
	
	
	
	
	
}