package com.Ims.shop.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.QnaService;
import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.Paging;
import com.Ims.shop.vo.QnaVo;

@RequestMapping(value="/qna/")
@Controller
public class QnaController {
	
	private QnaService qnaService;
	
	@Autowired
	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	
	@RequestMapping("List.do")
	public ModelAndView list(ModelAndView mav, Criteria cri) throws Exception{
		
		int QnaCnt = qnaService.QnaListCnt(cri);
		
		Paging pageMaker = new Paging();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(QnaCnt);
		
		List<Map<String, Object>> list = qnaService.Qnalist(cri);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("/qna/qnaList");
		
		System.out.println("list : " + list);
		System.out.println("Criteria : " +cri);
		System.out.println("pageMaker : " + pageMaker);
		
		return mav;
	}
	
	//게시물 상세보기
	@RequestMapping(value ="View.do/{q_bidx}")
	public ModelAndView View(@PathVariable("q_bidx") Integer q_bidx, ModelAndView mav, QnaVo vo) {
		
		mav.setViewName("qna/qnaView");
		mav.addObject("vo", qnaService.View(q_bidx));
		System.out.println("filename : "+ vo.getFilename());
		System.out.println("file1 : "+ vo.getFile1());
		
		
		return mav;
	}
	
	// 게시물 글쓰기
	@RequestMapping(value = "Write.do")
	public String write(HttpServletRequest request, QnaVo vo) {
		return "qna/qnaWrite";
	}
	
	@RequestMapping(value="writeProcess.do")
	public String insert(QnaVo vo, HttpServletRequest request) {
		
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
			
			
		}
		
		vo.setFilename(filename);
		qnaService.insert(vo);
		
		return "redirect:/qna/List.do";
	}
	
	// 게시물 수정
	@RequestMapping("Modify.do/{q_bidx}")
	public ModelAndView modify(@PathVariable("q_bidx") Integer q_bidx, ModelAndView mav, HttpServletRequest request, Qnavo vo ){
		
		mav.setViewName("qna/qnaModify");
		mav.addObject("vo", qnaService.View(q_bidx));
		System.out.println("============#################getnoticeModify" + q_bidx);

		
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(QnaVo vo, HttpServletRequest request) {
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
	
	qnaService.update(vo);
	return "redirect:/qna/List.do";
	
	}
	
	@RequestMapping("Delete.do/{q_bidx}")
	public String delete(@PathVariable("q_bidx") Integer q_bidx, HttpServletRequest request, QnaVo vo) {
		
		System.out.println("삭제");
		
		String filename = qnaService.file_info(q_bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		qnaService.delete(q_bidx);
		return "redirect:/qna/List.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
