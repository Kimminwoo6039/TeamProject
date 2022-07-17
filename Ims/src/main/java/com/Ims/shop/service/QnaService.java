package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.QnaDao;
import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.QnaVo;

@Service
public class QnaService {
	
	private QnaDao qnaDao;
	
	@Autowired
	public QnaService(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}
	
	//글쓰기
	public int insert(QnaVo qnaVo) {
		int result = 0;	//글쓰기 실패
		
		result = qnaDao.insert(qnaVo);
		
		return result;
	}
	
	//리스트 보기
	public List<QnaVo> list(){
		return qnaDao.list();
	}
	
	public int QnaListCnt(Criteria cri){       //��ǰ ����
		return qnaDao.QnaListCnt(cri);
	}
	
	public List<Map<String, Object>> Qnalist(Criteria cri) throws Exception{
		return qnaDao.qnalist(cri);
	}
	
	//글상세페이지보기
	public QnaVo View(Integer q_bidx) {
		return qnaDao.View(q_bidx);
	}
	//글수정
	public void update(QnaVo qnaVo) {
		qnaDao.update(qnaVo);
	}
	
	public String file_info(int q_bidx) {
		return qnaDao.file_info(q_bidx);
	}
	
	public void delete(Integer q_bidx) {
		qnaDao.delete(q_bidx);
	}
	
	
	
	
	
	
	
	
	
	
	
}
