package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.NoticeDao;
import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.SearchPagingVo;

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
//	public List<PagingVo> selectNoticeList(String search_option,String keyword) throws Exception{
//		
//		return noticeDao.selectNoticeList(search_option,keyword);
//	}
//	
//	// 게시물 총 갯수
//	public int countNotice(String search_option, String keyword) {
//		return noticeDao.countNotice(search_option,keyword);
//	}
	
	
	
	//리스트 보기
	public List<NoticeVo> list(){
		
		return noticeDao.list();
	}
	
	public int NoticeListCnt(Criteria cri){
		return noticeDao.NoticeListCnt(cri);
	}
	
	
	public List<Map<String, Object>> Noticelist(Criteria cri) throws Exception{
		return noticeDao.noticelist(cri);
	}
	
	//글상세페이지보기
	public NoticeVo View(Integer n_bidx) {
		return noticeDao.View(n_bidx);
	}
	
	//글수정
	public void update(NoticeVo noticeVo) {
		noticeDao.update(noticeVo);
	}
	
	public String file_info(int n_bidx) {
		return noticeDao.file_info(n_bidx);
	}
	public void delete(Integer n_bidx) {
		noticeDao.delete(n_bidx);
	}


}
