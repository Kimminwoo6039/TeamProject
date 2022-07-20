
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
public class BoardController{

	private BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {

		this.boardService = boardService;
	}
	
	
	@RequestMapping("{ct}/List.do")
	  public ModelAndView list(
			  @PathVariable("ct") String ct, @RequestParam(value="keyword", defaultValue = "") String keyword,
			  @RequestParam(value="type", defaultValue = "") String type, ModelAndView mav,CriteriaBoard cri) throws Exception{
	  System.out.println("cri = " + cri);
	
		
	  int BoardCnt = boardService.BoardListCnt(cri);
	  System.out.println("1번");
	  
	  PagingBoard pageMaker = new PagingBoard(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(BoardCnt);
	  System.out.println("2번");
	  List<Map<String, Object>> list = boardService.Boardlist(cri);
	  System.out.println("3번");
	  
	  mav.addObject("ct_idx", cri.getCt_idx());
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	  mav.addObject("type", type);
	  mav.addObject("keyword", keyword);
	  mav.setViewName("/board/notice/List");
	  
	  System.out.println("list : " + list);
	  System.out.println("Criteria : " +cri);
	  System.out.println("pageMaker : " + pageMaker);
	  System.out.println("####################type : "+cri.getType());
	  System.out.println("####################keyword : "+cri.getKeyword());
	  return mav;
	  
	  }
	
	// 게시물 상세보기
	@RequestMapping(value = "{ct}/View.do/{bidx}/{ct_idx}")
	public String View(@PathVariable("ct") String ct, @PathVariable("bidx") Integer bidx,
			@PathVariable("ct_idx") String ct_idx,BoardVo vo, CriteriaBoard cri, Model mav,
			@RequestParam(value="keyword", defaultValue = "") String keyword, 
			@RequestParam(value="type", defaultValue = "") String type,
			@RequestParam(value="PerPageNum", defaultValue = "10") Integer PerPageNum,
			@RequestParam(value="page", defaultValue = "1") Integer page) {
		
		int BoardCnt = boardService.BoardListCnt(cri);
		PagingBoard pageMaker = new PagingBoard(); 
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(BoardCnt);
		pageMaker.getCri().setPerPageNum(PerPageNum);
		pageMaker.getCri().setPage(page);
		
		mav.addAttribute("vo", boardService.View(bidx));
		mav.addAttribute("pageMaker", pageMaker);
		mav.addAttribute("type", cri.getType());
		mav.addAttribute("keyword", cri.getKeyword());
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFile1());
		
		if(ct_idx == "0") {

			return "/board/notice/noticeView";
		}else if(ct_idx == "1") {
			
			return "/board/qna/qnaView";
		}
		return "board/notice/noticeView";
		
	}

	// 게시물 글쓰기
	@RequestMapping(value = "{ct}/Write.do")
	public ModelAndView Write(@PathVariable("ct") String ct, HttpServletRequest request, BoardVo boardVo, ModelAndView mav) {
		
		if(ct == "notice") {
			mav.setViewName("/board/notice/Write");
		}else if(ct == "qna") {
			mav.setViewName("/board/qna/Write");
		}
		return mav;
	}

	@RequestMapping(value = "{ct}/WriteProcess.do")
	public String insert(@PathVariable("ct") String ct,BoardVo boardVo, HttpServletRequest request
			) {
		
		// ---파일 업로드 관련 --
		System.out.println("#########################writeP");
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
		
		if(boardVo.getCt_idx() == 0) {
			System.out.println("#############ct_idx = 0");
			return "redirect:/board/notice/List.do";
		}else if(boardVo.getCt_idx() == 1) {
			System.out.println("#############ct_idx = 1");
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}
		System.out.println("#############ct_idx = ????");
		return "redirect:/board/notice/List.do";
	}



	
	@RequestMapping("{ct}/Modify.do/{bidx}/{ct_idx}")
	public String Modify(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx, @PathVariable("ct_idx") String ct_idx, Model mav, HttpServletRequest request, BoardVo vo) {
		
		
		
		
		
		mav.addAttribute("vo", boardService.View(bidx));
		
		
		if(vo.getCt_idx() == 0) {

			return "/board/notice/noticeModify";
		}else if(vo.getCt_idx() == 1) {
			
			return "/board/qna/qnaModify";
		}
		return "board/notice/noticeModify";
		
	}

	@RequestMapping("{ct}/update.do")
	public String update(@PathVariable("ct") String ct, BoardVo vo, HttpServletRequest request) {
	 
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
		if(vo.getCt_idx() == 0) {
			return "redirect:/board/notice/List.do";
		}else if(vo.getCt_idx() ==1) {
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}
		return "redirect:/board/notice/List.do";
		
	}
	
	
	
	@RequestMapping("{ct}/Delete.do/{bidx}/{ct_idx}")
	public String Delete(@PathVariable("ct") String ct,@PathVariable("bidx") Integer bidx, @PathVariable("ct_idx") String ct_idx,HttpServletRequest request, BoardVo vo) {
						
		System.out.println("###################삭제 페이지");
		
		String filename = boardService.file_info(bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		
		boardService.delete(bidx);
		if(vo.getCt_idx() ==0) {
			System.out.println("###################공지사항삭제 ct_idx :"+ ct_idx);
			return "redirect:/board/notice/List.do";
		}else if(vo.getCt_idx() ==1) {
			System.out.println("###################qna삭제 ct_idx :"+ ct_idx);
			return"redirect:/board/qna/List.do?ct=qna&ct_idx=1";
		}
		return "redirect:/board/notice/List.do";

}
	
	
	
	
	
	
	
	
	
	
}