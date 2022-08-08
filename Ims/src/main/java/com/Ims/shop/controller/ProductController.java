package com.Ims.shop.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
		  return "shop/product_write"; // 占쏙옙품占쏙옙占� 占쏙옙占쏙옙占쏙옙
	  }
	
	@RequestMapping("insert.do")
	public String write(ProductVo vo,HttpServletRequest request) {
		
		System.out.println("ddd" +vo.getFile1());
		System.out.println("ddd" +vo.getFile2());
		System.out.println("ddd" +vo.getFile3());
		
		
		
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
	public ModelAndView detail(@PathVariable("product_code") int product_code,ModelAndView mav,CriteriaReply cri,
			@RequestParam(value = "brand", defaultValue = "") String brand, ProductVo vo,HttpSession session){
		
		try {
			
			String userid = (String) session.getAttribute("userid");
			System.out.println("userid = " +userid);
			
			ZzimVo zv = new ZzimVo();
			zv.setLike_brand(brand);
			zv.setLike_id(product_code);
			zv.setMember_id(userid);
			
			System.out.println("brand ="+ zv.getLike_brand());
			System.out.println("product_code ="+zv.getLike_id());
			System.out.println("member_id ="+zv.getMember_id());
			
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			
			map1.put("brand", zv.getLike_brand());
			map1.put("member_id", userid);
			map1.put("pd", zv.getLike_id());
			
			
			
		
			
			List<Map<String, Object>> map = productService.selectzzim(map1);
			
	//		map.add(map1);
		
//			List<ZzimVo> zvlist = new ArrayList<ZzimVo>(); 
			System.out.println(";;;111");

			System.out.println(";;;112222222222222222221");
			
			mav.setViewName("/shop/product_detail");
			mav.addObject("vo", productService.detail(product_code));
			mav.addObject("top5", productService.top5());
			System.out.println(";;;113333333331");
			/*
			 * mav.addObject("zv", map);
			 */
			System.out.println("#########zv="+zv);
			
			System.out.println(";;;1144444444444441");
			List<Map<String, Object>> list = replyService.list(cri);
			
			
			double avg = replyService.avg(cri);
			
			System.out.println("avg="+avg);
			
			
			int result = productService.selectzzim2(map1);
			    
			    
			System.out.println("#######################result:"+result);
			    
			mav.addObject("avg", avg);
			
			mav.addObject("list", list);
			mav.addObject("maplist", map);
			mav.addObject("count", result);
			
			System.out.println("cri = " + cri);
			int replycnt = replyService.cnt(cri);
		
			System.out.println("replycnt =" +replycnt);
			
			PagingReply pageMaker = new PagingReply();
			
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(replycnt);
			
			System.out.println("pageMaker =" + pageMaker);
			
		    mav.addObject("pageMaker", pageMaker);
		    
		    
		    
		  


			
		
			
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return mav;
		
	
	}
	@RequestMapping("insertzzim.do")
	@ResponseBody
	public String detailzzim(/* HashMap<String, Object> map */
			@RequestParam(value = "member_id", required=false) String member_id ,
			@RequestParam("product_code") int product_code,
			@RequestParam(value="brand", required=false) String brand, ProductVo vo,Model model
			) {
		
		System.out.println("##################李쒖컻李쒖컻李쒖컻李쒖컻李�");
		
		ZzimVo zv = new ZzimVo();
		zv.setLike_brand(brand);
		zv.setLike_id(product_code);
		zv.setMember_id(member_id);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", zv.getMember_id());
		map.put("brand", zv.getLike_brand());
		map.put("product_code", zv.getLike_id());
		map.put("zv", zv);
		
		
		
		System.out.println("@@@@@@@@@@@@@@@zv.getLike_brand() : "+zv.getLike_brand());
		System.out.println("@@@@@@@@@@@@@@@zv.getLike_id() : "+zv.getLike_id());
		System.out.println("@@@@@@@@@@@@@@@zv.getMember_id() : "+zv.getMember_id());
		System.out.println("############################"+map.get("member_id")+" + "+map.get("brand")+" + "+map.get("product_code"));
		
		if(map.get("member_id") == null) {
			return "N";
			
		}
//		else if(map.get("member_id") == zv.getMember_id()){
//			productService.selectzzim(map);
//			map.put("member_id", zv.getMember_id());
//			map.put("brand", zv.getLike_brand());
//			map.put("product_code", zv.getLike_id());
//			System.out.println("################# DB�뿉 �떞寃⑥엳�뒗 媛� : " + zv.getLike_id() + zv.getLike_brand() + zv.getLike_id());
//		}

		int result = productService.zzim(map);	
		
		if(result == 1) {
			System.out.println("###################result : "+result);
		//	productService.selectzzim(map);
			model.addAttribute("zv", map);
			return "Y";
		}else {
			System.out.println("###################result : "+result);
			return "N";
		}
			
			
	
	}
	@RequestMapping("deletezzim.do")
	
	@ResponseBody
	public String deletezzim(@RequestParam(value = "member_id", required=false) String member_id ,
			@RequestParam("product_code") int product_code,
			 ProductVo vo) {
		System.out.println("################## 李쒖궘�젣");

		ZzimVo zv = new ZzimVo();
		zv.setLike_id(product_code);
		zv.setMember_id(member_id);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", zv.getMember_id());
		map.put("product_code", zv.getLike_id());
		map.put("zv", zv);
		
		
		
		System.out.println("@@@@@@@@@@@@@@@zv.getLike_id() : "+zv.getLike_id());
		System.out.println("@@@@@@@@@@@@@@@zv.getMember_id() : "+zv.getMember_id());
		System.out.println("############################"+map.get("member_id")+" + "+map.get("brand")+" + "+map.get("product_code"));
		
		if(map.get("member_id") == null) {
			return "N";
			
		}
//		else if(map.get("member_id") == zv.getMember_id()){
//			productService.selectzzim(map);
//			map.put("member_id", zv.getMember_id());
//			map.put("brand", zv.getLike_brand());
//			map.put("product_code", zv.getLike_id());
//			System.out.println("################# DB�뿉 �떞寃⑥엳�뒗 媛� : " + zv.getLike_id() + zv.getLike_brand() + zv.getLike_id());
//		}

		int result = productService.deletezzim(map);	
		
		if(result == 1) {
			System.out.println("###################result : "+result);
		//	productService.selectzzim(map);
			
			return "Y";
		}else {
			System.out.println("###################result : "+result);
			return "N";
		}
			
		
		
		
	}
	@RequestMapping("deletezzim2.do/{zzim_idx}")
	//@ResponseBody
	public String deletezzim2(@PathVariable("zzim_idx") int zzim_idx, HttpSession session
			) {
		System.out.println("################## 李쒖궘�젣");
		String member_id = (String) session.getAttribute("userid");
		System.out.println("@@@@@@@@@@@@@zzim_idx = " +zzim_idx);
		
		int result = productService.deletezzim2(zzim_idx);

		if(result == 1) {
			
			return "redirect:/mypage/zzimlist.do";
		}else {
			
			return "redirect:/mypage/zzimlist.do";
		}
	}
}
