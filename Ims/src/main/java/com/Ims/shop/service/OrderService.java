package com.Ims.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.dao.OrderDao;
import com.Ims.shop.vo.Dio;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@Service
public class OrderService {
	
	private OrderDao orderDao;
	
	@Autowired
	public OrderService(OrderDao orderDao) {
	this.orderDao = orderDao;
	}
	
	
	
	public void cancel(String order_idx) {
		orderDao.cancel(order_idx);
	}
	
	
	public List<OrderVo> list(Dio dio){
		return orderDao.list(dio);
	}

	
	public int abc(String userid) {
		return orderDao.abc(userid);
	}
	
	public int abc1(String userid) {
		return orderDao.abc1(userid);
	}
	
	public int abc2(String userid) {
		return orderDao.abc2(userid);
	}
	
	public int abc3(String userid) {
		return orderDao.abc3(userid);
	}
}
