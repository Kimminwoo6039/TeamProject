package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.ReplyDao;
import com.Ims.shop.vo.CriteriaReply;
import com.Ims.shop.vo.MemberVo;
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
	
	public List<Map<String, Object>> list(CriteriaReply cri) throws Exception{
		return replyDao.list(cri);
	}
	
	
	
	public int cnt(CriteriaReply cri) {
		return replyDao.cnt(cri);
	}
	
	public double avg(CriteriaReply cri) {
		return replyDao.avg(cri);
	}
}
