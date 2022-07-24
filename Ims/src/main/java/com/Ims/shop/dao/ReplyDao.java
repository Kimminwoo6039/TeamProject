package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
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
	
	public List<ReplyVo> list(int product_code) {
		return sqlSession.selectList(MAPPER+".list",product_code);
	}
	
	
}
