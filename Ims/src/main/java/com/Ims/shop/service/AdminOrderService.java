package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.AdminOrderDao;
import com.Ims.shop.dao.OrderDao;
import com.Ims.shop.vo.Dio;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.OrderVo;

@Service
public class AdminOrderService {
	
	private AdminOrderDao adminorderDao;
	
	@Autowired
	public AdminOrderService(AdminOrderDao adminorderDao) {
	this.adminorderDao = adminorderDao;
	}
	
	
	
	public void modify(Map deliveryMap) throws Exception{
		adminorderDao.modify(deliveryMap);
	}
	
	
	public List<OrderVo> list(Dio dio){
		return adminorderDao.list(dio);
	}

	public int abc( ) {
		return adminorderDao.abc();
	}
	
	public int abc1( ) {
		return adminorderDao.abc1();
	}
	
	public int abc2( ) {
		return adminorderDao.abc2();
	}
	
	public int abc3( ) {
		return adminorderDao.abc3();
	}
}
