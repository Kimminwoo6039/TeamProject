package com.Ims.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.KaKaoDao;
import com.Ims.shop.dao.NaverDao;
import com.Ims.shop.vo.NaverVo;

@Service
public class NaverService {

	
private NaverDao naverDao;
	
	
	@Autowired
	public NaverService(NaverDao naverDao) {
		this.naverDao =naverDao;
	}
	
	
	
	public NaverVo findnaver(NaverVo vo) {
		NaverVo result = naverDao.findnaver(vo);
		
		if(result == null) {
		
			naverDao.insert(vo);
			return naverDao.findnaver(vo);
			
		}else {
			return result;
		}
		
		}
	}
	
	
	
	
	
	
	

