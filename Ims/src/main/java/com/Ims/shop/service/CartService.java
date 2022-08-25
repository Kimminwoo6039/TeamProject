package com.Ims.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.CartDao;
import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.CartVo;
import com.Ims.shop.vo.MemberVo;

@Service
public class CartService {
	
	private CartDao cartDao;
	
	@Autowired
	public CartService(CartDao cartDao) {
		this.cartDao = cartDao;
	}
	
	
	
	public void insert(CartVo vo) {
		cartDao.insert(vo);
	}

	
	public List<AllVo> list(String userid){
		return cartDao.list(userid);
	}
	
	
	public int sumMoney(String userid) {
		return cartDao.sumMoney(userid);
	}
	
	public void delete(int cart_id) {
		cartDao.delete(cart_id);
	}
	
	
	public void deleteAll(String userid) {
		cartDao.deleteAll(userid);
	}
	
	   public void modify(CartVo vo) {
	    	  cartDao.modify(vo);
	      }
}
