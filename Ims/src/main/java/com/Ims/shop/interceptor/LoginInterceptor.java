package com.Ims.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	// HandlerInterceptor �씤�꽣�럹�씠�뒪�뿉�꽌 JDK8 �씠�썑遺��꽣�뒗 3媛쒖쓽 硫붿냼�뱶瑜� �뵒�뤃�듃 硫붿냼�뱶濡� �젙�쓽�빐 �몺
	// preGandle(), postHandle(), afterCompletion()
	// �씠�뱾 媛��슫�뜲 �븘�슂�븳 硫붿냼�뱶瑜� Override�빐�꽌 �궗�슜�븿
		
	@Override	// �궗�슜�옄 �슂泥��씠 Controller濡� �쟾�떖�릺湲� �쟾�뿉 �슂泥��쓣 媛�濡쒖콈�뼱�꽌 硫붿냼�뱶 �떎�뻾
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("userid");
		
		if(member_id == null) {
			System.out.println("아이디가없습니다");
			response.sendRedirect(request.getContextPath()+"/member/login.do"); 
			return false;	// Controller濡� �궗�슜�옄 �슂泥��씠 �쟾�떖�릺吏� 紐삵븯�룄濡� �븿
		}
		
		
		
		
		return true;	// Controller濡� �궗�슜�옄 �슂泥��씠 �쟾�떖�릺寃� �븿
	}
	
	
	
	
	
}
