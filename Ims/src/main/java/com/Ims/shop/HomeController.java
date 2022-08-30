package com.Ims.shop;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		
		return "home";
	}
	
	@RequestMapping(value = "/home2.do", method = RequestMethod.GET)
	public String home2() {
		
		
		return "home2";
	}
	

	
		
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
//		@RequestMapping(value = "/Message.do", method = RequestMethod.GET)
//		public String message(Locale locale, Model model) {
//			
//			
//			
//			return "message";
//}
		
		
		
		@RequestMapping("/cartlist")
		public String cart() {
			return "shop/cart_list";
		}
		
		
		@RequestMapping("/pay")
		public String pay() {
			return "pay";
		}
		
		@RequestMapping("/order")
		public String order() {
			return "order/order_main";
		}
		
		@RequestMapping("/home2.do")
		public String home1() {
			return "home2";
		}
		
		@RequestMapping("/home3.do")
		public String home3() {
			return "home3";
		}
		
		@RequestMapping("/home4.do")
		public String home4() {
			return "home4";
		}
		
		@RequestMapping("/kakao1")
		public String kakao() {
			return "kakao/login";
		}
		
		
		@RequestMapping("/product")
		public String dd() {
			return "shop/product_list1";
		}
		
		@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			
	        /*
			 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
			 */
			
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String fileRoot = contextRoot+"resources/fileupload/";
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);	
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", "/shop/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				// 톰캣에 올릴때 경로 수정해주기
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			return a;
		}
		
		
}