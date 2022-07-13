package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingVo;

@Service
public class NoticeService {
	
	private NoticeDao noticeDao;
	
	@Autowired
	public NoticeService(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	//글쓰기
	public int addNotice(NoticeVo noticeVo) {
		int result = 0;	//글쓰기 실패
		
		result = noticeDao.addNotice(noticeVo);
		
		return result;
	}
	
	
	//리스트 보기
	public List<NoticeVo> selectNoticeList(PagingVo vo){
		
		return noticeDao.selectNoticeList(vo);
	}
	
	// 게시물 총 갯수
	public int countNotice() {
		return noticeDao.countNotice();
	}
	
	
	//글상세페이지보기
	public NoticeVo getNoticeView(Integer n_bidx) {
		return noticeDao.getNoticeView(n_bidx);
	}
	
	//글수정
	public NoticeVo getNoticeModify(Integer n_bidx) {
	
		
		return noticeDao.getNoticeModify(n_bidx);
		
	}

	
	public void getNoticeModifyProcess(NoticeVo noticeVo) {
		noticeDao.getNoticeModifyProcess(noticeVo);
	 }
	
	public void getNoticeDelete(Integer n_bidx) {
		noticeDao.getNoticeDelete(n_bidx);
	}


}
