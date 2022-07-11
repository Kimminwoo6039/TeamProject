package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@Repository
public class PayDao {
	
	//MyBatisÎ•? ?ù¥?ö©?ï¥?Ñú DB?ûë?óÖ: SqlSession Í∞ùÏ≤¥ ?ïÑ?öî
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "pay";
	
	@Autowired
	public PayDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	
	public void insert(OrderVo vo) {
		 sqlSession.selectOne(MAPPER+".insert", vo);
	}
	
	
}
