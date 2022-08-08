package com.Ims.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Ims.shop.dao.BoardDao;
import com.Ims.shop.vo.BoardVo;
import com.Ims.shop.vo.CriteriaBoard;

@Service
public class BoardService {
	
	private BoardDao boardDao;
	
	@Autowired
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	//글쓰기
	public int insert(BoardVo boardVo) {
		int result = 0;	//글쓰기 실패
		
		result = boardDao.insert(boardVo);
		
		return result;
	}
	
	

	
	
	
	
	//리스트 보기
	public List<BoardVo> list(){
		
		return boardDao.list();
	}
	
	public int BoardListCnt(CriteriaBoard cri){     
		return boardDao.BoardListCnt(cri);
	}
	
	
	public List<Map<String, Object>> Boardlist(CriteriaBoard cri) throws Exception{
		return boardDao.Boardlist(cri);
		
	}
	
	//글상세페이지보기
	public BoardVo View(BoardVo vo) {
		return boardDao.View(vo);
	}
	
	//글수정
	public void update(BoardVo boardVo) {
		boardDao.update(boardVo);
	}
	
	public String file_info(int bidx) {
		return boardDao.file_info(bidx);
	}
	public void delete(Integer bidx) {
		boardDao.delete(bidx);
	}


}
