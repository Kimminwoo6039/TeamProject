package com.Ims.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.AdminDao;
import com.Ims.shop.dao.MemberDao;
import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

@Service
public class MemberService {

	private MemberDao memberDao;
	
	@Autowired
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	
	public String login(MemberVo vo) {
		
		return memberDao.login(vo);
	}
	
	
	
}
