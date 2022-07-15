
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
	  System.out.println("Paging : " + pageMaker);
	  
	  return mav;
	  
	  }
	
	// 게시물 상세보기
	@RequestMapping(value = "View.do/{n_bidx}")
	public String getNoticeView(@PathVariable("n_bidx") Integer n_bidx, Model model, Criteria cri,
			@RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		model.addAttribute("noticeView", noticeService.getNoticeView(n_bidx));
		
		model.addAttribute("paging", cri);
		
		return "notice/noticeView";  
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "Write.do")
	public String noticeWite(HttpSession session, Model model) {

		return "notice/noticeWrite";
	}

	@RequestMapping(value = "WriteProcess.do")
	public String addNotice(NoticeVo noticeVo, HttpServletRequest request
		//	, MultipartHttpServletRequest files, Model model
			) {
		// 요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		// 이러한 객체를 커맨드 객체라고 함.
		// ---파일 업로드 관련 --
//		String uploadFolder = "c\\test\\upload";
//		List<MultipartFile> list = files.getFiles("files");
//		for(int i = 0; i<list.size(); i++) {
//			String fileRealName = list.get(i).getOriginalFilename();
//			long size = list.get(i).getSize();
//			
//			System.out.println("파일명 : " + fileRealName);
//			System.out.println("사이즈 : " + size);
//			
//			File saveFile = new File(uploadFolder + "\\" + fileRealName);
//			
//			noticeVo.getList().
//			try {
//				list.get(i).transferTo(saveFile);
//			}catch (IllegalStateException e) {
//				// TODO Auto-generated catch block
//				printStackTrace();
//			}catch (IOException e) {
//				// TODO Auto-generated catch block
//				printStackTrace();
//			}
//			
//			
//		}
		
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
			
			noticeVo.setFilename(filename);
			
		}
		
		// ---파일 업로드 관련--
		int result = noticeService.addNotice(noticeVo);

		String viewPage = null;

		if (result == 1) {
	//		model.addAttribute("message" , "글 등록 완료.");
	//		model.addAttribute("SearchUrl" , "/notice/noticeListPaging");
			viewPage = "redirect:List.do";
		} else {
			viewPage = "notice/noticeWrite";
	//		model.addAttribute("message" , "글 등록 실패.");
	//		model.addAttribute("SearchUrl" , "/notice/noticeWrite");
		}

		return viewPage;
	//	return "Message";
	}

//	private void printStackTrace() {
//		// TODO Auto-generated method stub
//		
//	}


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