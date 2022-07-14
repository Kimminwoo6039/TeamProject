
package com.Ims.shop.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Ims.shop.service.NoticeService;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingVo;
import com.Ims.shop.vo.SearchPagingVo;
import com.mysql.cj.protocol.x.Notice;
@RequestMapping(value = "/notice/")
@Controller
public class NoticeController {

	private NoticeService noticeService;

	@Autowired
	public NoticeController(NoticeService noticeService) {

		this.noticeService = noticeService;
	}
	
	
	
	
	
	@RequestMapping(value = "List.do")
	public String openNoticeList(PagingVo pvo, SearchPagingVo spvo, Model model
			, @RequestParam(value="nowPage", required = false)String nowPage
			, @RequestParam(value="cntPerPage", required = false)String cntPerPage) {
		
		
		
		
		int total = noticeService.countNotice(spvo);
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
		System.out.println("===============#####pvo : " + pvo);
		System.out.println("===============#####spvo : " + spvo);
		System.out.println("viewAll : " +noticeService.selectNoticeList(pvo));
		System.out.println("===============#####type : " + spvo.getType());
		System.out.println("===============#####keyword : " + spvo.getKeyword());
		
//		List<NoticeVo> noticeList = noticeService.selectNoticeList(vo);
//		model.addAttribute("NoticeList", noticeList);
		
//		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NoticeList" + noticeList);

		return "notice/noticePaging";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	/*
	 * // 리스트 보기(페이징처리까지 완료)
	 * 
	 * @RequestMapping(value = "List.do") public ModelAndView
	 * openNoticeList(PagingVo pvo, SearchPagingVo spvo, Model model
	 * , @RequestParam(value="nowPage", required = false)String nowPage // 원래 페이징
	 * , @RequestParam(value="cntPerPage", required = false)String cntPerPage
	 * , @RequestParam(value="title", required = false)String cntPerPage
	 * , @RequestParam(defaultValue="", required = false)String type
	 * , @RequestParam(defaultValue="", required = false)String keyword) throws
	 * Exception {
	 * 
	 * int total = noticeService.countNotice(pvo, type, keyword); if(nowPage == null
	 * && cntPerPage == null) { nowPage = "1"; cntPerPage = "10"; }else if(nowPage
	 * == null) { nowPage = "1"; }else if(cntPerPage == null) { cntPerPage = "10"; }
	 * int start = pvo.getStart(); int end = pvo.getEnd();
	 * 
	 * List<NoticeVo> list = noticeService.listAll(pvo, type,keyword, start, end);
	 * 
	 * pvo = new PagingVo(total, Integer.parseInt(nowPage),
	 * Integer.parseInt(cntPerPage)); spvo = new SearchPagingVo(type, keyword);
	 * model.addAttribute("paging", pvo); model.addAttribute("list", list);
	 * model.addAttribute("type", type); model.addAttribute("keyword", keyword);
	 * 
	 * System.out.println("===============#####pvo : " + pvo);
	 * System.out.println("===============#####type : " + type);
	 * System.out.println("===============#####keyword : " + keyword);
	 * 
	 * ModelAndView mav = new ModelAndView(); //자료를 보낼 페이지를 지정해야하고, 자료를 지정해야 하기 때문에
	 * //ModelAndView 객체를 생성한다.
	 * 
	 * HashMap<String,Object> map = new HashMap<>(); //여러개의 값들을 저장해야하기 때문에 hashmap()
	 * 객체를 생성 // map.put("list", list); //map에 자료 저장 map.put("total", total);
	 * map.put("PagingVo", pvo); //페이지 네비게이션을 위한 변수 map.put("type", type);
	 * map.put("keyword",keyword); mav.setViewName("notice/noticePaging"); //포워딩할 뷰의
	 * 이름 mav.addObject("map", map); //ModelAndView에 map을 저장
	 * 
	 * System.out.println("###################list : " +list);
	 * 
	 * return mav; // board/list.jsp로 이동
	 * 
	 * 
	 * 
	 * // return "notice/noticePaging"; }
	 */
	
	// 게시물 목록 + 페이징 + 검색
//	@RequestMapping("list.do") //세부적인 url pattern
//    public ModelAndView list(//RequestParam 값들을 받아오고, 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
//    		@RequestParam(value="nowPage", required = false)String nowPage,
//			@RequestParam(value="cntPerPage", required = false)String cntPerPage,
//    @RequestParam(defaultValue="") String search_option,
//    @RequestParam(defaultValue="1") String keyword)
//    //defaultValue를 설정하지 않으면 null point 에러가 발생할수 있기 때문에 기본값을 설정해주어야 한다.
//                        throws Exception{
//        //레코드 갯수 계산
//        int total = noticeService.countNotice(search_option,keyword);
//        
//        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장함
////        PagingVo pv = new PagingVo(total, nowPage, cntPerPage);
////        int start=pv.getStart();
////        int end=pv.getEnd();
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";	
//			cntPerPage = "10";
//		}else if(nowPage == null) {
//			nowPage = "1";
//		}else if(cntPerPage == null) {
//			cntPerPage = "10";
//		}
//        
//        //게시물 목록을 출력하기 위해 <BoardDTO>타입에 list변수에 게시물 목록관련 값들을 저장함.
//        //넣어야될 값들이 여러개 있으므로 haspmap.put 메소드를 사용해서 값들을 넣어서 list에 저장
//        PagingVo PagingVo = new PagingVo();
//        
//        List<PagingVo> viewAll= noticeService.selectNoticeList(search_option,keyword); //게시물 목록
//
//        System.out.println("viewAll:"+viewAll);
//        
//        ModelAndView mav=new ModelAndView(); //자료를 보낼 페이지를 지정해야하고, 자료를 지정해야 하기 때문에 
//                                                //ModelAndView 객체를 생성한다.
// 
//        HashMap<String,Object> map=new HashMap<>(); //여러개의 값들을 저장해야하기 때문에 hashmap() 객체를 생성
//        
//        map.put("viewAll", viewAll); //map에 자료 저장
//        map.put("total", total);
//        map.put("PagingVo", PagingVo); //페이지 네비게이션을 위한 변수
//        map.put("search_option", search_option);
//        map.put("keyword",keyword); 
//        mav.setViewName("notice/noticePaging"); //포워딩할 뷰의 이름
//        mav.addObject("map", map); //ModelAndView에 map을 저장
//        return mav; // board/list.jsp로 이동
//    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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