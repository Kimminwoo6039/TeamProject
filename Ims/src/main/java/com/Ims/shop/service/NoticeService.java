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
	
	
//	//리스트 보기(페이징까지 완료)
	public List<NoticeVo> selectNoticeList(PagingVo pvo){
		
		return noticeDao.selectNoticeList(pvo);
	}
	
	// 게시물 총 갯수
	public int countNotice(PagingVo pvo) {
		return noticeDao.countNotice(pvo);
	}
	
	//리스트 보기
//	public List<PagingVo> selectNoticeList(String search_option,String keyword) throws Exception{
//		
//		return noticeDao.selectNoticeList(search_option,keyword);
//	}
//	
//	// 게시물 총 갯수
//	public int countNotice(String search_option, String keyword) {
//		return noticeDao.countNotice(search_option,keyword);
//	}
	
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
