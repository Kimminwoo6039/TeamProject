package com.Ims.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.dao.ReplyDao;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.ReplyVo;

@Service
public class ReplyService {
	
	private ReplyDao replyDao;
	
	@Autowired
	public ReplyService(ReplyDao replyDao) {
		this.replyDao=replyDao;
	}
	
	
	public int insert(ReplyVo vo) {
		return replyDao.insert(vo);
	}
	
	
}
