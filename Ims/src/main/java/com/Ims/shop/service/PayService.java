package com.Ims.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.dao.PayDao;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@Service
public class PayService {
	
	private PayDao payDao;
	
	@Autowired
	public PayService(PayDao payDao) {
		this.payDao = payDao;
	};
	
	
	public void insert(OrderVo vo) {
		payDao.insert(vo);
	}
	
	
	
}
