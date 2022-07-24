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
	
	public void joinProcess(MemberVo vo) {
		
		memberDao.joinProcess(vo);
	}

	
	
	public MemberVo list(String userid) {
		return memberDao.list(userid);
	}
	
	
	public int memberdelete(MemberVo vo){
		return memberDao.memberdelete(vo);
	}
	
	public int delete(String userid) {
		return memberDao.delete(userid);
	}
}

