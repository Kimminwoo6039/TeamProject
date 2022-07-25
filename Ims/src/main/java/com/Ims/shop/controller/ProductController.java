package com.Ims.shop.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Ims.shop.service.ProductService;
import com.Ims.shop.service.ReplyService;
import  com.Ims.shop.vo.*;

@Controller
@RequestMapping("/shop/product/*")
public class ProductController {

	
	private ProductService productService;
	private ReplyService replyService; 
	
	
	@Autowired
	public ProductController(ProductService productService,ReplyService replyService) {
		this.productService = productService;
		this.replyService = replyService;
	}
	
	
	  @RequestMapping("write.do")
	  public String write() {
		  return "shop/product_write"; // 상품등록 페이지
	  }
	
	@RequestMapping("insert.do")
	public String write(ProductVo vo,HttpServletRequest request) {
		
		
		
		
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
		
		String filename1 = "-";
		if(!vo.getFile2().isEmpty()) {
			filename1 = vo.getFile2().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFile2().transferTo(new File(path+filename1));
			} catch (Exception e) {
                 e.printStackTrace();
			}
		}
		
		vo.setFilename1(filename1);
		
		String filename2 = "-";
		if(!vo.getFile3().isEmpty()) {
			filename2 = vo.getFile3().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFile3().transferTo(new File(path+filename2));
			} catch (Exception e) {
                 e.printStackTrace();
			}
		}
		
		vo.setFilename2(filename2);
		
		System.out.println("###="+vo.getFilename());
		System.out.println("###="+vo.getFilename1());
		System.out.println("###="+vo.getFilename2());
		
		productService.insert(vo);
		return "redirect:/shop/product/list.do";
		
		
	}
	
	
	/*
	 * @RequestMapping("list.do") public ModelAndView list(ModelAndView mav) {
	 * mav.setViewName("/shop/product_list"); mav.addObject("list",
	 * productService.list()); return mav; }
	 */

	
	
	  
	  @RequestMapping("list.do")
	  public ModelAndView list(ModelAndView mav,Criteria cri) throws Exception{
	  System.out.println("cri = " + cri);
		  
	  int ProductCnt = productService.ProductListCnt(cri);
	  
	  Paging pageMaker = new Paging(); 
	  pageMaker.setCri(cri);
	  pageMaker.setTotalCount(ProductCnt);
	  
	  List<Map<String, Object>> list =productService.Productlist(cri);
	  mav.addObject("list", list); 
	  mav.addObject("pageMaker", pageMaker);
	  mav.setViewName("/shop/product_list");
	  
	 
	 String product_code = list.get(0).get("product_code").toString();
	 
	System.out.println("zzzzzzzzz =" + product_code);
	  
	  
	  return mav;
	  
	  }
	  
	  
	  
	  
	 
	
	
	
	
	
	
	
	@RequestMapping("edit/{product_code}")
	public ModelAndView edit(@PathVariable("product_code") int product_code,ModelAndView mav) {
		mav.setViewName("/shop/product_edit");
		mav.addObject("vo", productService.detail(product_code));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(ProductVo vo,HttpServletRequest request) {
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
		
		String filename1 = "-";
		if(!vo.getFile2().isEmpty()) {
			filename1 = vo.getFile2().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFile2().transferTo(new File(path+filename1));
			} catch (Exception e) {
                 e.printStackTrace();
			}
		}
		
		vo.setFilename1(filename1);
		
		String filename2 = "-";
		if(!vo.getFile3().isEmpty()) {
			filename2 = vo.getFile3().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFile3().transferTo(new File(path+filename2));
			} catch (Exception e) {
                 e.printStackTrace();
			}
		}
		
		vo.setFilename2(filename2);
	
		
		System.out.println("###="+vo.getFilename());
		System.out.println("###="+vo.getFilename1());
		System.out.println("###="+vo.getFilename2());
		
		
		productService.update(vo);
		return "redirect:/shop/product/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(Integer product_code,HttpServletRequest request) {
		
		String filename = productService.file_info(product_code);
		
		if(filename !=null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
			
		}
		
		productService.delete(product_code);
		return "redirect:/shop/product/list.do";
	}
	
	@RequestMapping("detail/{product_code}")
	public ModelAndView detail(@PathVariable("product_code") int product_code,ModelAndView mav,CriteriaReply cri) throws Exception{
		mav.setViewName("/shop/product_detail");
		mav.addObject("vo", productService.detail(product_code));
		mav.addObject("top5", productService.top5());
	
		List<Map<String, Object>> list = replyService.list(cri);
		
		
	
		
		double avg = replyService.avg(cri);
		
		System.out.println("avg="+avg);
		
		mav.addObject("avg", avg);
		
		mav.addObject("list", list);
		
		
		System.out.println("cri = " + cri);
		int replycnt = replyService.cnt(cri);
	
		System.out.println("replycnt =" +replycnt);
		
		PagingReply pageMaker = new PagingReply();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(replycnt);
		
		System.out.println("pageMaker =" + pageMaker);
		
	    mav.addObject("pageMaker", pageMaker);
		
		
		return mav;
	}
	
	

	
}
