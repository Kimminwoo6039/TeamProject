
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

import com.Ims.shop.service.BoardService;
import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.BoardVo;
import com.Ims.shop.vo.CriteriaBoard;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingBoard;
import com.Ims.shop.vo.QnaVo;
@RequestMapping(value = "/board/")
@Controller
public class BoardController {

	private BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {

		this.boardService = boardService;
	}
	
	
	@RequestMapping("{ct}/List.do")
	  public ModelAndView list(@PathVariable("ct") String ct,ModelAndView mav,CriteriaBoard cri) throws Exception{
	  System.out.println("cri = " + cri);
		
	  int BoardCnt = boardService.BoardListCnt(cri);
	  System.out.println("1번");
	  
	  PagingBoard pageMaker = new PagingBoard(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(BoardCnt);
	  System.out.println("2번");
	  List<Map<String, Object>> list = boardService.Boardlist(cri);
	  System.out.println("3번");
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	  mav.setViewName("/board/notice/List");
	  
	  System.out.println("list : " + list);
	  System.out.println("Criteria : " +cri);
	  System.out.println("pageMaker : " + pageMaker);
	  
	  return mav;
	  
	  }
	
	// 게시물 상세보기
	@RequestMapping(value = "notice/View.do/{bidx}")
	public ModelAndView View(@PathVariable("bidx") Integer bidx, ModelAndView mav,BoardVo vo) {
		
		mav.setViewName("/board/notice/noticeView");
		mav.addObject("vo", boardService.View(bidx));
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFile1());
		
		return mav;  
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "Write.do")
	public String Write(HttpServletRequest request, BoardVo boardVo) {

		return "/board/notice/noticeWrite";
	}

	@RequestMapping(value = "notice/WriteProcess.do")
	public String addNotice(BoardVo boardVo, HttpServletRequest request
			) {
		
		// ---파일 업로드 관련 --
		
		String filename = "-";
		if(!boardVo.getFile1().isEmpty()) {
			filename = boardVo.getFile1().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				boardVo.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
                 e.printStackTrace();
			}
			
			
			
		}
		boardVo.setFilename(filename);
		boardService.insert(boardVo);
		return "redirect:/board/notice/List.do";
	}



	
	@RequestMapping("notice/Modify.do/{bidx}")
	public ModelAndView getnoticeModify(@PathVariable("bidx") Integer bidx, ModelAndView mav, HttpServletRequest request, BoardVo vo) {

		mav.setViewName("/board/notice/noticeModify");
		mav.addObject("vo", boardService.View(bidx));
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>getnoticeModify<<<<<<<<<<<<<<<<<<<<<<<<<<<<" + bidx);

		return mav;
	}

	@RequestMapping("notice/update.do")
	public String update(BoardVo vo, HttpServletRequest request) {
	 
		System.out.println("수정 처리 페이지");
		
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
		
		boardService.update(vo);
		return "redirect:/board/notice/List.do";
	}
	
	
	
	@RequestMapping("notice/Delete.do/{bidx}")
	public String getNoticeDelete(@PathVariable("bidx") Integer bidx, HttpServletRequest request, BoardVo vo) {
						
		System.out.println("삭제");
		
		String filename = boardService.file_info(bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		
		boardService.delete(bidx);
		
		return "redirect:/board/notice/List.do";

}
	//qna
	
	
	
	
	
	
	
	
	
}