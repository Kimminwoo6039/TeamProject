package com.Ims.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.BoardVo;
import com.Ims.shop.vo.Criteria;




@Repository
public class BoardDao {
	
	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "board";
	
	@Autowired
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(BoardVo boardVo) {
		return sqlSession.insert(MAPPER+".insert", boardVo);
	}
	
	
	public BoardVo View(int bidx) {
		return sqlSession.selectOne(MAPPER+".View", bidx);
	}

	public void update(BoardVo boardVo) { 
		 
		 sqlSession.update(MAPPER+".update", boardVo);
	}
	public String file_info(int bidx) {
		return sqlSession.selectOne(MAPPER+".file_info",bidx);
	}
	public void delete(int bidx) {
		sqlSession.delete(MAPPER+".delete", bidx);
	}
	public List<BoardVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	public int BoardListCnt(Criteria cri){
		return sqlSession.selectOne(MAPPER+".BoardListCnt", cri);
	}
	
	public List<Map<String, Object>> boardlist(Criteria cri) throws Exception{
		return sqlSession.selectList(MAPPER+".boardlist",cri);
	}
	
}
