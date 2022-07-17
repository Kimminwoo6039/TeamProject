package com.Ims.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.QnaVo;

@Repository
public class QnaDao {
	
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "qna";
	
	@Autowired
	public QnaDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(QnaVo qnaVo) {
		return sqlSession.insert(MAPPER+".insert", qnaVo);
	}
	
	public QnaVo View(int q_bidx) {
		return sqlSession.selectOne(MAPPER+".View", q_bidx);
	}
	
	public void update(QnaVo qnaVo) { 
		 sqlSession.update(MAPPER+".update", qnaVo);
	}
	
	public String file_info(int q_bidx) {
		return sqlSession.selectOne(MAPPER+".file_info",q_bidx);
	}
	public void delete(int q_bidx) {
		sqlSession.delete(MAPPER+".delete", q_bidx);
	}
	public List<QnaVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	public int QnaListCnt(Criteria cri){
		return sqlSession.selectOne(MAPPER+".QnaListCnt", cri);
	}
	
	public List<Map<String, Object>> qnalist(Criteria cri) throws Exception{
		return sqlSession.selectList(MAPPER+".Qnalist",cri);
	}
	
	
	
	
	
}
