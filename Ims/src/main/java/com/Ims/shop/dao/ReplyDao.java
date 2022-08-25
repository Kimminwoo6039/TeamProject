package com.Ims.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.CriteriaReply;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.ReplyVo;

@Repository
public class ReplyDao {
	

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "reply";
	
	@Autowired
	public ReplyDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	
	public int insert(ReplyVo vo) {
	
		
		return sqlSession.insert(MAPPER+".insert", vo);
	}
	
	public List<Map<String, Object>> list(CriteriaReply cri) throws Exception{
		return sqlSession.selectList(MAPPER+".list",cri);
	}
	
	
	public int cnt(CriteriaReply cri) {
		return sqlSession.selectOne(MAPPER+".cnt", cri);
	}
	
	public double avg(CriteriaReply cri) {
		return sqlSession.selectOne(MAPPER+".avg",cri);
	}
}
